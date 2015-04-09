package GenMod;
use Win32::Console::ANSI;
sub genIntLittle {
	my $n;
	if ($_[0]) {$n=$_[0];
	} else {
	print "¬ведите количество элементов массива:\n";
	$n=<STDIN>;
	$n=10 if ($n eq "\n");}
	my @m=map(int(rand(100)),0..$n);
	return @m;
}

sub genIntBig {
	my $n;
	if ($_[0]) {
		$n=$_[0];
	} else {
	print "¬ведите количество элементов массива:\n";
	$n=<STDIN>;
	if ($n eq "\n") {
		$n=10;
	}}
	my @m;
	for my$i(0..$n) {
		$m[$i]=int(rand(10000000));
	}
	return @m;
}

sub genLittle {
	my $n;
	if ($_[0]) {
		$n=$_[0];
	} else {
	print "¬ведите количество элементов массива:\n";
	$n=<STDIN>;
	if ($n eq "\n") {
		$n=10;
	}}
	my @m;
	for my$i(0..$n) {
		$m[$i]=rand(100);
	}
	return @m;
}

sub genBig {
	my $n;
	if ($_[0]) {
		$n=$_[0];
	} else {
	print "¬ведите количество элементов массива:\n";
	$n=<STDIN>;
	if ($n eq "\n") {
		$n=10;
	}}
	my @m;
	for my$i(0..$n) {
		$m[$i]=rand(10000000);
	}
	return @m;
}

sub superrand {
	my$n;
	if ($_[0]) {
		$n=$_[0];
	} else {
	print "¬ведите количество элементов массива:\n";
	$n=<STDIN>;
	if ($n eq "\n") {
		$n=10;
	}}
	my @m;
	for my$i(0..$n) {
		$m[$i]=rand(rand(rand(rand(10000000))));
	}
	return @m;
}
1;