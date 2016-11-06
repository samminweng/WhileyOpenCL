import * from whiley.io.File
import whiley.lang.*
import whiley.lang.Math
// This example code illustrates sobel edge detction on black/white pictures
// with additional 'image' structure 
// reference: https://en.wikipedia.org/wiki/Sobel_operator

// Define Colour value
constant WHITE is 11111111b
constant BLACK is 0b

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
	byte[] newPixels = [WHITE;width*height]
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
				newPixels[pos] = WHITE
			else:
				// Color other pixels as black
				newPixels[pos] = BLACK
			y = y + 1
		x = x + 1
	// Store resulting 'newPixels' array with a Image structure
	return image(width, height, newPixels)

// Output the image to a file
method print_image(System.Console sys, Image im):
	byte[] pixels = im.pixels
	int width = im.width
	int height = im.height
	int y = 0
	//byte[] output = [WHITE;width*height]
	while y<height:
		int x = 0
		while x<width:
			int pos = y*width + x
			// Print out each pixel value
			if pixels[pos] == WHITE:
				//output[pos]=WHITE
				sys.out.print_s("w")
			else:
				//output[pos]=BLACK
				sys.out.print_s("b")
			sys.out.print_s(" ")
			x = x + 1
		y = y + 1
		sys.out.println_s("")
	// Write output to a file
	//File.Writer w = File.Writer("output.jpg")
	//w.write(output)
	//w.close()

// Main function
method main(System.Console sys):
	int width = 32
	int height = 32
	int size = width * height
	File.Reader file = File.Reader("image.jpg")
	// Read an image as a byte array
	byte[] pixels = file.readAll()
	// Create an Image structure to store input image
	Image input = image(width, height, pixels)
	// Output the result image that is filtered with sobel edge 
	Image output = sobelEdgeDetection(input)
	sys.out.println_s("Input Image:")
	print_image(sys, input)
	sys.out.println_s("Output Image:")
	print_image(sys, output)
	