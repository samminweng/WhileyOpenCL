import whiley.lang.*

// input: input array, output: output array
function func(int[] input) -> (int[] output):
    int n = |input| // Get the size of 'input' array
    output = [0;n]// Create output array of size 'n' filled in 0
    int i = 0
    while i < n where i <= n:
        output[i] = input[i] * 2// Array update
        i = i + 1
    return output

method main(System.Console sys):
    int[] a = [1;20]// Create an input array of size 20 filled in 1
    int[] b = func(a)
    assert a[0] == 1
    assert b[0] == 2
    sys.out.println(a[0])
