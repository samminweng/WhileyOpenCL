import whiley.lang.*

// This example code illustrates the image convolution
// reference: http://www.songho.ca/dsp/convolution/convolution2d_example.html
// Wrap the position into 0..size
function wrap(int pos, int size) -> int:
	if pos >= 0:
		if pos >= size:
			pos = (size -1) - (pos -size)
	else:
		// Negated pos
		pos = -1 - pos
	return pos
// Perform convolution
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
	int width = 5
	int height = 5
	int size = width * height
	int[] pixels = [0;size]
	// Update one pixel
	pixels[5] = 256
	int[] newPixels = [0;size]
	// vertical sobel filter
	int[] sobel = [-1,-2,-1,0,0,0,1,2,1]
	// Iterate each pixel
	int x = 0
	while x<width:
		int y = 0
		while y<height:
			int pos = x*width + y
			newPixels[pos] = convolution(pixels, width, height, x, y, sobel)
			sys.out.print_s("At pos = ")
			sys.out.print(pos)
			sys.out.print_s(", newPixels[pos] = ")
			sys.out.println(newPixels[pos])
			y = y + 1
		x = x + 1




