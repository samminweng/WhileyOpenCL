import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int j = 0
	while j < 10:
		b = a
		a = b
		j = j + 1
