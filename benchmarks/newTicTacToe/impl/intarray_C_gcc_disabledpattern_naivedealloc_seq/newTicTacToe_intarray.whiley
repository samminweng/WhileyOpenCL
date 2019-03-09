import whiley.lang.*

type nat is (int x) where x >= 0

constant BLANK is 0
constant CIRCLE is 1
constant CROSS is 2

// Test Game
constant GAME is [0,1,2,3,4,5,6,7,8]

method main(System.Console sys):
    int|null n = Int.parse(sys.args[0])
    if n != null:
        int max = n
        int repeat = 0
        while repeat < max:
            int[] b1 = [BLANK;9]// Create an empty board
            int[] b2 = [BLANK;9]// Create an empty board
            int i = 0
            while i < |GAME|:
                int p = GAME[i]
                if p <0 || p > 9:
                    break
                else:
                    if |b1| != 0: // b1 is none-empty
                        b1[p]=CIRCLE
                        b2 = b1// Move board to next player
                        b1 = [BLANK;0] // Empty 'b1' and resize to zero
                        //sys.out.println_s("empty b1")                           
                    else:
                        if |b2| != 0:
                            b2[p]=CROSS                            
                            b1 = b2// Move board to next player
                            b2 = [BLANK;0] // Empty 'b2'
                            //sys.out.println_s("empty b2")
                i = i + 1
            repeat = repeat + 1
        sys.out.println_s("Pass newTicTacToe test case")
