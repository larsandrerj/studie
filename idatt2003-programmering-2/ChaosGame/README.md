## Chaos Game Group 29
This game was created in regards to the final assignment given in Programming 2 (IDATT 2003).

A Chaos game is a program that uses a list of transformations and randomly chooses one, then places a point on a canvas. Enough iterations of this process will create a fractal.

### How to Run and Use
Clone the repository to an IDE and run mvn javafx:run. From here, you will be able to choose from pre-made fractals, make your own, or upload your own in the form of a .txt file.


### File formats:

#### txt file format for Affine fractal in 2D:
1. Affine2D # Type of transform
2. 0, 0 # Lower left
3. 1, 1 # Upper right
4. .5, 0, 0, .5, 0, 0 # n1 transform (a00, a01, a10, a11, b0, b1)
5. .5, 0, 0, .5, .25, .5 # n2 transform
6. --------- other transforms if you would like ------- 
7. .5, 0, 0, .5, .5, 0 # nk transform

#### txt file format for Julia fractal in 2D:
1. Julia # Type of transform
2. -1.6, -1 # Lower left
3. 1.6, 1 # Upper right
4. -.74543, .11301 # Real and imaginary parts of the constant c


