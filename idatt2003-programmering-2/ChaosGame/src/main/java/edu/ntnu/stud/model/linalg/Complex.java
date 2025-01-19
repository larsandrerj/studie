package edu.ntnu.stud.model.linalg;


/**
 * <h1>Complex</h1>
 * <p>
 * Class which represents a complex number: <br>
 * complex number z = a + b * i <br>
 * Where a is the real part, and b is the imaginary part, and i is the imaginary number.
 * </p>
 */
public class Complex extends Vector2D {
  /**
   * <h2>Constructor</h2>
   *
   * @param realPart      <p>double real part</p>
   * @param imaginaryPart <p>double imaginary part</p>
   */
  public Complex(double realPart, double imaginaryPart) {
    super(realPart, imaginaryPart);
  }

  /**
   * <h2>sqrt</h2>
   * <p>
   * Returns the square root of Complex.
   * <br>
   * sqrt(z) =
   * sqrt( (1/2) * ( sqrt(a² + b²) + a ) ) +
   * i * (b / |b|) * sqrt( (1/2) * ( sqrt(a² + b²) - a ) )
   * </p>
   *
   * @return <p>positive square root of Complex</p>
   */
  public Complex sqrt() {

    // z = a + b * i
    // z = complex number
    // a = real part
    // b = imaginary part
    // i = imaginary number
    // sqrt(z) =
    //  sqrt( (1/2) * ( sqrt(a² + b²) + a ) )
    //  + i * (b / |b|) * sqrt( (1/2) * ( sqrt(a² + b²) - a ) )

    double a = super.getX0();
    double b = super.getX1();

    double lengthComplex = Math.sqrt(a * a + b * b);

    double sqrtRealPart = Math.sqrt((lengthComplex + a) / 2);
    double sqrtImaginaryPart = 0;

    if (b != 0) {
      sqrtImaginaryPart = (b / Math.abs(b)) * Math.sqrt((lengthComplex - a) / 2);
    }

    return new Complex(sqrtRealPart, sqrtImaginaryPart);
  }
}
