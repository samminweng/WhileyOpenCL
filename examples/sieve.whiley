// Find the square root of a number (N).
function sqrt(int n) => int:
	int low = 0
	int high = 1+ n/2
	while 1 < (high - low) :
		int mid = low + (high-low)/2
		int square = mid*mid
		if square == n:
			return mid	
		else if square < n:
			low = mid
		else:
			high = mid
	return low

//Sieve of Eratosthenes algorithm finds the prime numbers upto a given number.
function sieve(int limit) => int:
	//Store the prime flags with the nonPrimes list.
	[bool] nonPrimes = [false, false]
	for i in 2..limit:
		nonPrimes = nonPrimes ++ [true]
	int n = sqrt(limit)
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
	console.out.println("sieve(100)="++sieve(100))		
	console.out.println("sieve(1000)="++sieve(1000))		
