import whiley.lang.*
import whiley.lang.Math
// This example code illustrates sobel edge detction on black/white pictures
// with additional 'Matrx' structure 
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

// Define the 'MatrixMult' class
type Matrix is ({
    int width,
    int height,
    int[] pixels // pixels[i*width+j] := pixels[i][j]
} this)
// ========================================================
// Create a Matrix
// ========================================================
function matrix(int width, int height, int[] pixels) -> Matrix:
    return {
        width: width,
        height: height,
        pixels: pixels
    }


// Wrap the position into 0..size
function wrap(int pos, int size) -> int:
	if pos < 0:
		// Negated pos
		pos = 0 - pos
	else:
		if pos >= size:
			pos = pos -size
	return pos

// Perform image convolution
function convolution(Matrix a, int xCenter, int yCenter, int[] filter) ->int:
	int sum = 0
	int filterSize = 3
	int filterHalf = 1
	int filterY = 0
	int[] pixels = a.pixels
	int width = a.width
	int height = a.height
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

//========================================================
// Print out a Matrix 
// ========================================================   
method print_mat(System.Console sys, Matrix a):
    int i = 0
    int width = a.width
    int height = a.height
    while i < height:
        int j = 0
        while j < width:
            sys.out.print(a.pixels[i*width+j])
            sys.out.print_s(" ")
            j = j + 1
        i = i + 1
        sys.out.println_s("")

// Main function
method main(System.Console sys):
	int width = 8
	int height = 8
	int size = width * height
	// Set all pixels to be white
	int[] pixels = [WHITE;size] 
	// Place a black square (1x1) at (0,0) position 
	pixels[0] = BLACK // (0,0)
	// Create a Matrix structure
	Matrix image = matrix(width, height, pixels)
	int[] newPixels = [WHITE;size]
	// vertical and horizontal sobel filter (3x3 kernel)
	int[] v_sobel = [-1,0,1,-2,0,2,-1,0,1]
	int[] h_sobel = [1,2,1,0,0,0,-1,-2,-1]
	// Iterate each pixel
	int x = 0
	while x<width:
		int y = 0
		while y<height:
			int pos = x*width + y
			int v_g = convolution(image, x, y, v_sobel)
			int h_g = convolution(image, x, y, h_sobel)
			int t_g = Math.abs(v_g) + Math.abs(h_g)
			// Edge threshold
			if t_g > 128:
				// Color the edge as white 
				newPixels[pos] = WHITE
			else:
				// Color other pixel as Black
				newPixels[pos] = BLACK
			y = y + 1
		x = x + 1
	// Store resulting 'newPixels' array with a Matrix structure
	Matrix newImage = matrix(width, height, newPixels)
	sys.out.println_s("Input Image:")
	print_mat(sys, image)
	sys.out.println_s("Output Image:")
	print_mat(sys, newImage)



