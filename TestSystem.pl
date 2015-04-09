use SortMod;
use GenMod;
use TimeMod;
use GraphMod;
use 5.010;
use Win32::Console::ANSI;
my @mas=();
my $co;
sub choosesort {
	print "Какой алгоритм вы хотите выбрать?\n1)Сотрировка пузырьковым методом\n2)Сортировка Шелла\n3)Сортировка вставками\n4)Сортировка выбором\n5)Пирамидальная сортировка\n6)Быстрая сортировка\n7)Cортировка слиянием\n8)Сортировка встроенной функцией\n";
	my $ans=<STDIN>;
	return $ans;
}
sub choosedata {
print "На каком виде данных вы хотите выполнить сортировку?\n1)Собственные данные\n2)Массив маленьких целых чисел\n3)Большие целые числа\n4)Маленькие вещественные числа\n5)Большие вещественные числа\n6)Различные числа(выстокая степень случайности)\n";
my $b=<STDIN>;
given ($b) {
		when(1) {
			print "Введите количество элементов массива:\n";
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
		default {print "Некорректный ввод\n";}
	}
}
#=com
print "Выбирете нужную опцию:\n1)Сортировка\n2)Время работы\n3)Престановки\n4)Генерация данных для постороения графика\n5)Справка по программе\n";
my $ans=<STDIN>;
given ($ans) {
	when (1) {
		my $k = &choosesort;
		&choosedata;
		print "Массив до сортировки:\n";
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
			default {print "Некорректный ввод\n";}
		}
		print "Массив после сортировки:\n";
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
			default {print "Некорректный ввод\n";}
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
			when (8) {print "Во встроенной сортировке доступ к количеству перестановок невозможен\n";}
			default {print "Некорректный ввод\n";}
			}
			print "Количество перестановок:\n";
			print $count;
	}
	when (4) {
		print "Данные для какого графика вы хотите получить?:\n1) Зависимость времени от колличества элементов для всех функций\n2) Зависимость перестановок от количества элементов для всех функций\n3) Зависимость времени от количества элементов для определенной функции\n4) Зависимость перестановок от количества элементов для определенной функции\n";
		my $q=<STDIN>;
		given ($q) {
			when(1) {
				&GraphMod::graphTimesuperrand;
				print "Вся информация сохранена в GraphInfo1.tvs";
			}
			when(2) {
				&GraphMod::graphPermutation;
				print "Вся информация сохранена в GraphInfo2.tvs";
			}
			when(3) {
				&GraphMod::graphTimeInd;
			}
			when(4) {
				&GraphMod::graphPermutationInd;
			}
			default {print "Некорректный ввод\n";}
		}
	}
	when (5) {
		print "Вывести справку в консоль или открыть отдельным файлом? (con/file)\n";
		my $ans=<STDIN>;
		if ($ans eq "con\n") {
			open H, "ReadMe.txt";
			print while<H>;
			close H;}
		elsif ($ans eq "file\n") {
			`notepad.exe ReadMe.txt`;
		}
		else {print "Некорректный ввод\n";}
	}
	default {print "Некорректный ввод\n";}
}