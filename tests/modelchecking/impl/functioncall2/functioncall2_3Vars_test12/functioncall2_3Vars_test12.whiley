import whiley.lang.*

//Function 'func' never returns input 'x'
function func(int[] x, int num) -> int[]:
	int[] a = [0;3]
	int[] b = [1;3]
	x[0] = num // Change 'x'
	int[] c = a
	int[] d = b
	if num >9:
		return c // Does not return 'x'
	else:
		return d // Does not return 'x'
public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	int j = 0
	while j < 10:
		a = b
		a = c
		b = c
		int i = b[0] //Test if there is invalid read error
		c = b
		b = a
		c = a
		a = func(b, 11)
		j = j + 1
