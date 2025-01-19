package edu.ntnu.stud.controller;

import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import edu.ntnu.stud.model.transform.Transform2D;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class GameDescriptionFactoryTest {

  @Test
  @DisplayName("Test if switch returns correct ChaosGameDescription")
  public void getGameDescriptionTest() {
    ChaosGameDescription barnsley = GameDescriptionFactory.getGameDescription("barnsley");
    // check if the transformations are Affine
    for (Transform2D transform : barnsley.transforms()) {
      assertInstanceOf(AffineTransform2D.class, transform);
    }
    ChaosGameDescription sierpinski = GameDescriptionFactory.getGameDescription("SIERPINSKI");
    // check if the transformations are Affine
    for (Transform2D transform : sierpinski.transforms()) {
      assertInstanceOf(AffineTransform2D.class, transform);
    }
    // check if the transformations are Julia
    ChaosGameDescription julia = GameDescriptionFactory.getGameDescription("julia");
    for (Transform2D transform : julia.transforms()) {
      assertInstanceOf(JuliaTransform2D.class, transform);
    }
    // check if the transformation are Affine
    ChaosGameDescription blankAffine = GameDescriptionFactory.getGameDescription("BlankAffine");
    for (Transform2D transforms : blankAffine.transforms()) {
      assertInstanceOf(AffineTransform2D.class, transforms);
    }
    // check if the transformation are Affine
    ChaosGameDescription dragon = GameDescriptionFactory.getGameDescription("dragon");
    for (Transform2D transforms : dragon.transforms()) {
      assertInstanceOf(AffineTransform2D.class, transforms);
    }
  }

  @Test
  @DisplayName("Test if getGameDescription throws IllegalArgumentException when type is wrong")
  public void getGameDescriptionException(){
    String notATransformation = "Eisenhower";

    assertThrows(
        IllegalArgumentException.class,
        () -> {
          ChaosGameDescription chaosGameDescription = GameDescriptionFactory.getGameDescription(notATransformation);
        });
  }
}