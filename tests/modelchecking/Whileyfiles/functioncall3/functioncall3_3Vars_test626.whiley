import whiley.lang.*

//Function 'func' always returns input 'a'
function func(int[] a) -> int[]:
	int i = 0
	while i < |a|:
		a[i] = 5
		i = i + 1
	return a
public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	int j = 0
	while j < 10:
		c = b
		b = a
		a = c
		int i = b[0] //Test if there is invalid read error
		b = c
		a = b
		c = a
		a = func(b)
		j = j + 1
