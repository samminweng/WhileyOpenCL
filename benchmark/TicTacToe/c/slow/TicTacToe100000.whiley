import whiley.lang.System
// ==================================================================
// A square on the board is either blank, or holds either a circle or
// cross.
// ==================================================================
constant BLANK is 0
constant CIRCLE is 1
constant CROSS is 2
constant SQUARESIZE is 100000//0.1 million

type nat is (int x) where x >= 0
type Square is (int x) where x == BLANK || x == CIRCLE || x == CROSS
// ==================================================================
// A board consists of 9 squares, and a move counter
// ==================================================================
type Board is {
    nat move,
    [Square] pieces // 3 x 3
} where |pieces| == SQUARESIZE && move <= SQUARESIZE && 
    countOf(pieces,BLANK) == (SQUARESIZE - move) &&
    (countOf(pieces,CIRCLE) == countOf(pieces,CROSS) ||    
     countOf(pieces,CIRCLE) == countOf(pieces,CROSS)+1)

// ==================================================================
// An empty board is one where all pieces are blank
// ==================================================================
function EmptyBoard() -> (Board r)
// Empty board has no moves yet
ensures r.move == 0:
    [int] pieces = []
    for i in 0..SQUARESIZE:
        pieces = pieces ++ [BLANK]
    return {
        move: 0,
        pieces: pieces
        //pieces: [BLANK,BLANK,BLANK,
        //         BLANK,BLANK,BLANK,
        //         BLANK,BLANK,BLANK]
    }

// ===============================================================
// Playing a piece requires an blank square, and returns the board
// updated with the piece at that position and an incremented the move
// counter.
// ===============================================================
function play(Board b, nat pos) -> (Board r)
// Board position to place onto must be valid
requires pos < SQUARESIZE && b.move < SQUARESIZE && b.pieces[pos] == BLANK
// Ensures move count is incremented
ensures r.move == r.move + 1:
    // decide who's moving
    if b.move % 2 == 0:
        // circle on even moves
        b.pieces[pos] = CIRCLE
    else:
        // cross on odd moves
        b.pieces[pos] = CROSS
    // update the move counter
    b.move = b.move + 1
   // done
    return b

// ===============================================================
// Helper Method
// ===============================================================
function countOf([Square] pieces, Square s) -> (int r):
    int count = 0
    int size = |pieces|
    for i in 0..size:
        if pieces[i] == s:
            count = count + 1
    return count

method main(System.Console console) -> void:
    Board b = EmptyBoard()
    for p in 0..SQUARESIZE:        
        //console.out.println(p)
        if p < 0 || p > SQUARESIZE || b.pieces[p] != BLANK || b.move == SQUARESIZE:
            console.out.println("INVALID MOVE!")
        else:
            b = play(b,p)
    console.out.println(b)	
