package SortMod;
my $co=0;
sub bubble {
	for my $i(0..$#_) {
		for my $j($i..$#_) {
		if ($_[$i]>=$_[$j]) {
			($_[$i],$_[$j])=($_[$j],$_[$i]);
			$co++;
			}
		}
	}
	return $co;
}
sub shellsort {
	my $k=0;
	my @dist;
	$dist[0]=int(scalar(@_)/2);
	while($dist[$k]>1) {	#заполняем массив расстояний
		$k++;
		$dist[$k]=int($dist[$k-1]/2);}
	for(0..($k)) { #бежим по этому массиву
		my $st=$dist[$_];				
		for my $j($st..scalar(@_)-1) {
			my $t=$_[$j]; #опорный элемент 
			my $p=$j-$st; 
			while(($p>=0)&&($t<$_[$p])) {
				$_[$p+$st]=$_[$p];
				$p=$p-$st;
				$co++;
				}
			$_[$p+$st]=$t;}
	}
	return $co;
}
sub insertsort {
	for my $i(0..$#_) {
		my $k=$_[$i];
		my $j=$i-1;
		while (($j>=0)&&($_[$j]>$k)) {
				$_[$j+1]=$_[$j];
				$j--;
				$co++;
			}
			$_[$j+1]=$k;
		}
	return $co;
}

sub selectsort {
	for my $i(0..$#_) {  
		my $k=$i; 
		my $min=$_[$i];
		for my$j($i+1..$#_)	{
			if ($_[$j]<$min) {
				$k=$j; 
				$min=$_[$j];
				$co++;
			}
		}
		$_[$k] = $_[$i]; 
		$_[$i] = $min; 
	}
	return $co;
}
sub downHeap {
	my ($n,$k)=(pop,pop);
	my ($new_elem,$child)=($_[$k]);
	while($k<=$n/2) { 
		$child = 2*$k;
		$child++ if ($child<$n&&$_[$child]<$_[$child+1]);
		last if ($new_elem>=$_[$child]);
		$_[$k]=$_[$child]; 
		$k=$child;
  }
  $_[$k] = $new_elem;
}
sub heapsort {
  my $i;
  for ($i=$#_/2-1; $i >= 0; $i--) {&downHeap(@_,$i,$#_-1)};
  for($i=$#_; $i>0; $i--) { 
	($_[$i],$_[0])=($_[0],$_[$i]);
    &downHeap(@_, 0, $i-1); 
  }
}
sub quicksort {
	my ($i, $j, $lb, $ub,$ppos,$prop,$temp,$pos);
	my @left=(), 
	my @right=(); 
	($pos,$left[1],$right[1])=(1,0,$#_); 
  while ($pos) {
    ($lb,$ub)=($left[$pos],$right[$pos]);
    $pos--;
     while ($lb<$ub) {
      $ppos=($lb+$ub)>>1;
      ($i,$j,$prop)=($lb,$ub,$_[$ppos]); 
      while ( $i<=$j) {
        while ($_[$i]<$prop) {$i++};
        while ($prop<$_[$j]) {$j--};
			if ($i<=$j) {
				$co++;
				($_[$i],$_[$j])=($_[$j],$_[$i]); 
				$i++; 
				$j--;
        }
      }
      if ($i<$ppos) {     
        if ($i<$ub) { 
			$co++;
			$pos++;
			($left[$pos],$right[$pos])=($i,$ub);
        }
        $ub=$j;            
      } else {   
        if ($j>$lb) { 
			$co++;
			$pos++;
			($left[$pos],$right[$pos])= ($lb,$j);
        }
        $lb=$i;
      }
    }  
  }
  return $co;
}

sub mergesort	{
	my($mas, $left, $right)=@_;
	if($right>$left){	
		my @a;
		my$mid=int(($right+$left)/2);
		mergesort($mas,$left,$mid);
        mergesort($mas,$mid+1,$right);
		my $j=0;
		for (my $i=$left;$i<=$right;){
			$a[$j++]=$mas->[$i++];
		}
		if ($mid>$right) {
			$mid=int(($left+$right)/2);
            }
		my $n=$mid-$left+1;
		$j=0;
		my $k=$n;
		for (my $i=$left; $i<=$right; $i++) {
			if (($j<$n)&&(($k==(($right-$left)+1))||($a[$j]<$a[$k]))) { 
				$co++;
				$mas->[$i]=$a[$j++]
			} 
			else { 
				$co++;
				$mas->[$i]=$a[$k++]
			}
		}
	}
	return $co;
}
1;