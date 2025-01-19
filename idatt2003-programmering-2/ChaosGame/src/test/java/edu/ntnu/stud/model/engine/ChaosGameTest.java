package edu.ntnu.stud.model.engine;

import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import edu.ntnu.stud.model.transform.Transform2D;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;


class ChaosGameTest {

  private ChaosGame chaosGame;

  @BeforeEach
  void setUp() {
    Vector2D minVector = new Vector2D(0, 0);
    Vector2D maxVector = new Vector2D(1, 1);

    Matrix2x2 matrix = new Matrix2x2(1, 1, 1, 1);
    Vector2D vectorForTransformation = new Vector2D(1, 1);
    AffineTransform2D affineTransformation = new AffineTransform2D(matrix, vectorForTransformation);
    List<Transform2D> transformations = new ArrayList<>();
    transformations.add(affineTransformation);

    ChaosGameDescription chaosGameDescription = new ChaosGameDescription(minVector, maxVector, transformations);

    int height = 100;
    int width = 100;
    chaosGame = new ChaosGame(chaosGameDescription, width, height);
  }

  @Test
  @DisplayName("Test getCanvas")
  void testGetCanvas() {
    ChaosCanvas returnedCanvas = chaosGame.getCanvas();
    int returnedWidth = returnedCanvas.getWidth();
    int returnedHeight = returnedCanvas.getHeight();

    assertEquals(100, returnedWidth);
    assertEquals(100, returnedHeight);
  }

  @Test
  @DisplayName("Test if runSteps works as intended")
  void runStepsTest() {
    chaosGame.runSteps(100);

    ChaosCanvas returnedCanvas = chaosGame.getCanvas();
    int[][] canvasArray = returnedCanvas.getCanvasArray();
    int sumOfArray = 0;
    for (int[] row : canvasArray) {
      for (int value : row) {
        sumOfArray += value;
      }
    }
    int expectedTotalSumForAEmptyCanvas = 0;

    assertNotEquals(expectedTotalSumForAEmptyCanvas, sumOfArray);
  }
  @Test
  @DisplayName("Test if getLastIndice works as intened")
  void getLastIndiceTest(){
    int[] expectedLastIndice= new int[]{0,0};

    chaosGame.runSteps(10);

    int[] returnedIndice = chaosGame.getLastIndice();

    assertEquals(expectedLastIndice[0], returnedIndice[0]);
    assertEquals(expectedLastIndice[1], returnedIndice[1]);
  }

}