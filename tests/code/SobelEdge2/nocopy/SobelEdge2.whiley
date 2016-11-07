import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*
import whiley.lang.Math
// This example code illustrates sobel edge detction on black/white pictures
// and write the output as a file 
// reference: https://en.wikipedia.org/wiki/Sobel_operator
// Define Colour value
constant SPACE is 00100000b // ASCII code of space (' ') 
constant BLACK is 01100010b // ASCII code of 'b' 


// Define 'Image' class
type Image is ({
    int width,
    int height,
    byte[] pixels // pixels[y*width+x] := pixels[x][y]
} this)
// ========================================================
// Create a image structure
// ========================================================
function image(int width, int height, byte[] pixels) -> Image:
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
	byte[] pixels = A.pixels
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
			int pixel = Byte.toUnsignedInt(pixels[y*width+x])
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
	byte[] pixels = input.pixels
	int width = input.width
	int height = input.height
	// The output image of sobel edge detection
	byte[] newPixels = [SPACE;width*height]
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
			int v_g = convolution(input, x, y, v_sobel)
			// Get horizontal gradient
			int h_g = convolution(input, x, y, h_sobel)
			// Get total gradient
			int t_g = Math.abs(v_g) + Math.abs(h_g)
			// Edge threshold (128) Note that large thresholds generate few edges
			if t_g > 128:
				// Color the edge as white 
				newPixels[pos] = SPACE
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
	byte[] pixels = im.pixels
	int width = im.width
	int height = im.height
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

// Main function
method main(System.Console sys):
	int width = 8
	int height = 8
	int size = width * height
	// Set all pixels to be white
	byte[] pixels = [SPACE;size] 
	// Place a black pixel at (0,0) position 
	pixels[0] = BLACK // (0,0)
	// Place a black pixel at (3,4) position 
	pixels[4*width+3] = BLACK // (3,4)
	// Create an Image structure to store input image
	Image input = image(width, height, pixels)
	// Output the result image that is filtered with sobel edge 
	Image output = sobelEdgeDetection(input)
	sys.out.println_s("Input Image:")
	print_image(sys, input)
	sys.out.println_s("Sobel Edge Detection:")
	print_image(sys, output)
	// Write output to a file
	File.Writer w = File.Writer("output.txt")
	w.write(output.pixels)
	w.close()