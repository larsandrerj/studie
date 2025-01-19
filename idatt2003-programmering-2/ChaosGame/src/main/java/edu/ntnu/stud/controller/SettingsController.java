package edu.ntnu.stud.controller;

import edu.ntnu.stud.controller.observer.SettingsObserver;
import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.model.linalg.Complex;
import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import edu.ntnu.stud.model.transform.Transform2D;
import edu.ntnu.stud.view.FileExplorer;
import javafx.stage.Stage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * <h1>SettingsController</h1>
 * <p>
 * Class responsible for handling the transactions related to the settings visible in the
 * user interface between the view and the model.
 * </p>
 */
public class SettingsController {
  /**
   * <h3> Logger for class </h3>
   */
  private static final Logger logger = LoggerFactory.getLogger(SettingsController.class);

  /**
   * <h2>Controller</h2>
   * <p>
   * The main controller of the system.
   * </p>
   */
  private final Controller controller;

  /**
   * <h2>Constructor</h2>
   *
   * @param controller <p>The main controller of the system.</p>
   */
  public SettingsController(Controller controller) {
    this.controller = controller;
    settingsObserver = new SettingsObserver(this);
  }

  /**
   * <h2>SettingsObserver</h2>
   * <p>
   * The observer which observes the settings in the user interface.
   * </p>
   */
  final SettingsObserver settingsObserver;

  /**
   * <h2>getGameDescriptionFromSettings</h2>
   * <p>
   * Method for getting a ChaosGameDescription from the settings in the user interface.
   * </p>
   *
   * @return <p>ChaosGameDescription</p>
   */
  private ChaosGameDescription getGameDescriptionFromSettings() {

    String transformationType = getTypeOfTransformation();
    double[][] values = getVectorValues();

    if (transformationType.equals("Julia")) {

      Vector2D minVector = doubleArrayToVector(values[0]);
      Vector2D maxVector = doubleArrayToVector(values[1]);

      Vector2D placeholderVector = doubleArrayToVector(values[2]);
      JuliaTransform2D transformation =
          new JuliaTransform2D(new Complex(placeholderVector.getX0(), placeholderVector.getX1()));
      ArrayList<Transform2D> transformationsList = new ArrayList<>();
      transformationsList.add(transformation);

      return new ChaosGameDescription(minVector, maxVector, transformationsList);
    }

    if (transformationType.equals("Affine")) {

      Vector2D minVector = doubleArrayToVector(values[0]);
      Vector2D maxVector = doubleArrayToVector(values[1]);

      double[][] transformationsArray = new double[values.length - 2][];
      ArrayList<Transform2D> transformationsList = new ArrayList<>();
      System.arraycopy(values, 2, transformationsArray, 0, transformationsArray.length);

      System.out.println(Arrays.deepToString(transformationsArray));

      Arrays.stream(transformationsArray).forEach(i -> {
        AffineTransform2D affineTransformation = doubleArrayToTransformation(i);
        transformationsList.add(affineTransformation);
      });

      return new ChaosGameDescription(minVector, maxVector, transformationsList);

    }
    String error = "Could not create gameDescription from settings";
    logger.error(error);
    throw new RuntimeException(error);

  }

  /**
   * <h2> runGameFromSettings </h2>
   * <p>
   * This method is used to run the game from the settings in the view
   * </p>
   */
  public void runGameFromSettings() {
    controller.setDescription(
        getGameDescriptionFromSettings()
    );

    int width;
    int height = 750;

    if (settingsObserver.getTypeOfTransformation().equals("Julia")) {
      width = 1000;
    } else {
      width = 750;
    }


    controller.setGame(width, height);

    controller.runGame((int) settingsObserver.getIterations());

    controller.displayChaosGameOnPixelCanvas(settingsObserver.getAnimationSelected());
  }

  /**
   * <h2>saveGameFromSettings</h2>
   * <p>
   * Method for saving a game from the settings as a file.
   * </p>
   */
  public void saveGameFromSettings() {
    String stringPath = new FileExplorer().getSavePath(new Stage());
    ChaosGameFileHandler fileHandler = new ChaosGameFileHandler();
    fileHandler.createFile(stringPath, getVectorValues(), getTypeOfTransformation());
  }

  /**
   * <h2>getTypeOfTransformation</h2>
   * <p>
   * Method for getting the type of transformation from the settingsobserver.
   * </p>
   *
   * @return <p>String with type of transformation</p>
   */
  public String getTypeOfTransformation() {
    return settingsObserver.getTypeOfTransformation();
  }

  /**
   * <h2>getIterationsFromSettings</h2>
   * <p>
   * Method for getting the number of iterations from the settingsobserver.
   * </p>
   *
   * @return <p>long with number of iterations</p>
   */
  public long getIterationsFromSettings() {
    return settingsObserver.getIterations();
  }

  /**
   * <h2>getVectorValues</h2>
   * <p>
   * Method for getting the vector values from the settingsobserver.
   * </p>
   *
   * @return <p>double[][] with vector values</p>
   */
  public double[][] getVectorValues() {
    return settingsObserver.getVectorValues();
  }

  /**
   * <h2>doubleArrayToVector</h2>
   * <p>
   * Method which converts a double array to an Vector2D instance.
   * </p>
   *
   * @param array <p>double array to be converted.</p>
   * @return <p>Vector2D instance.</p>
   */
  public Vector2D doubleArrayToVector(double[] array) {
    if (array.length != 2) {
      throw new IllegalArgumentException();
    }
    return new Vector2D(array[0], array[1]);
  }

  /**
   * <h2>doubleArrayToTransformation</h2>
   * <p>
   * Method which converts a double array to an AffineTransform2D instance.
   * </p>
   *
   * @param array <p>double array to be converted.</p>
   * @return <p>AffineTransform2D instance.</p>
   */
  public AffineTransform2D doubleArrayToTransformation(double[] array) {
    if (array.length != 6) {
      throw new IllegalArgumentException();
    }
    Matrix2x2 matrix = new Matrix2x2(array[0], array[1], array[2], array[3]);
    Vector2D vector = new Vector2D(array[4], array[5]);
    return new AffineTransform2D(matrix, vector);
  }

  /**
   * <h2>getController</h2>
   * <p>
   * Returns the controller.
   * </p>
   *
   * @return <p>Controller instance.</p>
   */
  public Controller getController() {
    return controller;
  }

  /**
   * <h2>getSettingsObserver</h2>
   * <p>
   * Returns the settingsObserver.
   * </p>
   *
   * @return <p>SettingsObserver instance.</p>
   */
  public SettingsObserver getSettingsObserver() {
    return settingsObserver;
  }
}
