import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	int j = 0
	while j < 10:
		c = a
		a = b
		c = b
		int i = b[0] //Test if there is invalid read error
		b = a
		a = c
		b = c
		j = j + 1
