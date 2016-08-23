import whiley.lang.*
import whiley.lang.Math
// This example code illustrates sobel edge detction on black/white pictures
// with additional 'image' structure 
// reference: https://en.wikipedia.org/wiki/Sobel_operator
/*
// The below code gets the colour of a given pixel.   
// 
// Cast a byte to an integer (0..255)
function toUnsignedInt(byte b) -> int:
	int x = 0
	int base = 1
	int i = 0
	while i <= 7:
		if (b & 00000001b) == 00000001b:
			x = x + base
		b = b >> 1
		base = base * 2
		i = i + 1
	return x
// Cast an integer to byte 
function toUnsignedByte(int v) -> byte:
	byte mask = 00000001b
	byte r = 0b
	int i = 0
	while i < 8:
		if (v % 2) == 1:
			r = r | mask
		v = v / 2
		mask = mask << 1
		i = i + 1
	return r
// Get the colour value from the given pixel value
function colourValue(int pixel, int colour) -> int:
	byte b = toUnsignedByte(pixel)
	byte mask = toUnsignedByte(255)
	int r = toUnsignedInt((b >>(colour * 8)) & mask)
	return r
*/

// Define Colour value
constant WHITE is 255
constant BLACK is 0

// Define 'Image' class
type Image is ({
    int width,
    int height,
    int[] pixels // pixels[y*width+x] := pixels[x][y]
} this)
// ========================================================
// Create a image structure
// ========================================================
function image(int width, int height, int[] pixels) -> Image:
    return {
        width: width,
        height: height,
        pixels: pixels
    }

// ========================================================
// Perform image convolution
// ========================================================
function convolution(Image A, int xCenter, int yCenter, int[] filter) ->int:
	// Source image data
	int[] pixels = A.pixels
	int width = A.width
	int height = A.height
	// gradient magnitude
	int sum = 0
	// Filter Size
	int filterSize = 3
	int filterHalf = 1
	int filterY = 0
	// Process the convolution (filter * A)
	while filterY < filterSize:
		// Wrap 'y' position from 0 ... height
		int y = Math.abs((yCenter+filterY-filterHalf)%height)
		int filterX = 0
		while filterX < filterSize:
			// Wrap 'x' position from 0 ... width
			int x = Math.abs((xCenter + filterX - filterHalf)%width)
			// Get pixel
			int pixel = pixels[y*width+x]
			// Get filter value
			int filterVal = filter[filterY*filterSize+filterX]
			// Compute the gradient (pixel * filter value) and add upto 'sum' 
			sum = sum + pixel * filterVal
			filterX = filterX + 1
		filterY = filterY + 1
	return sum

// ========================================================
// Perform Sobel edge detection
// ========================================================
function sobelEdgeDetection(Image input) -> Image:
	int[] pixels = input.pixels
	int width = input.width
	int height = input.height
	// The output image of sobel edge detection
	int[] newPixels = [WHITE;width*height]
	// vertical and horizontal sobel filter (3x3 kernel)
	int[] v_sobel = [-1,0,1,-2,0,2,-1,0,1]
	int[] h_sobel = [1,2,1,0,0,0,-1,-2,-1]
	// Perform sobel edge detection
	int x = 0
	while x<width:
		int y = 0
		while y<height:
			// Map (x, y) to the position at 1D
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
	// Store resulting 'newPixels' array with a Image structure
	return image(width, height, newPixels)

//========================================================
// Print out a Image 
// ========================================================   
method print_image(System.Console sys, Image im):
	int[] pixels = im.pixels
	int width = im.width
	int height = im.height
	int x = 0
	while x<width:
		int y = 0
		while y<height:
			int pos = y*width + x
			// Print out each pixel value
			if pixels[pos] == WHITE:
				sys.out.print_s("w")
			else:
				sys.out.print_s("b")
			sys.out.print_s(" ")
			y = y + 1
		x = x + 1
		sys.out.println_s("")

// Main function
method main(System.Console sys):
	int width = 8
	int height = 8
	int size = width * height
	// Set all pixels to be white
	int[] pixels = [WHITE;size] 
	// Place a black pixel at (0,0) position 
	pixels[0] = BLACK // (0,0)
	// Create an Image structure to store input image
	Image input = image(width, height, pixels)
	// Output the result image that is filtered with sobel edge 
	Image output = sobelEdgeDetection(input)
	sys.out.println_s("Input Image:")
	print_image(sys, input)
	sys.out.println_s("Output Image:")
	print_image(sys, output)