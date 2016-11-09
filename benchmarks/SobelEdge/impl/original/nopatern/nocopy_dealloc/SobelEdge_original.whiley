import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*
import whiley.lang.Math
// This example code illustrates 'cross-edge' sobel edge detection
// reference: https://en.wikipedia.org/wiki/Sobel_operator
// Define Colour value
constant SPACE is 00100000b // ASCII code of space (' ') 
constant BLACK is 01100010b // ASCII code of 'b' 

// ========================================================
// Perform image convolution
// ========================================================
function convolution(byte[] pixels, int width, int height, int xCenter, int yCenter, int[] filter) ->int:
	int sum = 0
	int filterSize = 3
	int filterHalf = 1
	int filterY = 0
	while filterY < filterSize:
		//int y = wrap(yCenter+filterY - filterHalf, height)
		int y = Math.abs((yCenter+filterY-filterHalf)%height)
		int filterX = 0
		while filterX < filterSize:
			//int x = wrap(xCenter + filterX - filterHalf), width)
			int x = Math.abs((xCenter + filterX - filterHalf)%width)
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
			// Get total gradient
			int t_g = Math.abs(v_g) + Math.abs(h_g)
			// Edge threshold (128) Note that large thresholds generate few edges
			if t_g <= 128:
				// Color other pixels as black
				newPixels[pos] = BLACK
			y = y + 1
		x = x + 1
	return newPixels

// ========================================================
// Print a Image
// ========================================================
/*method printImage(System.Console sys, byte[] pixels, int width, int height):
	int y = 0
	while y<height:
		int x = 0
		while x<width:
			int pos = y*width + x
			// Print out each pixel value
			if pixels[pos] == SPACE:
				sys.out.print_s(" ")
			else:
				sys.out.print_s("b")
			sys.out.print_s(" ")
			x = x + 1
		y = y + 1
		sys.out.println_s("")
*/
// Main function
method main(System.Console sys):
	int|null n = Int.parse(sys.args[0])
	if n != null:
		int max = n
		int width = max
		int height = max
		// The input image is a white image of 8 x 8 pixels
		// with a black pixel at the center 
		byte[] pixels = [SPACE;width * height]
		// Place a black pixel at (3,4) position 
		pixels[4*width+3] = BLACK // (3,4)
		byte[] newPixels = sobelEdgeDetection(pixels, width, height)
		// Write 'newPixels' as a file
		File.Writer w = File.Writer("output.txt")
		w.write(newPixels)
		w.close()
