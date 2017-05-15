import whiley.lang.*

constant Value is [
    1,
    5,
    10,
    20,
    50,
    100,
    500,
    1000
]

type nat is (int n) where n >= 0
/**
 * Define the notion of cash as an array of coins / notes
 */
type Cash is (nat[] ns) where |ns| == |Value|

// function name conflicts with the type name
// So the function name is translated to _Cash_()
function Cash() -> Cash:
    return [0,0,0,0,0,0,0,0]

public method main(System.Console console):
    Cash empty = Cash()