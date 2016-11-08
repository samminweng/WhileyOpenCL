import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*
import whiley.lang.Math
// This example code illustrates sobel edge detction on black/white pictures
// with additional 'image' structure and write output as a 'output.in' file for verification
// reference: https://en.wikipedia.org/wiki/Sobel_operator
// Define Colour value (https://mothereff.in/binary-ascii)
constant SPACE is 00100000b // ASCII code of space (' ') 
constant BLACK is 01100010b // ASCII code of 'b' 
constant NEWLINE is 00001010b // ASCII code of 'newline'
constant EOF is 0b // End of file


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
			if (pixels[pos] != NEWLINE) && (pixels[pos] != EOF):
				// Get vertical gradient
				int v_g = convolution(input, x, y, v_sobel)
				// Get horizontal gradient
				int h_g = convolution(input, x, y, h_sobel)
				// Get total gradient
				int t_g = Math.abs(v_g) + Math.abs(h_g)
				// Edge threshold (128) Note that large thresholds generate few edges
				if t_g <= 128:
					// Color the pixel as black
					newPixels[pos] = BLACK
			else:
				newPixels[pos] = pixels[pos]
			y = y + 1
		x = x + 1
	// Store resulting 'newPixels' array with a Image structure
	return image(width, height, newPixels)

// Output the image to a file
method write_image(System.Console sys, Image im):
	byte[] pixels = im.pixels
	// Write output to a file
	File.Writer w = File.Writer("output.txt")
	w.write(pixels)
	w.close()

// Main function
method main(System.Console sys):
	int width = 33
	int height = 16
	int size = width * height
	// 'image.in' (16x16)
	File.Reader file = File.Reader("image.in")
	// Read an image as a byte array
	byte[] pixels = file.readAll()
	// Create an Image structure to store input image
	Image input = image(width, height, pixels)
	// Output the result image that is filtered with sobel edge 
	Image output = sobelEdgeDetection(input)
	sys.out.println_s("Output Image:")
	write_image(sys, output)
	// Ensure array sizes 
	assert |output.pixels| == |input.pixels|