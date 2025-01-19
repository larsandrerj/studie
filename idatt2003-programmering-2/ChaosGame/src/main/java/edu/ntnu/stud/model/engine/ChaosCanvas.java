package edu.ntnu.stud.model.engine;

import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * <h1>ChaosCanvas</h1>
 * <p>Class for representing the canvas that a fractal will be drawn on</p>
 */
public class ChaosCanvas {

  /**
   * <h3> Logger for class </h3>
   */
  private static final Logger logger = LoggerFactory.getLogger(ChaosCanvas.class);

  /**
   * <h2>Canvas</h2>
   * <p>Two-dimensional int array that will contain the pixels to draw an image</p>
   * <p>First dimension of the canvas represents height, the second represents width</p>
   * <p>Will contain 0 if given index is blank, and 1 if it is not</p>
   */
  private final int[][] canvas;

  /**
   * <h2>Width</h2>
   * <p>Int used to determine the width of the canvas</p>
   */
  private final int width;

  /**
   * <h2>Height</h2>
   * <p>Int used to determine the height of the canvas</p>
   */
  private final int height;

  /**
   * <h2>MinCoords</h2>
   * <p>
   * Vector that determines the bottom-left corner of a two-dimensional cartesian plane,
   * in which the  fractal is drawn
   * </p>
   */
  private final Vector2D minCoords;

  /**
   * <h2>MaxCoords</h2>
   * <p>
   * Vector that determines the top-right corner of a two-dimensional cartesian plane,
   * in which the fractal is drawn
   * </p>
   */
  private final Vector2D maxCoords;

  /**
   * <h2>transformCoordsToIndices</h2>
   * <p>
   * AffineTransform2D instance used to translate from coordinates to indices on the canvas
   * </p>
   */
  protected final AffineTransform2D transformCoordsToIndices;

  /**
   * <h2>constructor</h2>
   *
   * @param width     <p>the width in the x-plane to the canvas</p>
   * @param height    <p>the height in the y-plane to the canvas</p>
   * @param minCoords <p>lowest coordinates in x and y direction on the cartesian plane</p>
   * @param maxCoords <p>highest coordinates in x and y direction on the cartesian plane</p>
   */
  public ChaosCanvas(int width, int height, Vector2D minCoords, Vector2D maxCoords) {
    assertNumberIsGreaterThanZero(
        width
    );
    assertNumberIsGreaterThanZero(
        height
    );

    assertLhsIsGreaterThanRhs(
        maxCoords.getX0(),
        minCoords.getX0()
    );
    assertLhsIsGreaterThanRhs(
        maxCoords.getX1(),
        minCoords.getX1()
    );

    this.width = width;
    this.height = height;
    this.minCoords = minCoords;
    this.maxCoords = maxCoords;
    this.canvas = new int[height][width];
    clear();
    this.transformCoordsToIndices = setTransformCoordsToIndices();
  }

  /**
   * <h2>setTransformCoordsToIndices</h2>
   * <p>
   * AffineTransform2D instance used to transform points of coordinates to indices on the
   * canvas
   * </p>
   *
   * @return <p>Object that will be used to transform points</p>
   */

  private AffineTransform2D setTransformCoordsToIndices() {

    double minX0 = minCoords.getX0();
    double minX1 = minCoords.getX1();

    double maxX0 = maxCoords.getX0();
    double maxX1 = maxCoords.getX1();

    Matrix2x2 AMatrix = new Matrix2x2(
        0,
        (height - 1) / (minX1 - maxX1),
        (width - 1) / (maxX0 - minX0),
        0
    );

    Vector2D bVector = new Vector2D(
        ((height - 1) * maxX1) / (maxX1 - minX1),
        ((width - 1) * minX0) / (minX0 - maxX0)
    );

    return new AffineTransform2D(AMatrix, bVector);
  }

  /**
   * <h2>getPixel</h2>
   * <p>
   * Method which translates a point from the cartesian plane, to a point on the canvas,
   * then returns said point
   * </p>
   *
   * @param point <p>point to represent the coordinates</p>
   * @return <p>value of a point on the canvas</p>
   */

  public int getPixel(Vector2D point) {
    Vector2D indices = transformCoordsToIndices.transform(point);

    int i = (int) indices.getX0();
    int j = (int) indices.getX1();

    if (i >= 0 && i < height && j >= 0 && j < width) {
      return canvas[i][j];
    }

    return -1;
  }

  /**
   * <h2>putPixel</h2>
   * <p>
   * Method that translates coordinates to indices,
   * then adds a 1-value to the point on the canvas to represent a pixel
   * </p>
   *
   * @param point <p>point to represent the coordinates</p>
   */

  public int[] putPixel(Vector2D point) {
    Vector2D indices = transformCoordsToIndices.transform(point);
    int i = (int) indices.getX0();
    int j = (int) indices.getX1();

    if (i >= 0 && i < height && j >= 0 && j < width) {
      canvas[i][j]++;
      return new int[]{i, j};
    }
    return new int[]{0, 0};
  }

  /**
   * <h2>getCanvasArray</h2>
   * <p>
   * Method which returns the int canvas array
   * </p>
   *
   * @return <p>canvas array</p>
   */
  public int[][] getCanvasArray() {
    return canvas;
  }

  /**
   * <h2>getWidth</h2>
   * <p>
   * Method which returns the width of the canvas
   * </p>
   *
   * @return <p>width</p>
   */
  public int getWidth() {
    return width;
  }

  /**
   * <h2>getHeight</h2>
   * <p>
   * Method which returns the height of the canvas
   * </p>
   *
   * @return <p>height</p>
   */
  public int getHeight() {
    return height;
  }

  /**
   * <h2>clear</h2>
   * <p>
   * Method that goes through every indice on the canvas and sets its value as 0
   * </p>
   */
  public void clear() {
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < width; j++) {
        this.canvas[i][j] = 0;
      }
    }
  }

  /**
   * <h2>assertNumberIsGreaterThanZero</h2>
   * <p>
   * Asserts that the given number is greater than zero
   * </p>
   *
   * @param number <p>number that will be asserted</p>
   * @throws IllegalArgumentException <p>if number is not greater than zero</p>
   */
  private void assertNumberIsGreaterThanZero(int number) throws IllegalArgumentException {
    if (!(number > 0)) {
      String error = "Illegal argument. Number is not greater than zero";
      logger.error(error);
      throw new IllegalArgumentException(
          error
      );
    }
  }

  /**
   * <h2>assertLhsIsGreaterThanRhs</h2>
   * <p>
   * Asserts that lhs is greater than rhs
   * </p>
   *
   * @param lhs <p>number that will be asserted is greater than rhs</p>
   * @param rhs <p>number that will be asserted is lesser than lhs</p>
   * @throws IllegalArgumentException <p>if lhs is not greater than rhs</p>
   */
  private void assertLhsIsGreaterThanRhs(double lhs, double rhs) throws IllegalArgumentException {
    if (!(lhs > rhs)) {
      String error = "Illegal argument. First number is not greater than the second";
      logger.error(error);
      throw new IllegalArgumentException(
          error);
    }
  }
}
