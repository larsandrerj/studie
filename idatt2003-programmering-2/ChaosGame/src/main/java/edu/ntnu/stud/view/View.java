package edu.ntnu.stud.view;

import edu.ntnu.stud.controller.observer.NavButtonObserver;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.layout.*;
import javafx.scene.text.Text;

/**
 * <h1>View</h1>
 * <p>
 *    Class responsible for creating and storing the elements of the user interface.
 * </p>
 */
public class View {

  private final BorderPane mainPane = new BorderPane();

  /**
   * <h2>homePane</h2>
   * <p>
   *   The pane the user will first see when starting the application.
   *   Contains buttons for navigation, and a title.
   * </p>
   */
  private final BorderPane homePane = new BorderPane();

  /**
   * <h2>gamePane</h2>
   * <p>
   *   The pane where the user may play the chaos game in the user interface.
   *   Contains the pixelCanvas, dropdown and the settings.
   * </p>
   */
  private final BorderPane gamePane = new BorderPane();

  /**
   * <h2>infoPane</h2>
   * <p>
   *   The pane where the user may read information about the chaos game.
   * </p>
   */
  private final BorderPane infoPane = new BorderPane();

  /**
   * <h2>navButtonObserver</h2>
   * <p>
   *   Observer for the navigation buttons in the user interface.
   * </p>
   */
  private final NavButtonObserver navButtonObserver = new NavButtonObserver(this);

  /**
   * <h2>pixelCanvas</h2>
   * <p>
   *   Handler for drawing on an image and displaying it in the user interface.
   * </p>
   */
  private final PixelCanvas pixelCanvas = new PixelCanvas();

  /**
   * <h2>dropdown</h2>
   * <p>
   *   Handler for the dropdown menu in the user interface.
   * </p>
   */
  private final Dropdown dropdown = new Dropdown();

  /**
   * <h2>settingsPlaceholder</h2>
   * <p>
   *   Placeholder for the settings in the user interface.
   * </p>
   */
  private final VBox settingsPlaceholder = new VBox();

  /**
   * <h2>Constructor</h2>
   * <p>
   *   Initializes view-elements and sets up the user interface.
   * </p>
   */
  public View() {
    initHomePane();
    initGamePane();
    initInfoPane();
    setMainPaneContent(homePane);
  }

  /**
   * <h2>initHomePane</h2>
   * <p>
   *   Initializes the homePane with a title and buttons for navigation.
   * </p>
   */
  private void initHomePane() {
    VBox centerVbox = new VBox();
    Text title = new Text("IDATT2003 Programmering 2 - Gruppe 29: Chaos Game");
    title.setStyle("-fx-font-size: 40");
    centerVbox.setAlignment(Pos.CENTER);
    centerVbox.setSpacing(20);

    Button terminateButton = new Button("EXIT");
    terminateButton.setOnAction(
        e -> {
          Platform.exit();
        }
    );

    HBox buttonsHbox = new HBox(
        getNavButton(gamePane, "GAME").getButton(),
        getNavButton(infoPane, "INFO").getButton(),
        terminateButton
    );
    buttonsHbox.setSpacing(20);
    buttonsHbox.setAlignment(Pos.CENTER);
    buttonsHbox.setStyle("-fx-font-size: 30");

    centerVbox.getChildren().addAll(
        title,
        buttonsHbox
    );

    homePane.setCenter(
        centerVbox
    );
  }

  /**
   * <h2>initGamePane</h2>
   * <p>
   *   Initializes the gamePane with the pixelCanvas, dropdown and empty settings.
   * </p>
   */
  private void initGamePane() {
    StackPane centerPane = new StackPane();
    centerPane.setStyle("-fx-background-color: black;");
    Node pixelCanvasNode = pixelCanvas.getPixelCanvasGroup();

    centerPane.getChildren().add(pixelCanvasNode);
    StackPane.setAlignment(pixelCanvasNode, Pos.CENTER);

    gamePane.setCenter(centerPane);
    VBox leftPane = new VBox();
    gamePane.setLeft(leftPane);

    NavButton homeNavButton = new NavButton(homePane, "HOME");
    homeNavButton.addObserver(navButtonObserver);
    NavButton infoNavButton = new NavButton(infoPane, "HOME");
    infoNavButton.addObserver(navButtonObserver);



    HBox homeInfoButtonsHbox = new HBox(
        getNavButton(homePane, "HOME").getButton(),
        getNavButton(infoPane, "INFO").getButton()
    );

    homeInfoButtonsHbox.setPadding(new Insets(10));
    homeInfoButtonsHbox.setSpacing(20);
    homeInfoButtonsHbox.setStyle(
        "-fx-font-size: 20"
    );

    VBox spacer = new VBox();
    spacer.setPrefHeight(30);
    leftPane.setPrefWidth(420);
    leftPane.setPadding(new Insets(10));
    //leftPane.setAlignment(Pos.CENTER);

    leftPane.getChildren().addAll(
        homeInfoButtonsHbox,
        dropdown.getDropdown(),
        spacer,
        settingsPlaceholder
    );

  }

