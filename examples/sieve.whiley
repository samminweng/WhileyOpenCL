import * from whiley.lang.Errors
//Sieve of Eratosthenes algorithm finds the prime numbers upto a given number.
function sieve(int limit) => int:
	//Store the prime flags with the nonPrimes list.
	[bool] nonPrimes = [false, false]
	for i in 2..limit:
		nonPrimes = nonPrimes ++ [true]
	//int n = sqrt(limit)
	int n = Math.isqrt(limit)
	int p = 2	
	//Mark the no-prime numbers.
	while p <= n:
		//Find the prime number
		if nonPrimes[p] == true:		
			//Increment this prime number.
			int i = p * p			
			while i<limit:
				nonPrimes[i]=false
				i = i + p
		p = p + 1
	//Calculate the total number of primes in a list.
	int numberOfPrimes = 0
	for i in 2..limit:
		if nonPrimes[i] == true:
			numberOfPrimes = numberOfPrimes + 1
	
	return numberOfPrimes
	
//The total number of primes is shown on the following website: 
//http://primes.utm.edu/howmany.shtml
method main(System.Console console):
	if(|console.args| == 0):
		console.out.println("Add an number to the arguments.")
	else:
		try:
			int limit = Int.parse(console.args[0])
			console.out.println("sieve("++limit++")="++sieve(limit))
		catch(SyntaxError ex):
			console.out.println("Missing number")		
