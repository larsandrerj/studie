package edu.ntnu.stud.view.settingboxes.components;

import edu.ntnu.stud.view.settingboxes.AffineSettingBox;
import javafx.beans.property.DoubleProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.util.converter.NumberStringConverter;

/**
 * <h1> MatrixAndVectorBox </h1>
 * <p> Component used to visualize an affine transformation with a vector and a matrix  </p>
 */
public class MatrixAndVectorVBox {

  private final String matrixDescription;
  private final DoubleProperty a00 = new SimpleDoubleProperty();
  private final DoubleProperty a01 = new SimpleDoubleProperty();
  private final DoubleProperty a10 = new SimpleDoubleProperty();
  private final DoubleProperty a11 = new SimpleDoubleProperty();
  private final String vectorDescription;
  private final DoubleProperty b0 = new SimpleDoubleProperty();
  private final DoubleProperty b1 = new SimpleDoubleProperty();
  private final AffineSettingBox affineSettingBox;

  /**
   * <h2> Constructor for MatrixAndVectorVBox </h2>
   *
   * @param matrixDescription <p> Description for matrix </p>
   * @param vectorDescription <p> Description for vector </p>
   * @param values            <p> Values for matrix and vector [a00, a01, a10, a11, b0, b1] </p>
   * @param affineSettingBox  <p> Reference to the AffineSettingBox </p>
   */
  public MatrixAndVectorVBox(String matrixDescription, String vectorDescription, double[] values, AffineSettingBox affineSettingBox) {
    this.matrixDescription = matrixDescription;
    this.a00.set(values[0]);
    this.a01.set(values[1]);
    this.a10.set(values[2]);
    this.a11.set(values[3]);
    this.vectorDescription = vectorDescription;
    this.b0.set(values[4]);
    this.b1.set(values[5]);
    this.affineSettingBox = affineSettingBox;
  }

  /**
   * <h2> getMatrixAndVectorBox </h2>
   * <p> Creates and returns finished MatrixAndVectorBox </p>
   *
   * @return <p> HBox to be used in affineSettingsBox </p>
   */
  public HBox getMatrixAndVectorBox(VBox parentContainer) {

    HBox container = new HBox();
    container.setAlignment(Pos.CENTER);

    Insets descriptionInset = new Insets(0, 5, 0, 2);

    HBox matrixDescriptionBox = new HBox(new Text(matrixDescription));
    matrixDescriptionBox.setAlignment(Pos.CENTER);
    matrixDescriptionBox.setPadding(descriptionInset);

    HBox matrix = new HBox();
    matrix.getChildren().addAll(createVectorVBox(a00, a10), createVectorVBox(a01, a11));

    HBox vectorDescriptionBox = new HBox(new Text(vectorDescription));
    vectorDescriptionBox.setAlignment(Pos.CENTER);
    vectorDescriptionBox.setPadding(descriptionInset);

    VBox vector = createVectorVBox(b0, b1);
    container.setStyle("-fx-padding: 10;");

    Button deleteButton = new Button("X");
    deleteButton.setStyle("-fx-background-color: red; -fx-text-fill: white;");
    deleteButton.setOnAction(event -> {
      if(parentContainer.getChildren().size() > 1) {
        parentContainer.getChildren().remove(container);
        affineSettingBox.removeMatrixAndVectorVBox(this);
      }
    });

    container.getChildren().addAll(matrixDescriptionBox, matrix, vectorDescriptionBox, vector, deleteButton);

    return container;
  }

  /**
   * <h2> createVectorVBox </h2>
   * <p> Creates a vectorBox to reduce duplicate code</p>
   *
   * @param value1 <p> x0 value in vector </p>
   * @param value2 <p> x1 value in vector </p>
   * @return <p> Vector in the form of a Vbox </p>
   */
  private VBox createVectorVBox(DoubleProperty value1, DoubleProperty value2) {
    VBox column = new VBox();
    TextField a01TextField = new TextField(String.valueOf(value1.get()));
    bindTextFieldToProperty(a01TextField, value1);
    a01TextField.setPrefWidth(60);
    TextField a11TextField = new TextField(String.valueOf(value2.get()));
    bindTextFieldToProperty(a11TextField, value2);
    a11TextField.setPrefWidth(60);

    column.getChildren().addAll(a01TextField, a11TextField);
    return column;
  }

  /**
   * <h2> bindTextFieldToProperty </h2>
   * <p> This binds a text field to a doubleProperty, this allows to easier assignment of values in the UI </p>
   *
   * @param textField      <p> Text field to bind </p>
   * @param doubleProperty <p> Double property to bind </p>
   */
  private void bindTextFieldToProperty(TextField textField, DoubleProperty doubleProperty) {
    NumberStringConverter converter = new NumberStringConverter("#.###");

    textField.textProperty().addListener((observable, oldValue, newValue) -> {
      if (!newValue.matches("-?\\d*(\\.\\d{0,3})?") || newValue.length() > 5) {
        textField.setText(oldValue);
      }
    });

    textField.textProperty().bindBidirectional(doubleProperty, converter);
  }

  /**
   * <h2> getValues </h2>
   * <p> Getter for values used in the vector and matrix </p>
   *
   * @return <p> Values in a double[] array </p>
   */
  public double[] getValues() {
    return new double[]{a00.get(), a01.get(), a10.get(), a11.get(), b0.get(), b1.get()};
  }
}
