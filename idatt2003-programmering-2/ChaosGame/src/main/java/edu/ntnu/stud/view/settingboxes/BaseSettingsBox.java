package edu.ntnu.stud.view.settingboxes;

import edu.ntnu.stud.controller.observer.Observable;
import edu.ntnu.stud.view.settingboxes.components.VectorBox;
import javafx.beans.property.LongProperty;
import javafx.beans.property.SimpleLongProperty;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import javafx.util.converter.NumberStringConverter;


/**
 * <h1> BaseSettingBox </h1>
 * <p> This is inherited to both JuliaSettingsBox and AffineSettingsBox that offers them functionality that they both need. </p>
 */
public abstract class BaseSettingsBox extends Observable<BaseSettingsBox> {

  /**
   * <h2> Constructor for BaseSettingBox </h2>
   * <p> All the variables in this constructor are both necessary for affine and Julia transformations </p>
   *
   * @param minVector  <p> MinVector that set boundaries for the transformations  </p>
   * @param maxVector  <p> MaxVector that set boundaries for the transformations  </p>
   * @param iterations <p> Amount of Iterations the program should run </p>
   */
  protected void SettingBox(double[] minVector, double[] maxVector, long iterations) {
    this.minVector = minVector;
    this.maxVector = maxVector;
    this.iterations.set(iterations);
  }


  private double[] minVector;
  private double[] maxVector;
  private final LongProperty iterations = new SimpleLongProperty();

  protected VBox settingBox;
  private VectorBox minVectorBox;
  private VectorBox maxVectorBox;
  private final Text heading = new Text();
  protected boolean animationSelected = false;
  private boolean runGamePressed = false;
  private boolean saveToFilePressed = false;


  /**
   * <h2> Creates a base settings Box </h2>
   *
   * @return <p> VBox that will be further changed </p>
   */
  protected VBox createBaseSettingsBox() {
    if (settingBox == null) {
      settingBox = new VBox();
      settingBox.setAlignment(Pos.CENTER);
      settingBox.setPadding(new Insets(10));
      settingBox.setStyle("-fx-background-color: #F0F0F0;" +
                          " -fx-border-color: #C0C0C0;" +
                          " -fx-border-radius: 15;" +
                          " -fx-background-radius: 15;" +
                          " -fx-padding: 20;");

      HBox headingHbox = new HBox();
      heading.setStyle("-fx-font-family: Arial; -fx-font-size: 20; -fx-padding: 5;");
      headingHbox.setAlignment(Pos.CENTER);
      headingHbox.setPadding(new Insets(20, 0, 20, 0));
      headingHbox.getChildren().add(heading);
      settingBox.getChildren().add(heading);


      minVectorBox = new VectorBox("Min Vector", minVector[0], minVector[1]);

      maxVectorBox = new VectorBox("Max Vector", maxVector[0], maxVector[1]);

      VBox iterationsBox = new VBox();
      iterationsBox.setAlignment(Pos.CENTER);
      Text iterationsAmountText = new Text("Iterations Amount:");
      iterationsAmountText.setTextAlignment(TextAlignment.CENTER);
      TextField iterationsTextField = new TextField(String.valueOf(iterations.get()));
      iterationsTextField.setAlignment(Pos.CENTER);
      bindTextFieldToProperty(iterationsTextField, iterations);
      iterationsBox.setStyle("-fx-pref-width: 50; -fx-padding: 20");
      iterationsBox.getChildren().addAll(iterationsAmountText, iterationsTextField);


      HBox animationQuestionBox = new HBox();
      animationQuestionBox.setAlignment(Pos.CENTER);
      Text animationQuestionText = new Text("Include Animation?");
      RadioButton radioButtonQuestion = new RadioButton();
      radioButtonQuestion.setSelected(animationSelected);
      radioButtonQuestion.setOnAction(
          e -> animationSelected = radioButtonQuestion.selectedProperty().getValue()
      );

      animationQuestionBox.setId("animationQuestionBox");

      animationQuestionBox.getChildren().setAll(animationQuestionText, radioButtonQuestion);

      settingBox.getChildren().addAll(minVectorBox.getVectorBox(), maxVectorBox.getVectorBox(),
          iterationsBox, animationQuestionBox);
      settingBox.setStyle("-fx-background-color: #D3D3D3; -fx-border-radius: 15; -fx-background-radius: 15;");
    }
    return settingBox;
  }

