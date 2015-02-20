import whiley.lang.System
/*
function f1(int limit) => int
requires limit <= 1000000:
    int i=limit
    int sum=0
    while i>0:
        sum = sum + i
        i=i-1
    return sum
   
function f2(int limit) => int
requires limit <= 1000000:
    int i=limit
    int sum=0
    while i>=0:
        sum = sum + i
        i=i-1
    return sum
*/
function f3(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<limit:
        sum = sum + i
        i=i+1
    return sum
/*
function f4(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<=limit:
        sum = sum + i
        i=i+1
    return sum
     
function f5(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<=limit:
    	if i < 10:
    		sum = sum + 1
    	else:
    		if i > 10:
    			sum = sum + 2
    	sum = sum + i
    	i = i + 1
    return sum
*/     
function f6(int limit) => int
requires limit <= 1000000:
    int sum=0
    for i in 0 .. limit:
        sum = sum + i
    return sum    
   

method main(System.Console sys):
    //sys.out.println("f1 Loop Sum="++f1(5))
    //sys.out.println("f2 Loop Sum="++f2(5))
    //sys.out.println("f3 Loop Sum="++f3(5))
    //sys.out.println("f4 Loop Sum="++f4(5))