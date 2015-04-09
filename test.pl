my @ma;
sub genIntLittle {
	print "Enter the number of elements of massive:\n";
	my $n=<>;
	for my $i(0..$n) {
		$m[$i]=int(rand(100));
	}
	return @m;
}

my @ma=genIntLittle;
print "@ma","\n";
&heapSort(@ma);
print "@ma";