package edu.ntnu.stud.controller;

import edu.ntnu.stud.controller.observer.DropdownObserver;
import edu.ntnu.stud.controller.observer.IterationsObserver;
import edu.ntnu.stud.model.engine.ChaosCanvas;
import edu.ntnu.stud.model.engine.ChaosGame;
import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.view.Dropdown;
import edu.ntnu.stud.view.PixelCanvas;
import edu.ntnu.stud.view.View;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.util.Duration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <h1>Controller</h1>
 * <p>
 * Class which is the main handler of transactions between the model- and the view-layer.
 * This class is responsible for handling the user inputs from the view-layer, and responding
 * with an appropriate action.
 * </p>
 * <p>
 * This class creates and keeps a ChaosGame instance, and calls to the view to display it.
 * </p>
 */
public class Controller {
  /**
   * <h3> Logger for class </h3>
   */
  private static final Logger logger = LoggerFactory.getLogger(Controller.class);
  /**
   * <h2>view</h2>
   * <p>
   * View element that is responsible for displaying the user interface.
   * </p>
   */
  private View view;

  /**
   * <h2>pixelCanvas</h2>
   * <p>
   * PixelCanvas element that is responsible for drawing on a canvas in the view.
   * </p>
   */
  private PixelCanvas pixelCanvas;

  /**
   * <h2>dropDown</h2>
   * <p>
   * Dropdown / Combobox element that is responsible for displaying the factory options in
   * the view.
   * </p>
   */
  private Dropdown dropdown;

  /**
   * <h2>game</h2>
   * <p>
   * ChaosGame instance which will be run.
   * </p>
   */
  private ChaosGame game;

  /**
   * <h2>chaosCanvas</h2>
   * <p>
   * ChaosCanvas instance which harbors the points calculated when the ChaosGame is run.
   * </p>
   */
  private ChaosCanvas chaosCanvas;

  /**
   * <h2>description</h2>
   * <p>
   * ChaosGameDescription instance which is used to create the ChaosGame instance.
   * </p>
   */
  private ChaosGameDescription description;

  /**
   * <h2>file handler</h2>
   * <p>
   * ChaosGameFileHandler responsible for creating ChaosGameDescription instances from a
   * filepath string.
   * </p>
   */
  private final ChaosGameFileHandler fh = new ChaosGameFileHandler();

  /**
   * <h2>iterationsObserver</h2>
   * <p>
   * Observer which is notified of each indice placed throughout the running of a chaos game.
   * Stores an array of all the indices placed throughout the game in chronological order.
   * </p>
   */
  private final IterationsObserver iterationsObserver = new IterationsObserver();

  /**
   * <h2>settingController</h2>
   * <p>
   * SettingsController which is responsible for handling the settings visible in the view.
   * </p>
   */
  private final SettingsController settingsController = new SettingsController(this);

  /**
   * <h2>dropdownObserver</h2>
   * <p>
   * Observer which is notified of changes in the dropdown visible in the view layer.
   * </p>
   */
  private final DropdownObserver dropdownObserver = new DropdownObserver(this);

  /**
   * <h2>drawingTimeLine</h2>
   * <p>
   *   Timeline which is used to run drawChaosGameAnimated on a separate thread.
   * </p>
   */
  private Timeline drawingTimeline;

  /**
   * <h2>setView</h2>
   * <p>
   * Method which instantiates the view, fetches the belonging pixelCanvas, and adds an
   * observer to the dropdown.
   * </p>
   *
   * @param view The main frame for the user interface.
   */
  public void setView(View view) {
    this.view = view;
    pixelCanvas = view.getPixelCanvas();

    dropdown = view.getDropdown();
    dropdown.addObserver(dropdownObserver);

    setDropdownOptions();

  }

  /**
   * <h2>setDropDownOptions</h2>
   * <p>
   * Adds the options available to the user in the dropdown.
   * </p>
   */
  private void setDropdownOptions() {
    dropdown.addOption(true, "SIERPINSKI", "Sierpinski triangle");
    dropdown.addOption(true, "BARNSLEY", "Barnsley fern");
    dropdown.addOption(true, "DRAGON", "Lévy Dragon");
    dropdown.addOption(true, "JULIA", "Julia set");
    dropdown.addOption(true, "BLANKAFFINE", "Blank Affine");
    dropdown.addOption(false, "", "-- Choose own file --");

  }

  /**
   * <h2>setDescription</h2>
   * <p>
   * Instantiates the ChaosGameDescription which the next ChaosGame instance will use.
   * </p>
   *
   * @param description Description for the next ChaosGame instance.
   */
  public void setDescription(ChaosGameDescription description) {
    this.description = description;
  }

  /**
   * <h2>setDescription</h2>
   * <p>
   * Instantiates a ChaosGameDescription from a file path, which the next ChaosGame
   * instance will use.
   * </p>
   *
   * @param path <p>File path to the description file.</p>
   */
  public void setDescription(String path) {
    try {
      description = fh.readFromFile(path);

    } catch (Exception e) {
      logger.error(e.getMessage());
      System.out.println(e.getMessage());
    }
  }

