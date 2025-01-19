package edu.ntnu.stud.view.settingboxes.components;

import javafx.beans.property.DoubleProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Slider;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.util.converter.NumberStringConverter;

/**
 * <h1> Julia slider class </h1>
 * <p> This is used in JuliaSettingBox to promote exploration of julia transformation </p>
 */
public class JuliaSlider {
  private final String sliderValueName;
  private final double min;
  private final double max;
  private final DoubleProperty currentValue = new SimpleDoubleProperty();

  private Slider slider;
  private TextField valueField;

  /**
   * <h2> Constructor for Julia Slider </h2>
   *
   * @param value           <p> Value the slider should be set to </p>
   * @param max             <p> Max value the slider can go to </p>
   * @param min             <p> Min value the slider can go to  </p>
   * @param sliderValueName <p> Name for the slider to inform users </p>
   */
  public JuliaSlider(double value, double max, double min, String sliderValueName) {
    this.max = max;
    this.min = min;
    this.sliderValueName = sliderValueName;
    this.currentValue.set(value);
  }

  /**
   * <h2> getSlider </h2>
   * <p> This creates and returns the slider  </p>
   *
   * @return <p> Vbox to be used in JuliaSettings </p>
   */
  public VBox getSlider() {
    VBox sliderBox = new VBox();
    sliderBox.setAlignment(Pos.CENTER);

    HBox descriptionAndValueBox = new HBox();
    descriptionAndValueBox.setAlignment(Pos.CENTER);

    Text description = new Text(sliderValueName);
    valueField = new TextField();
    valueField.setPrefWidth(60);

    descriptionAndValueBox.getChildren().addAll(description, valueField);

    slider = new Slider(min, max, currentValue.get());
    slider.setValue(currentValue.get());
    slider.setShowTickMarks(true);

    bindProperties(valueField, currentValue);

    sliderBox.getChildren().addAll(descriptionAndValueBox, slider);
    sliderBox.setPadding(new Insets(30, 0, 30, 0));
    return sliderBox;
  }

  /**
   * <h2> bindTextFieldToProperty </h2>
   * <p> This binds a text field to a doubleProperty, this allows to easier assignment of values in the ui </p>
   *
   * @param textField      <p> Text field to bind </p>
   * @param doubleProperty <p> Long property to bind </p>
   */
  private void bindProperties(TextField textField, DoubleProperty doubleProperty) {

    textField.textProperty().addListener((observable, oldValue, newValue) -> {
      if (!newValue.matches("-?\\d*(\\.\\d{0,3})?")) {
        textField.setText(oldValue);
      }
    });
    valueField.textProperty().bindBidirectional(currentValue, new NumberStringConverter("#.###"));
    slider.valueProperty().bindBidirectional(doubleProperty);
  }

  /**
   * <h2> getCurrentValue </h2>
   * <p> Getter for current value in slider </p>
   *
   * @return <p> double </p>
   */
  public double getCurrentValue() {
    return this.currentValue.get();
  }

}
