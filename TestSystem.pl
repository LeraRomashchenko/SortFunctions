use SortMod;
use GenMod;
use TimeMod;
use GraphMod;
use 5.010;
use Win32::Console::ANSI;
my @mas=();
my $co;
sub choosesort {
	print "����� �������� �� ������ �������?\n1)���������� ����������� �������\n2)���������� �����\n3)���������� ���������\n4)���������� �������\n5)������������� ����������\n6)������� ����������\n7)C��������� ��������\n8)���������� ���������� ��������\n";
	my $ans=<STDIN>;
	return $ans;
}
sub choosedata {
print "�� ����� ���� ������ �� ������ ��������� ����������?\n1)����������� ������\n2)������ ��������� ����� �����\n3)������� ����� �����\n4)��������� ������������ �����\n5)������� ������������ �����\n6)��������� �����(�������� ������� �����������)\n";
my $b=<STDIN>;
given ($b) {
		when(1) {
			print "������� ���������� ��������� �������:\n";
				my $a = <STDIN>;
				for my $i(0..$a-1) {
					$mas[$i]=<STDIN>;
			}
		}
		when(2) {@mas=GenMod::genIntLittle($_[0]);}
		when(3) {@mas=GenMod::genIntBig($_[0]);}	
		when(4) {@mas=GenMod::genLittle($_[0]);}
		when(5) {@mas=GenMod::genBig($_[0]);}
		when(6) {@mas=GenMod::superrand($_[0]);}
		default {print "������������ ����\n";}
	}
}
#=com
print "�������� ������ �����:\n1)����������\n2)����� ������\n3)�����������\n4)��������� ������ ��� ����������� �������\n5)������� �� ���������\n";
my $ans=<STDIN>;
given ($ans) {
	when (1) {
		my $k = &choosesort;
		&choosedata;
		print "������ �� ����������:\n";
		print "@mas","\n";
		given ($k) {
			when (1) {SortMod::bubble(@mas);}
			when (2) {SortMod::shellsort(@mas);}
			when (3) {SortMod::insertsort(@mas);}
			when (4) {SortMod::selectsort(@mas);}
			when (5) {SortMod::heapsort(@mas);}
			when (6) {SortMod::quicksort(@mas);}
			when (7) {SortMod::mergesort(\@mas,0,$#mas);}
			when (8) {@mas = sort {$a <=>$b} @mas;}
			default {print "������������ ����\n";}
		}
		print "������ ����� ����������:\n";
		print "@mas","\n";
	}
	when (2) {
		my $k = &choosesort;
		&choosedata;
			given ($k) {
			when (1) {TimeMod::timeBubble(@mas);}
			when (2) {TimeMod::timeShell(@mas);}
			when (3) {TimeMod::timeInsert(@mas);}
			when (4) {TimeMod::timeSelect(@mas);}
			when (5) {TimeMod::timeHeap(@mas);}
			when (6) {TimeMod::timeQuick(@mas);}
			when (7) {TimeMod::timeMerge(@mas);}
			when (8) {TimeMod::timeSort(@mas);}
			default {print "������������ ����\n";}
		}
	}
	when (3) {
		my $k = &choosesort;
		&choosedata;
		given ($k) {
			when (1) {$count = SortMod::bubble(@mas);}
			when (2) {$count = SortMod::shellsort(@mas);}
			when (3) {$count = SortMod::insertsort(@mas);}
			when (4) {$count = SortMod::selectsort(@mas);}
			when (5) {$count = SortMod::heapsort(@mas);}
			when (6) {$count = SortMod::quicksort(@mas);}
			when (7) {$count = SortMod::mergesort(@mas,0,$#mas);}
			when (8) {print "�� ���������� ���������� ������ � ���������� ������������ ����������\n";}
			default {print "������������ ����\n";}
			}
			print "���������� ������������:\n";
			print $count;
	}
	when (4) {
		print "������ ��� ������ ������� �� ������ ��������?:\n1) ����������� ������� �� ����������� ��������� ��� ���� �������\n2) ����������� ������������ �� ���������� ��������� ��� ���� �������\n3) ����������� ������� �� ���������� ��������� ��� ������������ �������\n4) ����������� ������������ �� ���������� ��������� ��� ������������ �������\n";
		my $q=<STDIN>;
		given ($q) {
			when(1) {
				&GraphMod::graphTimesuperrand;
				print "��� ���������� ��������� � GraphInfo1.tvs";
			}
			when(2) {
				&GraphMod::graphPermutation;
				print "��� ���������� ��������� � GraphInfo2.tvs";
			}
			when(3) {
				&GraphMod::graphTimeInd;
			}
			when(4) {
				&GraphMod::graphPermutationInd;
			}
			default {print "������������ ����\n";}
		}
	}
	when (5) {
		print "������� ������� � ������� ��� ������� ��������� ������? (con/file)\n";
		my $ans=<STDIN>;
		if ($ans eq "con\n") {
			open H, "ReadMe.txt";
			print while<H>;
			close H;}
		elsif ($ans eq "file\n") {
			`notepad.exe ReadMe.txt`;
		}
		else {print "������������ ����\n";}
	}
	default {print "������������ ����\n";}
}