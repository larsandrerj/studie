package edu.ntnu.stud.controller;

import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.model.linalg.Complex;
import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import edu.ntnu.stud.model.transform.Transform2D;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

class SettingFillerTest {

  @Test
  @DisplayName("Test of getDescriptionAsArray works with affine transformations")
  void testGetDescriptionAsArrayWithAffineTransformation() {
    Vector2D minVector = new Vector2D(0, 0);
    Vector2D maxVector = new Vector2D(1, 1);

    Transform2D affineTransformation = new AffineTransform2D(new Matrix2x2(1,2,3,4), new Vector2D(5,6));
    List<Transform2D> transformations = new ArrayList<>();
    transformations.add(affineTransformation);
    ChaosGameDescription description = new ChaosGameDescription(minVector, maxVector, transformations);
    SettingFiller settingFiller = new SettingFiller(description, 1000L);

    double[][] expectedValues = {
        {0, 0},
        {1, 1},
        {1, 2, 3, 4, 5, 6}
    };

    double[][] actualValues = settingFiller.getDescriptionAsArray();
    assertArrayEquals(expectedValues, actualValues);
  }

  @Test
  @DisplayName("Test of getDescriptionAsArray works with Julia transformations")
  void testGetDescriptionAsArrayWithJuliaTransformation() {
    Vector2D minVector = new Vector2D(0, 0);
    Vector2D maxVector = new Vector2D(1, 1);

    Transform2D juliaTransformation = new JuliaTransform2D(new Complex(1,1));

    List<Transform2D> transformations = new ArrayList<>();
    transformations.add(juliaTransformation);


    ChaosGameDescription description = new ChaosGameDescription(minVector, maxVector, transformations);
    SettingFiller settingFiller = new SettingFiller(description, 1000L);

    double[][] expectedValues = {
        {0, 0},
        {1, 1},
        {1, 1}
    };

    double[][] actualValues = settingFiller.getDescriptionAsArray();
    assertArrayEquals(expectedValues, actualValues);
  }

  @Test
  @DisplayName("Test of getDescriptionAsArray works with multiple affine transformations")
  void testGetDescriptionAsArrayWithMultipleTransformations() {
    Vector2D minVector = new Vector2D(0, 0);
    Vector2D maxVector = new Vector2D(1, 1);

    Transform2D affineTransformation = new AffineTransform2D(new Matrix2x2(1,2,3,4), new Vector2D(5,6));

    List<Transform2D> transformations = new ArrayList<>();

    transformations.add(affineTransformation);
    transformations.add(affineTransformation);


    SettingFiller settingFiller = new SettingFiller(new ChaosGameDescription(minVector, maxVector, transformations), 1000L);

    double[][] expectedValues = {
        {0, 0},
        {1, 1},
        {1, 2, 3, 4, 5, 6},
        {1, 2, 3, 4, 5, 6}
    };

    double[][] actualValues = settingFiller.getDescriptionAsArray();
    assertArrayEquals(expectedValues, actualValues);
  }
}
