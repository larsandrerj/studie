package edu.ntnu.stud.model.linalg;

/**
 * <h1>
 * Vector2D
 * </h1>
 * <p>
 * Class which represents a 2D vector or point:
 * <br>
 * [ x0 ]
 * <br>
 * [ x1 ]
 * </p>
 * <p>
 * Class contains methods for subtracting and adding with other Vector2D objects
 * </p>
 */
public class Vector2D {
  private final double x0;
  private final double x1;

  /**
   * <h2> Constructor </h2>
   * <p> Creates a Vector2D object with given x0 and x1 values </p>
   *
   * @param x0 <p> double x0 value </p>
   * @param x1 <p> double x1 value </p>
   */
  public Vector2D(double x0, double x1) {
    this.x0 = x0;
    this.x1 = x1;
  }

  /**
   * <h2> getX0 </h2>
   * <p> Returns the x0 value of the vector </p>
   *
   * @return <p> double x0 value </p>
   */
  public double getX0() {
    return x0;
  }

  /**
   * <h2> getX1 </h2>
   * <p> Returns the x1 value of the vector </p>
   *
   * @return <p> double x1 value </p>
   */
  public double getX1() {
    return x1;
  }

  /**
   * <h1>
   * Add
   * </h1>
   * <p>
   * Adds the vector with a given Vector2D object
   * </p>
   * <p>
   * Uses formula:
   * <br>
   * <i>
   * x + y = b
   * <br>
   * [ x0 + y0 ]
   * <br>
   * [ x1 + y1 ]
   * <br>
   * =
   * <br>
   * [ b0 ]
   * <br>
   * [ b1 ]
   * </i>
   * </p>
   * <p>
   * x: 2D Vector
   * <br>
   * y: 2D Vector
   * <br>
   * b: 2D Vector
   * </p>
   *
   * @param other <p>Vector2D object that will be added to current vector</p>
   * @return <p>result Vector2D</p>
   */
  public Vector2D add(Vector2D other) {
    return new Vector2D(
        x0 + other.getX0(),
        x1 + other.getX1()
    );
  }

  /**
   * <h1>
   * Add
   * </h1>
   * <p>
   * Subtracts the vector with a given Vector2D object
   * </p>
   * <p>
   * Uses formula:
   * <br>
   * <i>
   * x - y = b
   * <br>
   * [ x0 - y0 ]
   * <br>
   * [ x1 - y1 ]
   * <br>
   * =
   * <br>
   * [ b0 ]
   * <br>
   * [ b1 ]
   * </i>
   * </p>
   * <p>
   * x: 2D Vector
   * <br>
   * y: 2D Vector
   * <br>
   * b: 2D Vector
   * </p>
   *
   * @param other <p>Vector2D object that will be subtracted to current vector</p>
   * @return <p>result Vector2D</p>
   */
  public Complex subtract(Vector2D other) {
    return new Complex(
        x0 - other.getX0(),
        x1 - other.getX1()
    );
  }

  /**
   * <h2> getVectorAsArray </h2>
   * <p> Returns a Vector2D object as an array containing the vector values </p>
   *
   * @return <p> double[] array containing vector values  </p>
   */
  public double[] getVectorAsArray() {
    return new double[]{x0, x1};
  }
}
