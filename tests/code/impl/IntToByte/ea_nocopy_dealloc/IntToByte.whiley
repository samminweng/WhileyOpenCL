import whiley.lang.*
constant SPACE is 00100000b // ASCII code of space (' ')

method main(System.Console sys):
    int size = 300
    byte[] pixels = [SPACE;size]
    int i = 0
    while i < size:
        pixels[i] = Int.toUnsignedByte(i%256)
        i = i + 1
    // Print out pixels
    i = 0
    while i < size:
        sys.out.println(pixels[i])
        i = i + 1
