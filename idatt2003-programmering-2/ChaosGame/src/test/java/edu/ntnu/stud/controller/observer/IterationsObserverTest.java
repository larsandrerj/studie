package edu.ntnu.stud.controller.observer;

import edu.ntnu.stud.model.engine.ChaosGame;
import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.model.linalg.Complex;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import edu.ntnu.stud.model.transform.Transform2D;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class IterationsObserverTest {

  private IterationsObserver iterationsObserver;
  private ChaosGame chaosGame;

  @BeforeEach
  void setUp() {
    iterationsObserver = new IterationsObserver();
    Vector2D minVector = new Vector2D(0,0);
    Vector2D maxVector = new Vector2D(1,1);

    JuliaTransform2D juliaTransformation = new JuliaTransform2D(new Complex(1,1));
    List<Transform2D> transformations = new ArrayList<>();
    transformations.add(juliaTransformation);

    ChaosGameDescription description = new ChaosGameDescription(minVector, maxVector, transformations);
    chaosGame = new ChaosGame(description, 100, 100);
    chaosGame.addObserver(iterationsObserver);
  }

  @Test
  @DisplayName("Test if the indices are empty upon initialization ")
  void testInitialization() {
    List<int[]> indices = iterationsObserver.getIterations();
    assertTrue(indices.isEmpty());
  }

  @Test
  @DisplayName("Test if the observer registers an update")
  void testUpdate() {
    chaosGame.runSteps(1);

    List<int[]> indices = iterationsObserver.getIterations();
    assertEquals(1, indices.size());
    assertArrayEquals(new int[]{0, 0}, indices.getFirst());
  }

  @Test
  @DisplayName("Test if the clearIterations method clears all iterations")
  void testClearIterations() {
    chaosGame.runSteps(1);
    iterationsObserver.clearIterations();

    List<int[]> indices = iterationsObserver.getIterations();
    assertTrue(indices.isEmpty());
  }
  @Test
  @DisplayName("Test if the update indices ignores invalid indices")
  void testUpdateIgnoresInvalidIndices() {
    chaosGame.getCanvas().putPixel(new Vector2D(-1, 2));
    chaosGame.runSteps(1);

    List<int[]> indices = iterationsObserver.getIterations();
    assertFalse(indices.isEmpty());
  }
}
