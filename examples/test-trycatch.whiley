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
		throw SyntaxError("Missing number",start,pos)
	return Int.parse(input[start..pos])

method main(System.Console console):
	if(|console.args| == 0):
		console.out.println("No parameter provided! Please enter a number.")
	else:
		try:		
			console.out.println(parseNumber(console.args[0]))				
		catch(SyntaxError ex):
			console.out.println("Missing number")