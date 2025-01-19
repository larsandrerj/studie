package edu.ntnu.stud.controller;

import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.model.linalg.Complex;
import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import edu.ntnu.stud.model.transform.Transform2D;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * <h1> Factory Class for ChaosGameDescription</h1>
 */
public class GameDescriptionFactory {

  /**
   * <h3> Logger for class </h3>
   * */
  private static final Logger logger = LoggerFactory.getLogger(GameDescriptionFactory.class);
  /**
   * <h1>Transformation Name Enum</h1>
   * <p> Here lies all the transformation currently the factory constructs </p>
   */
  enum TransformationName {
    JULIA,
    BARNSLEY,
    SIERPINSKI,
    BLANKAFFINE,
    DRAGON
  }

  /**
   * <h1> getGameDescription Method</h1>
   * <p> This method creates a list of standardTransformation that will be created when type is inputted </p>
   *
   * @param type <p>Type of ChaosGameDescription to be created</p>
   * @return <p>ChaosGameDescription</p>
   */
  public static ChaosGameDescription getGameDescription(String type) {

    try {
      TransformationName transformationName = TransformationName.valueOf(type.toUpperCase());
      return switch (transformationName) {
        case JULIA -> createJulia();
        case BARNSLEY -> createBarnsley();
        case SIERPINSKI -> createSierpinski();
        case BLANKAFFINE -> createBlankAffine();
        case DRAGON -> createDragon();
      };
    } catch (IllegalArgumentException e) {
      logger.error(e.getMessage());
      throw new IllegalArgumentException("Invalid transformation type: " + type);
    }

  }

  /**
   * <h2> Creates a Standard Julia ChaosGameDescription </h2>
   *
   * @return <p>Julia ChaosGameDescription
   */
  private static ChaosGameDescription createJulia() {
    Vector2D min = new Vector2D(-1.6, -1);
    Vector2D max = new Vector2D(1.6, 1);
    Complex complex = new Complex(-0.75433, 0.11301);
    List<Transform2D> transformations = new ArrayList<>();
    transformations.add(new JuliaTransform2D(complex));
    return new ChaosGameDescription(min, max, transformations);
  }

  /**
   * <h2> Creates a Barnsley ChaosGameDescription </h2>
   *
   * @return <p>Barnsley ChaosGameDescription</p>
   */
  private static ChaosGameDescription createBarnsley() {
    Vector2D min = new Vector2D(-2.65, 0);
    Vector2D max = new Vector2D(2.65, 10);
    List<Transform2D> transformations = new ArrayList<>();
    AffineTransform2D affineTransformation1 = new AffineTransform2D(
        new Matrix2x2(0, 0, 0, 0.16),
        new Vector2D(0, 0));
    transformations.add(affineTransformation1);

    AffineTransform2D affineTransformation2 = new AffineTransform2D(
        new Matrix2x2(0.85, 0.04, -0.04, 0.85),
        new Vector2D(0, 1.6));
    transformations.add(affineTransformation2);

    AffineTransform2D affineTransformation3 = new AffineTransform2D(
        new Matrix2x2(0.2, -0.26, 0.23, 0.22),
        new Vector2D(0, 1.6));
    transformations.add(affineTransformation3);

    AffineTransform2D affineTransformation4 = new AffineTransform2D(
        new Matrix2x2(-0.15, 0.28, 0.26, 0.24),
        new Vector2D(0, 0.44));
    transformations.add(affineTransformation4);

    return new ChaosGameDescription(min, max, transformations);
  }

  /**
   * <h2> Creates a Sierpinski Triangle ChaosGameDescription </h2>
   *
   * @return <p>Sierpinski ChaosGameDescription</p>
   */
  private static ChaosGameDescription createSierpinski() {
    Vector2D min = new Vector2D(0, 0);
    Vector2D max = new Vector2D(1, 1);
    List<Transform2D> transformations = new ArrayList<>();

    AffineTransform2D affineTransformation1 = new AffineTransform2D(
        new Matrix2x2(0.5, 0, 0, 0.5),
        new Vector2D(0, 0));
    transformations.add(affineTransformation1);

    AffineTransform2D affineTransformation2 = new AffineTransform2D(
        new Matrix2x2(0.5, 0, 0, 0.5),
        new Vector2D(0.25, 0.5));
    transformations.add(affineTransformation2);


    AffineTransform2D affineTransformation3 = new AffineTransform2D(
        new Matrix2x2(0.5, 0, 0, 0.5),
        new Vector2D(0.5, 0));
    transformations.add(affineTransformation3);

    return new ChaosGameDescription(min, max, transformations);
  }

  /**
   * <h2> Creates a blank affine transformation </h2>
   * @return <p> Blank Affine ChaosGameDescription </p>
   */
  private static ChaosGameDescription createBlankAffine(){
    Vector2D min = new Vector2D(0,0);
    Vector2D max = new Vector2D(1,1);
    List<Transform2D> transformations = new ArrayList<>();
    Matrix2x2 matrix = new Matrix2x2(0,0,0,0);
    Vector2D vector = new Vector2D(0,0);
    transformations.add(new AffineTransform2D(matrix, vector));
    return new ChaosGameDescription(min,max, transformations);
  }

  /**
   * <h2> Creates a Levy Dragon ChaosGameDescription  </h2>
   * @return <p> Levy Dragon ChaosGameDescription </p>
   */
  private static ChaosGameDescription createDragon(){
    Vector2D min = new Vector2D(-0.65,-0.65);
    Vector2D max = new Vector2D(1.5,1.2);

    List<Transform2D> transformations = new ArrayList<>();
    AffineTransform2D affineTransformation1 = new AffineTransform2D(new Matrix2x2(0.5,-0.5,0.5,0.5),
        new Vector2D(0,0));
    transformations.add(affineTransformation1);

    AffineTransform2D affineTransformation2 = new AffineTransform2D(new Matrix2x2(0.5,0.5,-0.5,0.5),
        new Vector2D(0.5,0.5));
    transformations.add(affineTransformation2);

    return new ChaosGameDescription(min, max,transformations);


  }
}


