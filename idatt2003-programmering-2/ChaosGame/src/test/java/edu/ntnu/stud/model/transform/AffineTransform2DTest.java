package edu.ntnu.stud.model.transform;

import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AffineTransform2DTest {

  @Test
  @DisplayName("Test if transform method works")
  public void transformPositive(){
    Vector2D constructorVector = new Vector2D(1,2);
    Matrix2x2 constructorMatrix = new Matrix2x2(3,4,5,6);

    AffineTransform2D affineTransform2D = new AffineTransform2D(constructorMatrix, constructorVector);

    Vector2D point = new Vector2D(7, 8);

    // Should be a vector with x0 = 54 and x1 = 85
    Vector2D returnedTransformation = affineTransform2D.transform(point);


    assertEquals(54, returnedTransformation.getX0());
    assertEquals(85, returnedTransformation.getX1());
  }
  @Test
  @DisplayName("Test if transform method work")
  public void transformPositive2(){
    Vector2D constructorVector = new Vector2D(3,3);
    Matrix2x2 constructorMatrix = new Matrix2x2(4,5,6,7);

    AffineTransform2D affineTransform2D = new AffineTransform2D(constructorMatrix, constructorVector);

    Vector2D point = new Vector2D(7, 8);

    // Should be a vector with x0 = 71 and x1 = 101
    Vector2D returnedTransformation = affineTransform2D.transform(point);

    assertEquals(71, returnedTransformation.getX0());
    assertEquals(101, returnedTransformation.getX1());
  }

  @Test
  @DisplayName("Test if the getVectorValues returns the correct values")
  void getVectorValuesTestPositive(){
    Matrix2x2 matrix = new Matrix2x2(1,2,3,4);
    Vector2D vector = new Vector2D(5,6);

    AffineTransform2D affineTransform2D = new AffineTransform2D(matrix, vector);

    double[] transformationAsDoubles = affineTransform2D.getVectorValues();

    assertEquals(1.0,transformationAsDoubles[0]);
    assertEquals(2.0,transformationAsDoubles[1]);
    assertEquals(3.0,transformationAsDoubles[2]);
    assertEquals(4.0,transformationAsDoubles[3]);
    assertEquals(5.0,transformationAsDoubles[4]);
    assertEquals(6.0,transformationAsDoubles[5]);

  }

}