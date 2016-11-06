import whiley.lang.*
import whiley.lang.Math
// This example code illustrates the sobel edge detection
// reference: https://en.wikipedia.org/wiki/Sobel_operator

// Define Colour value
constant WHITE is 11111111b
constant BLACK is 0b

// ========================================================
// Perform image convolution
// ========================================================
function convolution(byte[] pixels, int width, int height, int xCenter, int yCenter, int[] filter) ->int:
	int sum = 0
	int filterSize = 3
	int filterHalf = 1
	int filterY = 0
	while filterY < filterSize:
		// Wrap the position into 0..size, which can be replaced with modulo operator
		// When size = 10 and pos = -1 => pos % size = 9
		// When size = 10 and pos = 11 => pos % size = 1
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
	byte[] newPixels = [WHITE;size]
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
			if t_g > 128:
				// Color the edge as white 
				newPixels[pos] = WHITE
			else:
				// Color other pixels as black
				newPixels[pos] = BLACK
			y = y + 1
		x = x + 1
	return newPixels

// ========================================================
// Print a Image
// ========================================================
method printImage(System.Console sys, byte[] pixels, int width, int height):
	int y = 0
	while y<height:
		int x = 0
		while x<width:
			int pos = y*width + x
			// Print out each pixel value
			if pixels[pos] == WHITE:
				sys.out.print_s("w")
			else:
				sys.out.print_s("b")
			sys.out.print_s(" ")
			x = x + 1
		y = y + 1
		sys.out.println_s("")

// Main function
method main(System.Console sys):
	int width = 8
	int height = 8
	int size = width * height
	// The input image is a white image of 8 x 8 pixels
	// with a black pixel at the center 
	byte[] pixels = [WHITE;size]
	// Place a black pixel at (3,4) position 
	pixels[4*width+3] = BLACK // (3,4)
	byte[] newPixels = sobelEdgeDetection(pixels, width, height)
	sys.out.println_s("Input Image:")
	printImage(sys, pixels, width, height)
	sys.out.println_s("Sobel Edge Detection:")
	printImage(sys, newPixels, width, height)
	// A black square is at (3,4)
	assert pixels[4*width+3] == BLACK  // (3,4)
	// The pixels around (3,4) all are white 
	assert newPixels[3*width+2] == WHITE // (2,3)
	assert newPixels[4*width+2] == WHITE // (2,4)
	assert newPixels[5*width+2] == WHITE // (2,5)
	assert newPixels[3*width+3] == WHITE // (3,3)
	assert newPixels[5*width+3] == WHITE // (3,5)
	assert newPixels[3*width+4] == WHITE // (4,3)
	assert newPixels[4*width+4] == WHITE // (4,4)
	assert newPixels[5*width+4] == WHITE // (4,5)