  /**
   * <h2>initInfoPane</h2>
   * <p>
   *   Initializes the infoPane with information about the chaos game
   *   and buttons for navigation.
   * </p>
   */
  private void initInfoPane() {
    HBox buttonsHbox = new HBox(
        getNavButton(homePane, "HOME").getButton(),
        getNavButton(gamePane, "GAME").getButton()
    );

    buttonsHbox.setAlignment(Pos.CENTER);
    buttonsHbox.setSpacing(20);
    buttonsHbox.setStyle(
        "-fx-font-size: 30"
    );
    buttonsHbox.setPadding(new Insets(40));

    Text titleText = new Text("Chaos Game Information");

    titleText.setStyle(
        "-fx-font-size: 30"
    );


    Text informationText = new Text(
        """
            What is Chaos Game?
            
            The Chaos Game is a game which creates fractals.
            The game starts with a list of transformation and a point (0,0)
            A new point is calculated by transforming the old point using
            a random transformation from the list. This is repeated for a set
            amount of iterations. A fractal will result from
            the running of the chaos game
            
            How do you play the Chaos Game?
            
            You prepare the chaos game by choosing an option from the dropdown menu.
            You may choose between pre-configured fractals or your own file.
            You may edit the parameters of each configuration to achieve your
            desired fractal.
            
            Pressing the run button will run the chaos game and display it with a heatmap.
            The heatmap is calculated by the amount of points which land on the same pixel,
            starting from red and turning white.
            
            The amount of iterations will determine how many times the point calculated
            will be transformed. Higher iterations may cause the application to drop
            in performance.
            
            Toggling the animation button will turn the drawing of the chaos game animated.
            One pixel is drawn every 0.1ms.
            """
    );

    informationText.setStyle(
        "-fx-font-size: 20"
    );

    VBox vBox = new VBox(
        buttonsHbox,
        titleText,
        informationText
    );

    vBox.setAlignment(Pos.CENTER);


    infoPane.setCenter(vBox);
  }

  /**
   * <h2>getNavButton</h2>
   * <p>
   *   Creates a NavButton instance with a given pane and text.
   * </p>
   *
   * @param pane <p>Pane instance</p>
   * @param s <p>Text for the button</p>
   * @return <p>NavButton instance</p>
   */
  private NavButton getNavButton(Pane pane, String s) {
    NavButton navButton = new NavButton(pane, s);
    navButton.addObserver(navButtonObserver);
    return navButton;
  }

  /**
   * <h2>setMainPaneContent</h2>
   * <p>
   *   Sets the center of the mainPane to a given Pane instance.
   * </p>
   *
   * @param pane <p>Pane instance</p>
   */
  public void setMainPaneContent(Pane pane) {
    mainPane.setCenter(pane);
  }

  /**
   * <h2>addSettings</h2>
   * <p>
   *   Adds a Pane instance within the settingsPlaceholder. Used by the settingsController to add
   *   a Pane from an BaseSettingsBox instance.
   * </p>
   *
   * @param pane <p>Pane instance</p>
   */
  public void addSettings(Pane pane) {
    settingsPlaceholder.getChildren().setAll(
        pane
    );
  }

  /**
   * <h2>getCurrentPane</h2>
   * <p>
   *   Returns the current pane of the user interface.
   * </p>
   *
   * @return <p>BorderPane instance</p>
   */
  public Pane getMainPane() {
    return mainPane;
  }

  /**
   * <h2>getPixelCanvas</h2>
   * <p>
   *   Returns the pixelCanvas instance of the user interface.
   * </p>
   *
   * @return <p>PixelCanvas instance</p>
   */
  public PixelCanvas getPixelCanvas() {
    return pixelCanvas;
  }

  /**
   * <h2>getDropdown</h2>
   * <p>
   *   Returns the dropdown instance of the user interface.
   * </p>
   *
   * @return <p>Dropdown instance</p>
   */
  public Dropdown getDropdown() {
    return dropdown;
  }
}
