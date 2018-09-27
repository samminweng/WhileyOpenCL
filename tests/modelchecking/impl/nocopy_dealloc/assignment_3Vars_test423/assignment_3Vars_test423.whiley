import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	b = c
	a = b
	c = a
	int i = b[0] //Test if there is invalid read error
	b = a
	a = c
	c = b
