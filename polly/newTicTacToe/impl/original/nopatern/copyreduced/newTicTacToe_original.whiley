import whiley.lang.*

type nat is (int x) where x >= 0

// ==================================================================
// A square on the board is either blank, or holds either a circle or
// cross.
// ==================================================================
constant BLANK is 0
constant CIRCLE is 1
constant CROSS is 2

type Square is (int x) where x == BLANK || x == CIRCLE || x == CROSS

// ==================================================================
// A board consists of 9 squares, and a move counter
// ==================================================================
type Board is (null |{
    nat move,
    Square[] pieces // 3 x 3
} this)
where this != null && |this.pieces| == 9 && this.move <= 9
where this != null && countOf(this.pieces,BLANK) == (9 - this.move)
where this != null && (countOf(this.pieces,CIRCLE) == countOf(this.pieces,CROSS) || countOf(this.pieces,CIRCLE) == countOf(this.pieces,CROSS)+1)
// ==================================================================
// An empty board is one where all pieces are blank
// ==================================================================
function EmptyBoard() -> (Board r)
// Empty board has no moves yet
ensures r != null && r.move == 0:
    //
    return {
        move: 0,
        pieces: [BLANK,BLANK,BLANK,
                 BLANK,BLANK,BLANK,
                 BLANK,BLANK,BLANK]
    }

// ===============================================================
// Playing a piece requires an blank square, and returns the board
// updated with the piece at that position and an incremented the move
// counter.
// ===============================================================
/*function play(Board b, nat pos) -> (Board r)
// Board position to place onto must be valid
requires pos < 9 && b.move < 9 && b.pieces[pos] == BLANK
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
    return b*/

// ===============================================================
// Helper Method
// ===============================================================
function countOf(Square[] pieces, Square s) -> (int r):
    //
    int count = 0
    int i = 0
    while i < |pieces|:
        if pieces[i] == s:
            count = count + 1
        i = i + 1
    //
    return count

// ===============================================================
// Test Game
// ===============================================================
constant GAME is [0,1,2,3,4,5,6,7,8]


method main(System.Console sys):
    int|null n = Int.parse(sys.args[0])
    if n != null:
        int max = n
        int repeat = 0
        while repeat < max:
            //sys.out.print_s("Repeat:")
            //sys.out.println(repeat)
            Board b1 = EmptyBoard()
            Board b2 = EmptyBoard()
            int i = 0
            while i < |GAME|:
                int p = GAME[i]
                if p <0 || p > 9:
                    break
                else:
                    if b1 != null:
                        //sys.out.println_s("play 1's turn (CIRCLE)")
                        b1.pieces[p]=CIRCLE
                        b1.move = b1.move + 1
                        b2 = b1
                        b1 = null
                    else:
                        if b2 != null:
                            //sys.out.println_s("Play 2's turn (CROSS)")
                            b2.pieces[p]=CROSS
                            b2.move = b2.move + 1
                            // Move board to next player
                            b1 = b2
                            b2 = null
                i = i + 1
            //if b2 != null:
                //sys.out.print_s("Move:")
                //sys.out.print(b2.move)
                //sys.out.println_s("Pieces:")
                //sys.out.println(b2.pieces)
            repeat = repeat + 1
        sys.out.println_s("Pass newTicTacToe test case")