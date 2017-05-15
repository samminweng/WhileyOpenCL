import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*
import whiley.lang.Math
// This example code illustrates 'cross-edge' sobel edge detection
// reference: https://en.wikipedia.org/wiki/Sobel_operator
// Define Colour value
constant SPACE is 00100000b // ASCII code of space (' ') 
constant BLACK is 01100010b // ASCII code of 'b' 
constant TH is 64 // Large thresholds generate few edges
// Wrap the pixels to the size
function wrap(int pos, int size) -> int:
	if pos>=size:
		return (size -1) - (pos - size)
	else:
		if pos <0:
			return -1 - pos
		else:
			return pos

// ========================================================
// Perform image convolution
// ========================================================
function convolution(byte[] pixels, int width, int height, int xCenter, int yCenter, int[] filter) ->int:
	int sum = 0
	int filterSize = 3
	int filterHalf = 1
	int filterY = 0
	while filterY < filterSize:
		int y = wrap(yCenter+filterY - filterHalf, height)
		//int y = Math.abs((yCenter+filterY-filterHalf)%height)
		int filterX = 0
		while filterX < filterSize:
			int x = wrap(xCenter + filterX - filterHalf, width)
			//int x = Math.abs((xCenter + filterX - filterHalf)%width)
			// Get pixel
			int pixel = Byte.toUnsignedInt(pixels[y*width+x])
			// Get filter value
			int filterVal = filter[filterY*filterSize+filterX]
			// pixel * filter value 
			sum = sum + pixel * filterVal
			filterX = filterX + 1
		filterY = filterY + 1
	return sum

// ========================================================
// Perform Sobel edge detection
// ========================================================
function sobelEdgeDetection(byte[] pixels, int width, int height) -> byte[]:
	int size = width * height
	// The output image of sobel edge detection
	byte[] newPixels = [SPACE;size] // A blank picture
	// vertical and horizontal sobel filter (3x3 kernel)
	int[] v_sobel = [-1,0,1,-2,0,2,-1,0,1]
	int[] h_sobel = [1,2,1,0,0,0,-1,-2,-1]
	// Perform sobel edge detection
	int x = 0
	while x<width:
		int y = 0
		while y<height:
			int pos = y*width + x
			// Get vertical gradient
			int v_g = convolution(pixels, width, height, x, y, v_sobel)
			// Get horizontal gradient
			int h_g = convolution(pixels, width, height, x, y, h_sobel)
			// Estimate total gradient using 'abs' function
			int t_g = Math.abs(v_g) + Math.abs(h_g)
			// Edge threshold 
			if t_g <= TH:
				// Color other pixels as black
				newPixels[pos] = BLACK
			y = y + 1
		x = x + 1
	return newPixels

// ========================================================
// Print a pbm image
// ========================================================
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
            	// Print out edges
                sys.out.print(1)
            // Each pixel is separated by a space
            sys.out.print_s(" ")
            i = i + 1
        // Add a newline
        sys.out.println_s("")
        j = j + 1

// Main function
method main(System.Console sys):
	// Read feep.bpm
	File.Reader r = File.Reader("image32x32.pbm")
	int width =32
	int height = 32
	int size = width * height
	byte[] pixels = r.readAll()
	// Place a black pixel 
	byte[] newPixels = sobelEdgeDetection(pixels, width, height)
	print_pbm(sys, width, height, newPixels)