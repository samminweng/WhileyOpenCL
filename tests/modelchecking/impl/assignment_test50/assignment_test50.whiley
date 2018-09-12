import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	a = b
	b = c
	b = a
	a = c
	c = b
	c = a
