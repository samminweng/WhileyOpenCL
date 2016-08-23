import whiley.lang.*
import whiley.lang.Math
// This code benchmark the sobel edge detection with matrix size
// reference: https://en.wikipedia.org/wiki/Sobel_operator

// Define Colour value
constant WHITE is 255
constant BLACK is 0

// Wrap the position into 0..size
// Use modulos operator
function wrap(int pos, int size) -> int:
	if pos < 0:
		// Map the negated position from 'size' to 0
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
	int|null n = Int.parse(sys.args[0])
	if n != null:
		int max = n
		int width = n
		int height = n
		int size = width * height
		// The input image is a white image of 8 x 8 pixels
		// with a black square at the center 
		int[] pixels = [WHITE;size]
		// Place a black square (1x1) at (0,0) position 
		pixels[0] = BLACK // (0,0)
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
		// A black square at (0,0)
		sys.out.print_s("At (0, 0)")
		sys.out.print_s(" newPixels[pos] = ")
		sys.out.println(newPixels[0])
		// A white square at (1, 0)
		sys.out.print_s("At (1,0)")
		sys.out.print_s(" newPixels[pos] = ")
		sys.out.println(newPixels[width])
		// A white squre at (width-1, height-1)
		sys.out.print_s("At (")
		sys.out.print(width-1)
		sys.out.print_s(", ")
		sys.out.print(height-1)
		sys.out.print_s(") newPixels[pos] = ")
		sys.out.println(newPixels[size-1])

