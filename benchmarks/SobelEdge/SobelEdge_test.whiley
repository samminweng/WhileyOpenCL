import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*
import whiley.lang.Math

constant SPACE is 00100000b // ASCII code of space (' ')
constant BLACK is 01100010b // ASCII code of 'b'
constant TH is 640000 // Control the number of edges (800*800)

function wrap(int pos, int size) -> int:
	if pos>=size:
		return (size -1) - (pos - size)
	else:
		if pos <0:
			return -1 - pos
		else:
			return pos

// Perform convolution convolution on pixel at 'xCenter' and 'yCenter'
function convolution(byte[] pixels, int width, int height, int xCenter, int yCenter, int[] kernel) ->int:
	int sum = 0
	int kernelSize = 3
	int kernelHalf = 1
	int j = 0
	while j < kernelSize:
		int y=Math.abs((yCenter+j-kernelHalf)%height)
		int i = 0
		while i < kernelSize:
			int x=Math.abs((xCenter + i - kernelHalf)%width)
			int pixel = Byte.toUnsignedInt(pixels[y*width+x])// pixels[x, y]
			// Get kernel[i, j]
			int kernelVal = kernel[j*kernelSize+i]
			//sum += pixels[x, y]*kernel[i, j]
			sum = sum + pixel * kernelVal
			i = i + 1
		j = j + 1
	return sum// 'sum' : convoluted value at pixels[xCenter, yCenter]

// Perform Sobel edge detection
function sobelEdgeDetection(byte[] pixels, int width, int height) -> byte[]:
	int size = width * height
	// The output image of sobel edge detection
	byte[] newPixels = [SPACE;size] // A blank picture
	// vertical and horizontal sobel filter (3x3 kernel)
	int[] v_sobel = [-1,0,1,-2,0,2,-1,0,1]
	int[] h_sobel = [1,2,1,0,0,0,-1,-2,-1]
	// Perform sobel edge detection
	//int pos = 0
	//while pos < size:
	//      newPixels[pos] = BLACK
	//      pos = pos + 1
	int y = 0
	while y<height:
		int x = 0
		while x<width:
			int pos = y*width + x
			newPixels[pos] = BLACK
			x = x + 1
		y = y + 1
	return newPixels

// Print a pbm image
method print_pbm(System.Console sys, int width, int height, byte[] pixels):
    // File type
    sys.out.println_s("P1")
    // Width + height
    sys.out.print(width)
    sys.out.print_s(" ")
    sys.out.println(height)
    // An array of bytes with an row of pixels in width
    int j = 0
    while j<height:
        int i = 0
        while i<width:
            int pos = j*width + i
            if pixels[pos] == SPACE:
                sys.out.print(0)
            else:
                sys.out.print(1)
		    // Each pixel is separated by a space
            //sys.out.print_s(" ")
            i = i + 1
        // Add a newline
        sys.out.println_s("")
        j = j + 1

// Main function
method main(System.Console sys):
	// args[0]: input
	int|null input = Int.parse(sys.args[0])
	if input != null:
		int n = input
		int m = 16384
		int size = n*m
		// Create an array
		byte[] a = [SPACE;size]
		// Generate each pixels
		int x =0
		while x < n:
			int p = x
			int y = 0
			while y< m:
				a[p] = Int.toUnsignedByte(7)
				p = p + n
				y = y + 1
			x = x + 1
		sys.out.println_s("Pass the test")
