import whiley.lang.*
import whiley.lang.Math
// This example code illustrates the sobel edge detection
// reference: https://en.wikipedia.org/wiki/Sobel_operator

// Define Colour value
constant WHITE is 255
constant BLACK is 0

// Wrap the position into 0..size
function wrap(int pos, int size) -> int:
	if pos < 0:
		// Negated pos
		pos = size + pos
	else:
		if pos >= size:
			pos = pos -size
	return pos
// Perform image convolution
function convolution(int[] pixels, int width, int height, int xCenter, int yCenter, int[] filter) ->int:
	int sum = 0
	int filterSize = 3
	int filterHalf = 1
	int filterY = 0
	while filterY < filterSize:
		int y = wrap(yCenter+filterY - filterHalf, height)
		int filterX = 0
		while filterX < filterSize:
			int x = wrap(xCenter + filterX - filterHalf, width)
			// Get pixel
			int pixel = pixels[y*width+x]
			// Get filter value
			int filterVal = filter[filterY*filterSize+filterX]
			// pixel * filter value 
			sum = sum + pixel * filterVal
			filterX = filterX + 1
		filterY = filterY + 1
	return sum

// Main function
method main(System.Console sys):
	int width = 8
	int height = 8
	int size = width * height
	// The input image is a white image of 8 x 8 pixels
	// with a black square at the center 
	int[] pixels = [WHITE;size]
	// Place a black square (1x1) at (4,4) position 
	pixels[4*width+4] = BLACK // (4,4)
	// The output image of sobel edge detection
	int[] newPixels = [WHITE;size]
	// vertical and horizontal sobel filter (3x3 kernel)
	int[] v_sobel = [-1,0,1,-2,0,2,-1,0,1]
	int[] h_sobel = [1,2,1,0,0,0,-1,-2,-1]
	// Perform sobel edge detection
	int x = 0
	while x<width:
		int y = 0
		while y<height:
			sys.out.print_s("At x = ")
			sys.out.print(x)
			sys.out.print_s(" y = ")
			sys.out.print(y)
			int pos = y*width + x
			// Get vertical gradient
			int v_g = convolution(pixels, width, height, x, y, v_sobel)
			//sys.out.print_s("v_g = ")
			//sys.out.println(v_g)
			// Get horizontal gradient
			int h_g = convolution(pixels, width, height, x, y, h_sobel)
			//sys.out.print_s("h_g = ")
			//sys.out.println(h_g)
			// Get total gradient
			int t_g = Math.abs(v_g) + Math.abs(h_g)
			// Edge threshold (128) Note that large thresholds generate few edges
			if t_g > 128:
				// Color the edge as white 
				newPixels[pos] = WHITE
			else:
				// Color other pixels as black
				newPixels[pos] = BLACK
			sys.out.print_s(" newPixels[pos] = ")
			sys.out.println(newPixels[pos])
			y = y + 1
		x = x + 1
	// A black square is at (4,4)
	assert newPixels[4*width+4] == BLACK  // (4,4)
	// The pixels around (4,4) all are white 
	assert newPixels[3*width+3] == WHITE // (3,3)
	assert newPixels[3*width+4] == WHITE // (3,4)
	assert newPixels[3*width+5] == WHITE // (3,5)
	assert newPixels[4*width+3] == WHITE // (4,3)
	assert newPixels[4*width+5] == WHITE // (4,5)
	assert newPixels[5*width+3] == WHITE // (5,3)
	assert newPixels[5*width+4] == WHITE // (5,4)
	assert newPixels[5*width+5] == WHITE // (5,5)

