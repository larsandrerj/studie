package edu.ntnu.stud.model.linalg;

/**
 * <h1>Matrix2x2</h1>
 * <p>
 * Class which represents a 2 x 2 matrix:
 * <br>
 * [a00  a01]
 * <br>
 * [a10  a11]
 * </p>
 * <p>
 * The class contains a method for multiplying the matrix with a given Vector2D object
 * </p>
 */
public class Matrix2x2 {
  /**
   * <h2>Matrix values</h2>
   * <p>
   * The matrix values which make the matrix:
   * <br>
   * [a00  a01]
   * <br>
   * [a10  a11]
   * </p>
   */
  private final double a00;
  private final double a01;
  private final double a10;
  private final double a11;

  /**
   * <h2>Constructor</h2>
   *
   * @param a00 <p>double a00 value</p>
   * @param a01 <p>double a01 value</p>
   * @param a10 <p>double a10 value</p>
   * @param a11 <p>double a11 value</p>
   */
  public Matrix2x2(double a00, double a01, double a10, double a11) {
    this.a00 = a00;
    this.a01 = a01;
    this.a10 = a10;
    this.a11 = a11;
  }

  /**
   * <h1>
   * Multiply
   * </h1>
   * <p>
   * Multiplies the matrix with a given Vector2D object
   * </p>
   * <p>
   * Uses formula:
   * <br>
   * <i>
   * A * x = b
   * <br>
   * [ a00 * x0 + a01 * x1 ]
   * <br>
   * [ a10 * x0 + a11 * x2 ]
   * <br>
   * =
   * <br>
   * [ b0 ]
   * <br>
   * [ b1 ]
   * <br>
   * </i>
   * </p>
   * <p>
   * A: 2x2 Matrix
   * <br>
   * v: 2D Vector
   * <br>
   * b: 2D Vector
   * </p>
   *
   * @param vector <p>Vector which is multiplied with the matrix</p>
   * @return <p>instance of Vector2D</p>
   */

  public Vector2D multiply(Vector2D vector) {
    double x0 = vector.getX0();
    double x1 = vector.getX1();

    return new Vector2D(
        a00 * x0 + a01 * x1,
        a10 * x0 + a11 * x1
    );
  }

  /**
   * <h2> getMatrixAsArray </h2>
   * <p> gets matrix as a double array[] </p>
   *
   * @return <p> double [] array </p>
   */
  public double[] getMatrixAsArray() {
    return new double[]{a00, a01, a10, a11};
  }
}
