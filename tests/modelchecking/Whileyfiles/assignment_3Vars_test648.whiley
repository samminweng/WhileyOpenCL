import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	c = b
	b = a
	a = b
	int i = b[0] //Test if there is invalid read error
	a = c
	b = c
	c = a
