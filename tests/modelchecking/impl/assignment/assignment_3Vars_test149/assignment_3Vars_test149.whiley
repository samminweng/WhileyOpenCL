import whiley.lang.*

public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	int j = 0
	while j < 100:
		a = c
		b = a
		a = b
		int i = b[0] //Test if there is invalid read error
		c = b
		c = a
		b = c
		j = j + 1
