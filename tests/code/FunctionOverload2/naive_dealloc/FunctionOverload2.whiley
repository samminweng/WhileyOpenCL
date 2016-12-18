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

// The function name is _Cash_
function Cash() -> Cash:
    return [0,0,0,0,0,0,0,0]

// function name conflicts with another function
// So the function name is translated to _Cash#1_()
function Cash(nat[] coins) -> Cash
// No coin in coins larger than permitted values
requires all { i in 0..|coins| | coins[i] < |Value| }:
    Cash cash = [0,0,0,0,0,0,0,0]
    int i = 0
    while i < |coins| 
        where |cash| == |Value| && all {k in 0..|cash| | cash[k] >= 0}:
        nat coin = coins[i]
        cash[coin] = cash[coin] + 1
        i = i + 1
    return cash

public method main(System.Console console):
    Cash empty = Cash()
    Cash till = Cash([5,3,3,1,1,3,0,0])