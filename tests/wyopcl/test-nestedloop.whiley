method main(System.Console console):
	console.out.print(" ")
	for i in 1..9:
		console.out.print(" "++i)
	console.out.print("\n")
	console.out.println("-------------------------------------------------------")
	for i in 1..9:
		console.out.print(i++"|")
		for j in 1..9:
			console.out.print(" "++i*j)
		console.out.println("")
				