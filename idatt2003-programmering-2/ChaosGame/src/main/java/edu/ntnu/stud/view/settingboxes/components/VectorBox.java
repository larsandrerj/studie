package edu.ntnu.stud.view.settingboxes.components;

import javafx.beans.property.DoubleProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.util.converter.NumberStringConverter;

/**
 * <h2> VectorBox </h2>
 * <p> Used to store vector values including a description of said vector </p>
 */
public class VectorBox {
  private final String vectorDescription;
  private final DoubleProperty x0 = new SimpleDoubleProperty();
  private final DoubleProperty x1 = new SimpleDoubleProperty();

  /**
   * <h2> VectorBox constructor </h2>
   *
   * @param vectorDescription <p> Description for vector in string form </p>
   * @param x0                <p> Double for x0 value in vector </p>
   * @param x1                <p> Double for x1 value in vector </p>
   */
  public VectorBox(String vectorDescription, Double x0, Double x1) {
    this.vectorDescription = vectorDescription;
    this.x0.set(x0);
    this.x1.set(x1);
  }

  /**
   * <h2> getVectorBox </h2>
   * <p> Creates vector box with description. </p>
   *
   * @return <p> VectorBox in the form of a HBox </p>
   */
  public HBox getVectorBox() {
    HBox vectorWithDescription = new HBox();
    vectorWithDescription.setAlignment(Pos.CENTER);


    Text description = new Text(vectorDescription);
    vectorWithDescription.getChildren().add(description);

    VBox vectorVbox = new VBox();

    TextField x0TextField = new TextField(String.valueOf(x0.get()));
    x0TextField.setPrefWidth(60);
    bindTextFieldToProperty(x0TextField, x0);

    TextField x1TextField = new TextField(String.valueOf(x1.get()));
    x1TextField.setPrefWidth(60);
    bindTextFieldToProperty(x1TextField, x1);

    vectorVbox.getChildren().addAll(x0TextField, x1TextField);
    vectorVbox.setPadding(new Insets(10));

    vectorWithDescription.getChildren().add(vectorVbox);

    vectorWithDescription.setId("vectorWithDescription");

    return vectorWithDescription;
  }

  /**
   * <h2> bindTextFieldToProperty </h2>
   * <p> This binds a text field to a doubleProperty, this allows to easier assignment of values in the ui </p>
   *
   * @param textField      <p> Text field to bind </p>
   * @param doubleProperty <p> Long property to bind </p>
   */
  private void bindTextFieldToProperty(TextField textField, DoubleProperty doubleProperty) {

    textField.textProperty().addListener((observable, oldValue, newValue) -> {
      if (!newValue.matches("-?\\d*(\\.\\d{0,3})?") || newValue.length() > 5) {
        textField.setText(oldValue);
      }
    });

    textField.textProperty().bindBidirectional(doubleProperty, new NumberStringConverter("#.###"));
  }

  /**
   * <h2> getVectorValues </h2>
   * <p> getter for the vector values in the form of a double array  </p>
   *
   * @return <p> array with the vector values </p>
   */
  public double[] getVectorValues() {
    return new double[]{x0.get(), x1.get()};
  }
}

