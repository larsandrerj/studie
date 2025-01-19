package edu.ntnu.stud.controller;

import edu.ntnu.stud.controller.observer.SettingsObserver;
import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import edu.ntnu.stud.model.transform.Transform2D;
import edu.ntnu.stud.view.settingboxes.AffineSettingBox;
import edu.ntnu.stud.view.settingboxes.JuliaSettingBox;
import javafx.scene.layout.VBox;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

/**
 * <h1> Setting Filler </h1>
 * <p> This class creates the necessary values from a game description to fill settings. </p>
 */
public class SettingFiller {
  public SettingFiller(ChaosGameDescription chaosGameDescription, long iterations) {
    this.chaosGameDescription = chaosGameDescription;
    this.iterations = iterations;
  }
  /**
   * <h3> Logger for class </h3>
   */
  private static final Logger logger = LoggerFactory.getLogger(SettingFiller.class);

  private final ChaosGameDescription chaosGameDescription;
  private final long iterations;

  /**
   * <h2> getDescriptionAsArray </h2>
   * <p> returns the Vectors, matrices and complex number as an array to use in settings box  </p>
   *
   * @return <p> double[][]  game description values as an array </p>
   */
  public double[][] getDescriptionAsArray() {
    double[][] minMaxVectors = new double[][]{chaosGameDescription.minCords().getVectorAsArray(),
        chaosGameDescription.maxCords().getVectorAsArray()};
    List<Transform2D> transformations = chaosGameDescription.transforms();
    double[][] transformationsArray = new double[transformations.size()][];

    for (int i = 0; i < transformations.size(); i++) {
      Transform2D transform = transformations.get(i);
      if (transform instanceof JuliaTransform2D) {
        transformationsArray[i] = ((JuliaTransform2D) transform).getComplexPointAsArray();
      } else if (transform instanceof AffineTransform2D) {
        transformationsArray[i] = ((AffineTransform2D) transform).getVectorValues();
      }
    }
    return Stream.concat(Arrays.stream(minMaxVectors), Arrays.stream(transformationsArray))
        .toArray(double[][]::new);
  }

  /**
   * <h2> getSettingsBox </h2>
   * <p> This returns a setting box to be used in view depending on the game description provided in the constructor. </p>
   *
   * @return <p> Vbox containing gameSettings </p>
   */
  public VBox getSettingsBox(SettingsObserver observer) {
    if (chaosGameDescription.transforms().getFirst() instanceof AffineTransform2D) {
      AffineSettingBox affineSettingBox = new AffineSettingBox();
      affineSettingBox.addObserver(observer);
      return affineSettingBox.createAffineSettingBox(getDescriptionAsArray(), iterations);
    }
    if (chaosGameDescription.transforms().getFirst() instanceof JuliaTransform2D) {
      JuliaSettingBox juliaSettingBox = new JuliaSettingBox();
      juliaSettingBox.addObserver(observer);
      return juliaSettingBox.createJuliaSettingBox(getDescriptionAsArray(), iterations);
    }
    String error = "Unable to create Setting box from game description";
    logger.error(error);
    throw new RuntimeException(error);
  }
}
