import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	b = c
	c = a
	a = b
	c = b
	b = a
	a = c
