package edu.ntnu.stud.view.settingboxes;

import edu.ntnu.stud.view.settingboxes.components.JuliaSlider;
import javafx.geometry.Pos;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

import java.util.Arrays;

/**
 * <h1> Julia setting Box </h1>
 */
public class JuliaSettingBox extends BaseSettingsBox {

  private JuliaSlider realNumberSlider;
  private JuliaSlider imaginaryNumberSlider;

  /**
   * <h2> createJuliaSettingBox </h2>
   * <p> This method continues to build the base setting box with julia sliders </p>
   *
   * @param vectorValues <p> The values for the complex number in vector form </p>
   * @param iterations   <p> The amount of iterations the user wants the program to run </p>
   * @return <p> VBox to be used in the final view </p>
   */
  public VBox createJuliaSettingBox(double[][] vectorValues, long iterations) {

    super.SettingBox(vectorValues[0], vectorValues[1], iterations);

    VBox juliaSettingBox = super.createBaseSettingsBox();

    double[] complexNumber = vectorValues[2];

    realNumberSlider = new JuliaSlider(complexNumber[0], 1, -1, "Real Part: ");
    juliaSettingBox.getChildren().add(realNumberSlider.getSlider());

    imaginaryNumberSlider = new JuliaSlider(complexNumber[1], 1, -1, "Imaginary Part: ");
    juliaSettingBox.getChildren().add(imaginaryNumberSlider.getSlider());

    super.setHeading("Settings for Julia Transformations");
    HBox runAndSaveButtons = new HBox();
    runAndSaveButtons.getChildren().addAll(super.createSaveButton(), super.createRunButton());
    runAndSaveButtons.setAlignment(Pos.CENTER);
    settingBox.getChildren().add(runAndSaveButtons);

    return juliaSettingBox;
  }

  /**
   * <h2> getVectorValues </h2>
   * <p> This return the vector values in a double vector </p>
   *
   * @return <p> double[][] </p>
   */
  public double[][] getVectorValues() {
    double[][] minAndMaxVectors = super.getMinAndMaxVectors();
    double[] complexNumber = {realNumberSlider.getCurrentValue(), imaginaryNumberSlider.getCurrentValue()};
    double[][] combinedValues = new double[minAndMaxVectors.length + 1][];

    System.arraycopy(minAndMaxVectors, 0, combinedValues, 0, minAndMaxVectors.length);
    combinedValues[combinedValues.length - 1] = complexNumber;

    System.out.println(Arrays.deepToString(combinedValues));

    return combinedValues;
  }
}
