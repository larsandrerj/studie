package edu.ntnu.stud.model.engine;

import edu.ntnu.stud.controller.observer.Observable;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.Transform2D;

import java.util.List;
import java.util.Random;

/**
 * <h1>ChaosGame</h1>
 * <p>
 * Class responsible for running iterations of a chaos game. Runs a chaos game based on a
 * ChaosGameDescription.
 * </p>
 */
public class ChaosGame extends Observable<ChaosGame> {

  /**
   * <h2>Canvas</h2>
   * <p>
   * ChaosCanvas which will store the points calculated trough the transformations in the
   * description.
   * </p>
   */
  private final ChaosCanvas canvas;

  /**
   * <h2>Description</h2>
   * <p>
   * ChaosGameDescription which contains the details of the running of the chaos game, such
   * as the plane the points will be put, and the transformations used to calculate the
   * points.
   * </p>
   */
  private final ChaosGameDescription description;

  /**
   * <h2>Current point</h2>
   * <p>
   * The last point which has been calculated.
   * </p>
   */
  private Vector2D currentPoint;

  /**
   * <h2>Random</h2>
   * <p>
   * Random-object used to choose at random which transformation will be used to calculate
   * the current point.
   * </p>
   */
  private final Random random = new Random();

  /**
   * <h2>Last indice</h2>
   * <p>
   * The last indice placed on the ChaosCanvas' array. Used by an IterationsObserver to get
   * a run-through of all the points placed during the game.
   * </p>
   */
  private int[] lastIndice;

  /**
   * <h2>Constructor</h2>
   *
   * @param description <p>description used during the running of the chaos game.</p>
   * @param width       <p>width of the chaos canvas.</p>
   * @param height      <p>height of the chaos canvas.</p>
   */
  public ChaosGame(ChaosGameDescription description, int width, int height) {
    this.description = description;

    Vector2D minCoords = description.minCords();
    Vector2D maxCoords = description.maxCords();

    this.canvas = new ChaosCanvas(width, height, minCoords, maxCoords);

    currentPoint = new Vector2D(0, 0);
  }

  /**
   * <h2>getCanvas</h2>
   * <p>
   * Returns the ChaosCanvas instance used during the running of the chaos game.
   * </p>
   *
   * @return <p>ChaosCanvas used during the chaos game</p>
   */
  public ChaosCanvas getCanvas() {
    return canvas;
  }

  /**
   * <h2>runSteps</h2>
   * <p>
   * Method which runs the iterations of the chaos game.
   * Acquires a list of transformations from the description and chooses one at random during
   * each iteration. Calculates the point in the transformation and puts it on the canvas.
   * </p>
   *
   * @param steps <p>number of iterations the chaos game will run.</p>
   */
  public void runSteps(int steps) {
    for (int i = 0; i < steps; i++) {
      List<Transform2D> transforms = description.transforms();
      int randInt = random.nextInt(
          transforms.size()
      );

      currentPoint = transforms
          .get(randInt)
          .transform(currentPoint);

      lastIndice = canvas.putPixel(currentPoint);

      super.updateObservers(this);
    }
  }

  /**
   * <h2>getLastIndice</h2>
   * <p>
   * Returns the last indice placed on the canvas' array.
   * </p>
   *
   * @return <p>the last indice placed on the canvas.</p>
   */
  public int[] getLastIndice() {
    return lastIndice;
  }
}
