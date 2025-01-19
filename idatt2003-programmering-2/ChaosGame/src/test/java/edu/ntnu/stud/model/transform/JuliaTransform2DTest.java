package edu.ntnu.stud.model.transform;

import edu.ntnu.stud.model.linalg.Complex;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class JuliaTransform2DTest {
  @Test
  @DisplayName("Test Transform method (positive)")

  void positiveTestTransform(){
      JuliaTransform2D juliaTransform = new JuliaTransform2D(new Complex(1.0, -1.0));
      Vector2D inputPoint = new Vector2D(2.0, 3.0);
      Vector2D transformedPoint = juliaTransform.transform(inputPoint);

      Complex z = new Complex(inputPoint.getX0(), inputPoint.getX1());
      Complex zMinusC = z.subtract(new Complex(1.0, -1.0));
      Complex sqrtZMinusC = zMinusC.sqrt();

      // Check both positive and negative possibilities by squaring results
      double expectedX0Squared = Math.pow(sqrtZMinusC.getX0(), 2);
      double expectedX1Squared = Math.pow(sqrtZMinusC.getX1(), 2);
      double transformedX0Squared = Math.pow(transformedPoint.getX0(), 2);
      double transformedX1Squared = Math.pow(transformedPoint.getX1(), 2);

      assertTrue(Math.abs(expectedX0Squared - transformedX0Squared) < 0.001);
      assertTrue(Math.abs(expectedX1Squared - transformedX1Squared) < 0.001);
    }

  @Test
  @DisplayName("Test Transform method with simple square root")
  void testSimpleSquareRootTransform() {

    Complex complexPoint = new Complex(0,0);

    JuliaTransform2D juliaTransform = new JuliaTransform2D(complexPoint);

    Vector2D testPoint = new Vector2D(4,0);

    Vector2D returnedVector = juliaTransform.transform(testPoint);

    Vector2D expectedPoint = new Vector2D(2,0);
    double returnedPointX0 = Math.sqrt(Math.pow(returnedVector.getX0(), 2));
    double returnedPointX1 = Math.sqrt(Math.pow(returnedVector.getX1(), 2));

    assertEquals(expectedPoint.getX0(), returnedPointX0);
    assertEquals(expectedPoint.getX1(), returnedPointX1);
  }

  @Test
  @DisplayName("Test if getComplexPointAsVector returns correct vector")
  void getComplexPointAsArrayTestPositive(){

    Complex complexPoint = new Complex(5,7 );
    JuliaTransform2D juliaTransform2D = new JuliaTransform2D(complexPoint);
    double[] complexPointAsArray = juliaTransform2D.getComplexPointAsArray();

    assertEquals(5.0, complexPointAsArray[0]);
    assertEquals(7.0, complexPointAsArray[1]);
  }
}