  /**
   * <h2> createRunButton </h2>
   * <p> This creates a run button that invokes a observer class that listens to values in class </p>
   * @return <p> HBox with runButton </p>
   */
  protected HBox createRunButton() {
    Button runButton = new Button("Run");
    runButton.setPrefSize(150, 30);
    runButton.setStyle("-fx-background-color: #4CAF50;" +
                       " -fx-border-color: #388E3C;" +
                       " -fx-border-radius: 15;" +
                       " -fx-background-radius: 15;" +
                       " -fx-text-fill: #FFFFFF;" +
                       " -fx-font-family: Arial;" +
                       " -fx-font-size: 12;" +
                       " -fx-padding: 10;" +
                       " -fx-cursor: hand;");

    HBox runButtonHBox = new HBox(runButton);
    runButtonHBox.setAlignment(Pos.CENTER);
    runButton.setOnAction(event -> {
      runGamePressed = true;
      super.updateObservers(this);
      runGamePressed = false;
    });
    return runButtonHBox;
  }

  /**
   * <h2> getIterations </h2>
   * <p> Getter for iterations </p>
   * @return <p> long iterations </p>
   */
  public long getIterations() {
    return iterations.get();
  }

  /**
   * <h2> getMinAndMaVectors </h2>
   * <p> Getter for min and max vectors in Double[][] form </p>
   *
   * @return <p> min and max vectors in Double[][] form </p>
   */
  protected double[][] getMinAndMaxVectors() {
    return new double[][]{minVectorBox.getVectorValues(), maxVectorBox.getVectorValues()};
  }

  /**
   * <h2>getAnimationSelected  </h2>
   * @return <p> Boolean if Animation is selected </p>
   */
  public boolean getAnimationSelected() {
    return animationSelected;
  }

  /**
   * <h2> bindTextFieldToProperty </h2>
   * <p> This binds a text field to a LongProperty, this allows to easier assignment of values in the ui </p>
   *
   * @param textField    <p> Text field to bind </p>
   * @param longProperty <p> Long property to bind </p>
   */
  private void bindTextFieldToProperty(TextField textField, LongProperty longProperty) {
    NumberStringConverter converter = new NumberStringConverter("#");

    textField.textProperty().addListener((observable, oldValue, newValue) -> {
      if (!newValue.matches("\\d*")) {
        textField.setText(oldValue);
      }
    });

    textField.textProperty().bindBidirectional(longProperty, converter);
  }

  /**
   * <h2> createSaveButton </h2>
   * <p> This method creates a save button for the settingBox </p>
   */
  protected HBox createSaveButton() {
    Button saveButton = new Button("Save Transformation");
    saveButton.setPrefSize(150, 30);
    saveButton.setStyle("-fx-background-color: #3F51B5;" + // Changed background color
                        " -fx-border-color: #303F9F;" + // Changed border color
                        " -fx-border-radius: 15;" +
                        " -fx-background-radius: 15;" +
                        " -fx-text-fill: #FFFFFF;" +
                        " -fx-font-family: Arial;" +
                        " -fx-font-size: 12;" +
                        " -fx-padding: 10;" +
                        " -fx-cursor: hand;");


    HBox hBox = new HBox(saveButton);
    hBox.setAlignment(Pos.CENTER);

    saveButton.setOnAction(event -> {
      saveToFilePressed = true;
      updateObservers(this);
      saveToFilePressed = false;
    });
    return hBox;
  }

  /**
   * <h2> setHeading </h2>
   * <p> Setter for heading </p>
   *
   * @param headingText <p> text you would like to set </p>
   */
  protected void setHeading(String headingText) {
    heading.setText(headingText);
  }

  /**
   * <h2> getSaveToFilePressed </h2>
   * <p> getter that returns whether or not save file is pressed  </p>
   *
   * @return <p> boolean of saveToFilePressed </p>
   */
  public boolean getSaveToFilePressed() {
    return saveToFilePressed;
  }

  /**
   * <h2> getRunGamePressed </h2>
   * <p> getter that returns whether or not run game is pressed  </p>
   *
   * @return <p> boolean of runGamePressed </p>
   */
  public boolean getRunGamePressed() {
    return runGamePressed;
  }
}