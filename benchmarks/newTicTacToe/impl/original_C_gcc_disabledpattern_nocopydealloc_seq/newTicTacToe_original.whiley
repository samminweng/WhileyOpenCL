import whiley.lang.*

type nat is (int x) where x >= 0

constant BLANK is 0
constant CIRCLE is 1
constant CROSS is 2

// A square is either blank, or a circle or cross.
type Square is (int x)
where x == BLANK || x == CIRCLE || x == CROSS

// A board consists of 9 squares, and a move counter
type Board is (null |{
    nat move,
    Square[] pieces // 3 x 3
} this)
where this != null &&
      |this.pieces| == 9 && this.move <= 9
where this != null &&
      countOf(this.pieces,BLANK) == (9 - this.move)
where this != null &&
      (countOf(this.pieces,CIRCLE) == countOf(this.pieces,CROSS) ||
      countOf(this.pieces,CIRCLE) == countOf(this.pieces,CROSS)+1)

// An empty board is one where all pieces are blank
function EmptyBoard() -> (Board r)
// Empty board has no moves yet
ensures r != null && r.move == 0:
    return {
        move: 0,
        pieces: [BLANK,BLANK,BLANK,
                 BLANK,BLANK,BLANK,
                 BLANK,BLANK,BLANK]
    }

// Helper Method
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

// Test Game
constant GAME is [0,1,2,3,4,5,6,7,8]

method main(System.Console sys):
    int|null n = Int.parse(sys.args[0])
    if n != null:
        int max = n
        int repeat = 0
        while repeat < max:
            Board b1 = EmptyBoard()
            Board b2 = EmptyBoard()
            int i = 0
            while i < |GAME|:
                int p = GAME[i]
                if p <0 || p > 9:
                    break
                else:
                    if b1 != null:
                        b1.pieces[p]=CIRCLE
                        b1.move = b1.move + 1
                        b2 = b1
                        b1 = null
                    else:
                        if b2 != null:
                            b2.pieces[p]=CROSS
                            b2.move = b2.move + 1
                            // Move board to next player
                            b1 = b2
                            b2 = null
                i = i + 1
            repeat = repeat + 1
        sys.out.println_s("Pass newTicTacToe test case")
