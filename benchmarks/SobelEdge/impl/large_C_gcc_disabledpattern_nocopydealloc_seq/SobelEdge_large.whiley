import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*
import whiley.lang.Math

constant SPACE is 00100000b // ASCII code of space (' ')
constant BLACK is 01100010b // ASCII code of 'b'
constant TH is 800 // Control the number of edges

function wrap(int pos, int size) -> int:
	if pos>=size:
		return (size -1) - (pos - size)
	else:
		if pos <0:
			return -1 - pos
		else:
			return pos

// Perform convolution convolution on pixel at 'xCenter' and 'yCenter'
function convolution(byte[] pixels, int width, int height, int xCenter, int yCenter, int[] kernel) ->int:
	int sum = 0
	int kernelSize = 3
	int kernelHalf = 1
	int kernelY = 0
	while kernelY < kernelSize:
		int y=Math.abs((yCenter+kernelY-kernelHalf)%height)
		int kernelX = 0
		while kernelX < kernelSize:
			int x=Math.abs((xCenter + kernelX - kernelHalf)%width)
			// Get pixel
			int pixel = Byte.toUnsignedInt(pixels[y*width+x])
			// Get kernel value
			int kernelVal = kernel[kernelY*kernelSize+kernelX]
			// pixel * kernel value
			sum = sum + pixel * kernelVal
			kernelX = kernelX + 1
		kernelY = kernelY + 1
	return sum

// Perform Sobel edge detection
function sobelEdgeDetection(byte[] pixels, int width, int height) -> byte[]:
	int size = width * height
	// The output image of sobel edge detection
	byte[] newPixels = [SPACE;size] // A blank picture
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
			// Edge threshold (64) Note that large thresholds generate few edges
			if t_g > TH:
				// Color other pixels as black
				newPixels[pos] = BLACK
			y = y + 1
		x = x + 1
	return newPixels

// Print a pbm image
method print_pbm(System.Console sys, int width, int height, byte[] pixels):
    // File type
    sys.out.println_s("P1")
    // Width + height
    sys.out.print(width)
    sys.out.print_s(" ")
    sys.out.println(height)
    // An array of bytes with an row of pixels in width
    int j = 0
    while j<height:
        int i = 0
        while i<width:
            int pos = j*width + i
            if pixels[pos] == SPACE:
                sys.out.print(0)
            else:
                sys.out.print(1)
		    // Each pixel is separated by a space
            //sys.out.print_s(" ")
            i = i + 1
        // Add a newline
        sys.out.println_s("")
        j = j + 1

// Main function
method main(System.Console sys):
	// args[0]: width, args[1]: file name
	int|null n = Int.parse(sys.args[0])
	File.Reader file = File.Reader(sys.args[1])
	if n != null:
		int width = n
		int height = 2048
		// Read a PBM image as a byte array
		byte[] pixels = file.readAll()
		byte[] newPixels = sobelEdgeDetection(pixels, width, height)
		sys.out.println_s("Blurred Image sizes:   ")
		sys.out.print(|newPixels|)
		sys.out.println_s(" bytes")
		//print_pbm(sys, width, height, newPixels)
