import whiley.lang.*

type nat is (int n) where n >= 0

/**
 * Define coins/notes and their values (in cents)
 */
constant ONE_CENT is 0
constant FIVE_CENTS is 1
constant TEN_CENTS is 2
constant TWENTY_CENTS is 3
constant FIFTY_CENTS is 4
constant ONE_DOLLAR is 5  // 1 dollar
constant FIVE_DOLLARS is 6  // 5 dollars
constant TEN_DOLLARS is 7 // 10 dollars

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
// String for each above value
constant Descriptions is [
    "1c",
    "5c",
    "10c",
    "20c",
    "50c",
    "$1",
    "$5",
    "$10"
]

/**
 * Define the notion of cash as an array of coins / notes
 */
type Cash is (nat[] ns) where |ns| == |Value|

/**
 * Print out cash in a friendly format
 */
function toString(Cash c) -> ASCII.string:
    ASCII.string r = ""
    bool firstTime = true
    int i = 0
    while i < |c|:
        int amt = c[i]
        if amt != 0:
            if !firstTime:
                r = Array.append(r,", ")
            firstTime = false
            r = Array.append(r,Int.toString(amt))
            r = Array.append(r," x ")
            r = Array.append(r,Descriptions[i])
        i = i + 1
    if r == "":
        r = "(nothing)"
    return r

/**
 * Test Harness
 */
public method main(System.Console console):
    Cash till = [5,3,3,1,1,3,0,0]
    console.out.print_s("Till: ")
    console.out.println_s(toString(till))