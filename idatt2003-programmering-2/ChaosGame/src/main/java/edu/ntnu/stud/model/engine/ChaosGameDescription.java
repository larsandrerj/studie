package edu.ntnu.stud.model.engine;

import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.Transform2D;

import java.util.List;

/**
 * <h1>ChaosGameDescription</h1>
 * <p>
 * a record which contains the details of a chaos game. Contains the plane the points will be put
 * on, and the transformations used to calculate the points.
 * </p>
 *
 * @param minCords   <h2>Min cords</h2>
 *                   <p>
 *                   The coordinates of the lower left corner of the plane.
 *                   </p>
 * @param maxCords   <h2>Max cords</h2>
 *                   <p>
 *                   The coordinates of the upper right corner of the plane.
 *                   </p>
 * @param transforms <h2>Transforms</h2>
 *                   <p>
 *                   A list of all the transformations used to calculate the points.
 *                   </p>
 */
public record ChaosGameDescription(Vector2D minCords, Vector2D maxCords, List<Transform2D> transforms) {
  /**
   * <h2>Constructor</h2>
   *
   * @param minCords   <p>Vector2D minCords value</p>
   * @param maxCords   <p>Vector2D maxCords value</p>
   * @param transforms <p>List of Transform2D objects</p>
   */
  public ChaosGameDescription {
  }

  /**
   * <h2>getTransforms</h2>
   * <p>
   * Returns the list of transformations.
   * </p>
   *
   * @return <p>List of Transform2D objects</p>
   */
  @Override
  public List<Transform2D> transforms() {
    return transforms;
  }

  /**
   * <h2>getMaxCords</h2>
   * <p>
   * Returns the max cords of the plane.
   * </p>
   *
   * @return <p>Vector2D maxCords value</p>
   */
  @Override
  public Vector2D maxCords() {
    return maxCords;
  }

  /**
   * <h2>getMinCords</h2>
   * <p>
   * Returns the min cords of the plane.
   * </p>
   *
   * @return <p>Vector2D minCords value</p>
   */
  @Override
  public Vector2D minCords() {
    return minCords;
  }
}
