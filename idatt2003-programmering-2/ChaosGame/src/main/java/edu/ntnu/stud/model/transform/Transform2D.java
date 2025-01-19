package edu.ntnu.stud.model.transform;

import edu.ntnu.stud.model.linalg.Vector2D;

/**
 * <h1> Interface for Transformation in a 2D space </h1>
 */

public interface Transform2D {
  Vector2D transform(Vector2D point);
}
