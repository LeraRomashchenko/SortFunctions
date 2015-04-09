package GraphMod;
use TimeMod;
use SortMod;
use GenMod;
use Win32::Console::ANSI;
sub graphTimesuperrand {
	open F, '>', "GraphInfo1.tvs";
	for my $i(1..100) {
		my @t=();
		my @fun=("TimeMod::timeBubble","TimeMod::timeShell","TimeMod::timeInsert","TimeMod::timeSelect","TimeMod::timeHeap","TimeMod::timeQuick","TimeMod::timeSort");
		@t = map ((&$_(&GenMod::superrand($i)))*10000,@fun);
		my @m=&GenMod::superrand($i);
		push(@t,(&TimeMod::timeMerge(\@m,0,$#m))*10000);
		@t = map(join (',',split(/\./,$t[$_])),0..7);
		print F "$i\t$t[0]\t$t[1]\t$t[2]\t$t[3]\t$t[4]\t$t[5]\t$t[6]\t$t[7]\n";
		@t=undef;
	}
	
	close F;
}
sub graphTimeInd {
	print "Введите имя файла:\n";
	my $file=<STDIN>;
	chomp $file;
	$file.=".tvs";
	print "Введите количество элементов массива:\n";
	my $n=<STDIN>;
	print "Введите имя функции - одна из·:\nBubble\nShell\nInsert\nSelect\nHeap\nQuick\nMerge\nSort(встроенная)\n";
	my $fun=<STDIN>;
	chomp $fun;
	$fun="TimeMod::time".$fun;
	open F, ">$file";
	for my $i(1..$n) {
		my $t=join ',',split (/\./,((&$fun(&GenMod::superrand($i)))*10000));
		print F "$i\t$t\n";
	}
	close F;
}

sub graphPermutationInd {
	print "Введите имя файла:\n";
	my $file=<STDIN>;
	chomp $file;
	$file.=".tvs";
	print "Введите количество элементов массива:\n";
	my $n=<STDIN>;
	print "Введите имя функции - одна из:\nbubble\nshellsort\ninsertsort\nselectsort\nheapsort\nquicksort\nmergesort\n";
	my $fun=<STDIN>;
	chomp $fun;
	$fun="SortMod::".$fun;
	open F, ">$file";
	for my $i(1..$n) {
		my $t;
		if ($fun ne "SortMod::mergesort") {
			$t=join ',',split (/\./,&$fun(&GenMod::superrand($i)));
		} else {
			@m=&GenMod::superrand($i);
			$t=join ',',split (/\./,&$fun(\@m,0,$#m));
			undef @m;
		}
		print F "$i\t$t\n";
	}
	close F;
}
sub graphPermutation {
	open F, '>', "GraphInfo2.tvs";
	for my $i(1..100) {
		my @t=();
		my @fun=("SortMod::bubble","SortMod::shellsort","SortMod::insertsort","SortMod::selectsort","SortMod::heapsort","SortMod::quicksort");
		@t = map ((&$_(&GenMod::superrand($i))),@fun);
		my @m=&GenMod::superrand($i);
		push(@t,&SortMod::mergesort(\@m,0,$#m));
		@t = map(join (',',split(/\./,$t[$_])),0..7);
		print F "$i\t$t[0]\t$t[1]\t$t[2]\t$t[3]\t$t[4]\t$t[5]\t$t[6]\t$t[7]\n";
		@t=undef;
	}
	close F;
}
1;