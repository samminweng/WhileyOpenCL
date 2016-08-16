import whiley.lang.*
import whiley.lang.Math
// This example code illustrates sobel edge detction on grey (black/white) pictures 
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
	if pos >= 0:
		if pos >= size:
			pos = (size -1) - (pos -size)
	else:
		// Negated pos
		pos = -1 - pos
	return pos

// Perform convolution on image and sobel filter
function convolution(Matrix image,
			 		 int xCenter, int yCenter, int[] filter) ->int:
	int sum = 0
	int filterSize = 3
	int filterHalf = 1
	int filterY = 0
	int width = image.width
	int height = image.height
	int[] pixels = image.pixels
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
	// Use the absolute value to replace the sqrt
	return Math.abs(sum)

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
	int[] pixels = [255;size] 
	// Color the pixels as a black edge
	pixels[12] = 0
	pixels[20] = 0
	pixels[28] = 0
	pixels[36] = 0
	// Create a Matrix structure
	Matrix image = matrix(width, height, pixels)
	int[] newPixels = [255;size]
	// vertical sobel filter
	int[] v_sobel = [-1,-2,-1,0,0,0,1,2,1]
	int[] h_sobel = [1,2,1,0,0,0,-1,-2,-1]
	// Iterate each pixel
	int x = 0
	while x<width:
		int y = 0
		while y<height:
			int pos = x*width + y
			int v_g = convolution(image, x, y, v_sobel)
			int h_g = convolution(image, x, y, h_sobel)
			int t_g = v_g + h_g
			// Edge threshold (250)
			if t_g > 250:
				// Detect and color an edge as black 
				newPixels[pos] = 0
			else:
				// Color other pixel as white
				newPixels[pos] = 255
			y = y + 1
		x = x + 1
	// Store resulting 'newPixels' array with a Matrix structure
	Matrix newImage = matrix(width, height, newPixels)
	sys.out.println_s("Input Image:")
	print_mat(sys, image)
	sys.out.println_s("Output Image:")
	print_mat(sys, newImage)



