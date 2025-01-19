package edu.ntnu.stud.controller.observer;

import edu.ntnu.stud.model.engine.ChaosGame;

import java.util.ArrayList;
import java.util.List;

/**
 * <h1>IterationsObserver</h1>
 * <p>
 * Observer for the ChaosGame class. When a new iteration is calculated, the observer is notified and
 * the indices of the new iteration is added to the list of indices.
 * </p>
 */
public class IterationsObserver implements Observer<ChaosGame> {
  /**
   * <h2>indicesAtIterations</h2>
   * <p>
   * List of indices in chronological order.
   * </p>
   */
  private final ArrayList<int[]> indicesAtIterations = new ArrayList<>();
  //May be optimized with primitive type instead of arraylist.

  /**
   * <h2>getIterations</h2>
   * <p>
   * Returns the list of indices.
   * </p>
   *
   * @return List of indices.
   */
  public List<int[]> getIterations() {
    return indicesAtIterations;
  }

  /**
   * <h2>clearIterations</h2>
   * <p>
   * Clears the list of indices.
   * </p>
   */
  public void clearIterations() {
    indicesAtIterations.clear();
  }

  /**
   * <h2>update</h2>
   * <p>
   * Adds the indices of the last iteration to the list of indices.
   * </p>
   *
   * @param chaosGame <p>The chaos game that has been updated.</p>
   */
  @Override
  public void update(ChaosGame chaosGame) {
    int[] indices = chaosGame.getLastIndice();
    if (indices[0] >= 0 && indices[1] >= 0) {
      indicesAtIterations.add(
          indices
      );
    }


  }
}
