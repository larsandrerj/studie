package edu.ntnu.stud;

import edu.ntnu.stud.controller.Controller;
import edu.ntnu.stud.view.View;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 * <h1>Chaos Game App</h1>
 * <p>
 * This application lets a user play the Chaos Game, a game that creates fractals out of number
 * inputs. The user may choose the dimension of the plane the fractal will be drawn on, what
 * type of fractal they want to draw, the number of iterations, and the vectors and matrices to
 * draw calculate each point in the fractal.
 * </p>
 * <p>
 * The user may also choose to save the settings of the fractal they have created, or load from
 * an pre-existing file.
 * </p>
 */
public class ChaosGameApp extends Application {

  /**
   * <h2>main</h2>
   * <p>
   * The main method of the application. This method launches the application.
   * </p>
   *
   * @param args
   */
  public static void main(String[] args) {
    launch();
  }

  /**
   * <h2>start</h2>
   * <p>
   * Starts the application. Sets up a View and Controller instance. Creates a scene which is
   * displayed in a stage to the user.
   * </p>
   *
   * @param stage <p>Stage which contains the scene which is shown to the user</p>
   */
  @Override
  public void start(Stage stage) {
    View view = new View();
    Controller controller = new Controller();

    Scene scene = new Scene(view.getMainPane(), 1920, 1080);
    stage.setTitle("IDATT2003 Programmering 2 - Gruppe 29: Chaos Game");
    stage.setScene(scene);
    stage.setMaximized(true);
    stage.show();

    controller.setView(view);

  }
}
