package edu.ntnu.stud.model.transform;

import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;

import java.util.Arrays;
import java.util.stream.DoubleStream;

/**
 * <h1> Class for 2D Affine Transformations  <h1/>
 * <p> This class implements the Transform2D interface </p>
 */

public class AffineTransform2D implements Transform2D {

  /**
   * <h1> Constructor </h1>
   * <p> Since the formula for an Affine transformation is Ax + b where x A is a matrix and b is a vector we need both. </p>
   *
   * @param matrix <p> Matrix for constructor uses Matrix2X2 class </p>
   * @param vector <p> Vector for constructor uses  Vector2D class</p>
   */
  public AffineTransform2D(Matrix2x2 matrix, Vector2D vector) {
    this.matrix = matrix;
    this.vector = vector;
  }

  private final Vector2D vector;
  private final Matrix2x2 matrix;

  /**
   * <h1> Transform method </h1>
   * <p> This method takes care of the actual Affine transformation. </p>
   *
   * @param point <p> This is the x in Ax + b formula </p>
   * @return Vector2D <p> This is the vector product of the transformation </p>
   */
  @Override
  public Vector2D transform(Vector2D point) {
    Vector2D Ax = matrix.multiply(point);
    return Ax.add(vector);
  }

  /**
   * <h2> getVectorValues </h2>
   * <p> This is used to get the data from the affine transformation as a raw double[] array <p>
   *
   * @return <p> double[] array with the vector and matrices values </p>
   */
  public double[] getVectorValues() {
    double[] matrixArray = matrix.getMatrixAsArray();
    double[] vectorArray = vector.getVectorAsArray();

    return DoubleStream.concat(Arrays.stream(matrixArray), Arrays.stream(vectorArray)).toArray();
  }
}
