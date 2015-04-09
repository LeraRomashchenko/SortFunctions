package TimeMod;
use SortMod;
use Benchmark;
use Benchmark qw(:all);
use Benchmark ":hireswallclock";
sub timeBubble {
	my $t0 = Benchmark->new;
	&SortMod::bubble(@_);
	my $t1 = Benchmark->new;
	my $td = timediff($t1, $t0);
	my @t = split(/\s/,timestr($td));
    print "The Bubble Sort took: ",$t[0]," microseconds\n";
	return $t[0];
}
sub timeShell {
	my $t0 = Benchmark->new;
	&SortMod::shellsort(@_);
	my $t1 = Benchmark->new;
	my $td = timediff($t1, $t0);
	my @t = split(/\s/,timestr($td));
    print "The Shell Sort took: ",$t[0]," microseconds\n";
	return $t[0];
}
sub timeInsert {
	my $t0 = Benchmark->new;
	&SortMod::insertsort(@_);
	my $t1 = Benchmark->new;
	my $td = timediff($t1, $t0);
	my @t = split(/\s/,timestr($td));
    print "The Insert Sort took: ",$t[0]," microseconds\n";
	return $t[0];
}
sub timeSelect {
	my $t0 = Benchmark->new;
	&SortMod::selectsort(@_);
	my $t1 = Benchmark->new;
	my $td = timediff($t1, $t0);
	my @t = split(/\s/,timestr($td));
    print "The Select Sort took: ",$t[0]," microseconds\n";
	return $t[0];
}
sub timeHeap {
	my $t0 = Benchmark->new;
	&SortMod::heapsort(@_);
	my $t1 = Benchmark->new;
	my $td = timediff($t1, $t0);
	my @t = split(/\s/,timestr($td));
    print "The Heap Sort took: ",$t[0]," microseconds\n";
	return $t[0];
}
sub timeQuick {
	my $t0 = Benchmark->new;
	&SortMod::quicksort(@_);
	my $t1 = Benchmark->new;
	my $td = timediff($t1, $t0);
	my @t = split(/\s/,timestr($td));
    print "The Quick Sort took: ",$t[0]," microseconds\n";
	return $t[0];
}
sub timeMerge {
	my $t0 = Benchmark->new;
	&SortMod::mergesort(@_,0,$#_);
	my $t1 = Benchmark->new;
	my $td = timediff($t1, $t0);
	my @t = split(/\s/,timestr($td));
    print "The Merge Sort took: ",$t[0]," microseconds\n";
	return $t[0];
}
sub timeSort {
	my $t0 = Benchmark->new;
	sort {$a <=>$b} @_;
	my $t1 = Benchmark->new;
	my $td = timediff($t1, $t0);
	my @t = split(/\s/,timestr($td));
    print "The Build Sort took: ",$t[0]," microseconds\n";
	return $t[0];
}
1;