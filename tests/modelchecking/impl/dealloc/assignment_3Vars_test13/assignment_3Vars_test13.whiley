import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	a = b
	a = c
	c = a
	b = c
	b = a
	c = b
