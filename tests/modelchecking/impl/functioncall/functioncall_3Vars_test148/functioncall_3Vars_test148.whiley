import whiley.lang.*

function func(int[] x, int num) -> int[]:
	int[] a = [0;3]
	int[] b = [1;3]
	int[] c = a
	int[] d = b
	if num > 10:
		return x
	else:
			if num >9:
				return c
	return d
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
		c = a
		c = b
		b = c
		a = func(b, 11)
		j = j + 1
