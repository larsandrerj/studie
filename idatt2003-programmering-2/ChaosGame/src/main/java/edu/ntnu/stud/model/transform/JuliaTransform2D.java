package edu.ntnu.stud.model.transform;

import edu.ntnu.stud.model.linalg.Complex;
import edu.ntnu.stud.model.linalg.Vector2D;

import java.util.Random;

/**
 * <h1> JuliaTransform2D </h1>
 * <p> This class implement the TransForm2D Interface to create Julia transformations </p>
 * <br/>
 */

public class JuliaTransform2D implements Transform2D {
  private final Complex complexPoint;
  private final Random random = new Random();

  /**
   * <h1> Constructor for JuliaTransform2D </h1>
   *
   * @param complexPoint <p> Inputs a Complex point as a vector form where x0 is the real part and x1 = is the imaginary part.</p>
   */
  public JuliaTransform2D(Complex complexPoint) {
    this.complexPoint = complexPoint;
  }

  /**
   * <h1> transform method </h1>
   * <p>inputs a point to create a julia transformation from. Point i Z in Sqrt(Z-C) </p>
   * <p> Some converting of objects is necessary to use correctly format the return statment </p>
   *
   * @param point <p> Point to input </p>
   * @return Vector2D <p> Vector that correlates to the new point post transformation <p/>
   */
  @Override
  public Vector2D transform(Vector2D point) {
    Complex Z = new Complex(point.getX0(), point.getX1());
    Complex zMinusC = Z.subtract(complexPoint);
    Complex sqrtZMinusC = zMinusC.sqrt();

    //Random sign to simulate ±
    int sign = random.nextInt(2) == 1 ? 1 : -1;
    double CorrectedX0 = sqrtZMinusC.getX0() * sign;
    double CorrectedX1 = sqrtZMinusC.getX1() * sign;

    return new Vector2D(CorrectedX0, CorrectedX1);
  }

  /**
   * <h2> getComplexPointAsArray </h2>
   * <p> This returns the complex point as a double[] array </p>
   *
   * @return <p> double[] array </p>
   */
  public double[] getComplexPointAsArray() {
    return new double[]{complexPoint.getX0(), complexPoint.getX1()};
  }
}

