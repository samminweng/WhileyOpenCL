import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	int j = 0
	while j < 100:
		b = a
		c = b
		c = a
		int i = b[0] //Test if there is invalid read error
		b = c
		a = b
		a = c
		j = j + 1