  /**
   * <h2>setGame</h2>
   * <p>
   * Instantiates a ChaosGame instance with the given width and height.
   * </p>
   *
   * @param width  <p>Width of the canvas.</p>
   * @param height <p>Height of the canvas.</p>
   */
  public void setGame(int width, int height) {
    try {
      //if (animationThread != null) {
      //  if (animationThread.isAlive()) animationThread.join();
      //}


      game = new ChaosGame(description, width, height);
      game.addObserver(iterationsObserver);

    } catch (Exception e) {
      logger.error(e.getMessage());
      System.out.println(e.getMessage());
    }
  }

  /**
   * <h2>runGame</h2>
   * <p>
   * Runs the ChaosGame instance for a given number of iterations.
   * The indices placed throughout the game are stored in the iterationsObserver.
   * </p>
   *
   * @param iterations <p>Number of iterations the game will run.</p>
   */
  public void runGame(int iterations) {
    try {
      //Clear the previous iterations
      iterationsObserver.clearIterations();

      //Runs the game
      game.runSteps(iterations);

    } catch (Exception e) {
      logger.error(e.getMessage());
      System.out.println(e.getMessage());
    }
  }

  /**
   * <h2>displayChaosGameOnPixelCanvas</h2>
   * <p>
   * Displays the ChaosGame on the pixelCanvas in the view.
   * </p>
   *
   * @param animation <p>If true, the game will be displayed with an animation.</p>
   */
  public void displayChaosGameOnPixelCanvas(boolean animation) {
    //Check if the pixelCanvas and game is set
    if (pixelCanvas == null || game == null) {
      logger.error("either pixel canvas or game is not set");
      throw new IllegalStateException();
    }

    if (drawingTimeline != null) {
      drawingTimeline.stop();
    }

    //Get the canvas from the game
    chaosCanvas = game.getCanvas();

    //Sets a new image on the pixelCanvas
    pixelCanvas.setNewImage(chaosCanvas.getWidth(), chaosCanvas.getHeight());
    pixelCanvas.fillImage(new int[]{0, 0, 0});

    //Draws the game without animation if animation is false

    if (!animation) {
      drawChaosGameStatic();
      return;
    }

    drawChaosGameAnimated();
  }

  /**
   * <h2>drawChaosGameStatic</h2>
   * <p>
   * Draws the ChaosGame on the pixelCanvas with a heatmap based on the value inside of the
   * ChaosCanvas-array.
   * </p>
   */
  private void drawChaosGameStatic() {
    int[][] chaosCanvasArray = chaosCanvas.getCanvasArray();

    for (int i = 0; i < chaosCanvasArray.length; i++) {
      for (int j = 0; j < chaosCanvasArray[i].length; j++) {
        int pointFrequency = chaosCanvasArray[i][j];

        if (pointFrequency != 0) {
          int r = 255;
          int gb = Math.min((int) Math.pow(2, pointFrequency), 255);
          pixelCanvas.setPixel(j, i, new int[]{r, gb, gb});
        }
      }
    }
  }

  /**
   * <h2>drawChaosGameAnimated</h2>
   * <p>
   * Draws the ChaosGame on the pixelCanvas.
   * Fetches the indices placed on the ChaosCanvas from the iterationsObserver, and draws
   * them using the pixelCanvas. Runs a Timeline instance which iterates through every indice in
   * indices. A KeyFrame instance which takes x amount of time to run. Each keyframe places an
   * indice on the pixelCanvas.
   * </p>
   */
  private void drawChaosGameAnimated() {
    //Array of indices from the iterationsObserver
    int[][] indices = iterationsObserver.getIterations().toArray(new int[0][]);

    double time = 0.1;

    //Generates a new timeline with a KeyFrame that takes a given amount of time to perform
    drawingTimeline = new Timeline(
        new KeyFrame(
            Duration.millis(time),
            new EventHandler<>() {
              int k = 0;

              @Override
              public void handle(ActionEvent actionEvent) {
                //Gets an indice
                int[] indice = indices[k];

                k++;

                int[] prevColor = pixelCanvas.getPixelRGB(indice[1], indice[0]);

                //Starts red, turns white
                int r = 255;
                int gb = 1;

                if (prevColor[1] != 0) {
                  gb = Math.min((prevColor[1]) * 2, 255);
                }

                //Places a pixel with the calculated color on the PixelCanvas
                pixelCanvas
                    .setPixel(indice[1], indice[0], new int[]{r, gb, gb});

              }
            }
        )
    );

    //Timeline cycles through the entire length of indices
    drawingTimeline.setCycleCount(indices.length);

    //Run timeline
    drawingTimeline.play();
  }

  /**
   * <h2>getSettingsController</h2>
   * <p>
   * Returns the settingsController.
   * </p>
   *
   * @return <p>SettingsController instance.</p>
   */
  public SettingsController getSettingsController() {
    return settingsController;
  }

  /**
   * <h2>getView</h2>
   * <p>
   * Returns the view.
   * </p>
   *
   * @return <p>View instance.</p>
   */
  public View getView() {
    return view;
  }

  /**
   * <h2>getChaosGameFileHandler</h2>
   * <p>
   * Returns the ChaosGameFileHandler.
   * </p>
   *
   * @return <p>ChaosGameFileHandler instance.</p>
   */
  public ChaosGameFileHandler getChaosGameFileHandler() {
    return fh;
  }
}
