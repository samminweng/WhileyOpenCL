import whiley.lang.*
import whiley.lang.Math
// This example code illustrates the sobel edge detection
// reference: https://en.wikipedia.org/wiki/Sobel_operator

// Define Colour value
constant WHITE is 255
constant BLACK is 0

// Wrap the position into 0..size
function wrap(int pos, int size) -> int:
	if pos >= 0:
		if pos >= size:
			pos = (size -1) - (pos -size)
	else:
		// Negated pos
		pos = -1 - pos
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
	return Math.abs(sum)

// Main function
method main(System.Console sys):
	int width = 8
	int height = 8
	int size = width * height
	// The input image is a white image of 8 x 8 pixels
	// with a black square at the center 
	int[] pixels = [WHITE;size]
	// Color the middle square (2x2) to be black
	pixels[27] = BLACK // (3,3)
	pixels[28] = BLACK // (3,4)
	pixels[35] = BLACK // (4,3)
	pixels[36] = BLACK // (4,4)
	// The output image of sobel edge detection
	int[] newPixels = [WHITE;size]
	// vertical and horizontal sobel filter (3x3 kernel)
	int[] v_sobel = [-1,-2,-1,0,0,0,1,2,1]
	int[] h_sobel = [1,2,1,0,0,0,-1,-2,-1]
	// Perform sobel edge detection
	int x = 0
	while x<width:
		int y = 0
		while y<height:
			int pos = x*width + y
			// Get vertical gradient
			int v_g = convolution(pixels, width, height, x, y, v_sobel)
			// Get horizontal gradient
			int h_g = convolution(pixels, width, height, x, y, h_sobel)
			// Get total gradient
			int t_g = v_g + h_g
			// Edge threshold (250) Note that large thresholds generate few edges
			if t_g > 250:
				// Color the edge as white 
				newPixels[pos] = WHITE
			else:
				// Color other pixels as black
				newPixels[pos] = BLACK
			sys.out.print_s("At x = ")
			sys.out.print(x)
			sys.out.print_s(" y = ")
			sys.out.print(y)
			sys.out.print_s(" newPixels[pos] = ")
			sys.out.println(newPixels[pos])
			y = y + 1
		x = x + 1
	// A white rectangle (3x3) is at the center (2,2) to (5,5)
	assert newPixels[18] == WHITE // Pixel (2,2) is white edge
	assert newPixels[36] == WHITE // Pixel (4,4) is white edge
	assert newPixels[45] == WHITE // Pixel (5,5) is white edge
	// The pixels outside the rectagle all are black
	assert newPixels[0] == BLACK
	assert newPixels[63] == BLACK


