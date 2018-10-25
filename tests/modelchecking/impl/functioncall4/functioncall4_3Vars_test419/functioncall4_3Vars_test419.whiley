import whiley.lang.*

//Function 'func' always returns input 'a'
function func(int[] a, int i, int j) -> int[]:
	if a[i] < a[j]:
		i = 0
		while i < j:
			a[i] = a[j]
			i = i + 1
		return a
	else:
		i = j + 1
		while i < |a|:
			a[i] = a[j]
			i = i + 1
		return a
public method main(System.Console console):
	int[] a =[1; 5]
	int[] b =[2; 5]
	int[] c =[3; 5]
	int j = 0
	while j < 10:
		b = c
		a = b
		a = c
		int i = b[0] //Test if there is invalid read error
		c = b
		c = a
		b = a
		a = func(b, 2, 3)
		j = j + 1
