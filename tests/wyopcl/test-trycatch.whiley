import * from whiley.lang.Errors
method main(System.Console console):
	if(|console.args| == 0):
		console.out.println("Add an number to the arguments.")
	else:
		try:
			console.out.println("number="++Int.parse(console.args[0]))
		catch(SyntaxError ex):
			console.out.println("Missing number")