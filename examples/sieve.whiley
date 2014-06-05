import println from whiley.lang.System
import print from whiley.lang.System
import whiley.lang.Math
import * from whiley.io.File
import * from whiley.lang.Errors

// Check if the input char is the standard whitespace character.
function isWhiteSpace(char c) => bool:
     return c == ' ' || c == '\t' || c == '\n' || c == '\r'

// Skip the whitespace chars and move the cursor (pos) to next position.
function skipWhiteSpace(int index, string input) => int:
    while index < |input| && isWhiteSpace(input[index]):
        	index = index + 1
    return index

// Parse the integer number from the inpit string.
function parseNumber(string input) => int
throws SyntaxError:
	int pos = 0
	int start = pos
	while pos < |input| && Char.isDigit(input[pos]):
		pos = pos + 1
	// check for error
	if pos == start:
		throw SyntaxError("Missing␣number",start,pos)
	return Int.parse(input[start..pos])	

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
function sieve([bool] nonPrimes) => int:
	int max = |nonPrimes|
	int n = sqrt(max)
	int p = 3	
	//Mark the no-prime numbers.
	while p <= n:
		//Find the prime number
		if nonPrimes[p] == true:		
			//Increment this prime number.
			int i = p * p			
			while i<max:
				nonPrimes[i]=false
				i = i + p
		p = p + 2
	//Calculate the total number of primes in a list.
	int numberOfPrimes = 1
	int i = 3	
	while i <= max:
		if nonPrimes[i] == true:
			numberOfPrimes = numberOfPrimes + 1
		i = i + 2
	return numberOfPrimes
	
//The total number of primes is shown on the following website: 
//http://primes.utm.edu/howmany.shtml
method main(System.Console console):
	if(|console.args| == 0):
		console.out.println("No parameter provided! Please enter a number.")
	else:
		try:		
			int limit = parseNumber(console.args[0])
			//Use the list to calculate the total number of primes.
			[bool] list = [false, false]
			for i in 2..limit:
				list = list ++ [true]
			//console.out.println("List="+list)
			int numberOfPrimes = sieve(list)			
			console.out.println("Sieve: From 2 to "++limit++", the total number of Prime numbers is " ++numberOfPrimes)
		catch(SyntaxError ex):
			console.out.println("Missing number")	
