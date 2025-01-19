package edu.ntnu.stud.controller.observer;


import edu.ntnu.stud.controller.SettingsController;
import edu.ntnu.stud.view.settingboxes.AffineSettingBox;
import edu.ntnu.stud.view.settingboxes.BaseSettingsBox;
import edu.ntnu.stud.view.settingboxes.JuliaSettingBox;

/**
 * <h1> settingsObserver </h1>
 * <p> This class is an observer that observes setting for changes in VectorValues and iterations </p>
 */
public class SettingsObserver implements Observer<BaseSettingsBox> {

  private final SettingsController settingsController;
  private String typeOfTransformation;
  private double[][] vectorValues;
  private long iterations;
  private boolean animationSelected;

  public SettingsObserver(SettingsController settingsController) {
    this.settingsController = settingsController;
  }

  /**
   * <h2> update </h2>
   * <p> This is used to get values form a BaseSettingBox and
   * differentiates if the they are julia or affine settings boxes </p>
   *
   * @param baseSettingsBox <p> Setting box to get values from </p>
   */
  @Override
  public void update(BaseSettingsBox baseSettingsBox) {
    iterations = baseSettingsBox.getIterations();
    animationSelected = baseSettingsBox.getAnimationSelected();

    if (baseSettingsBox instanceof JuliaSettingBox) {
      typeOfTransformation = "Julia";
      vectorValues = ((JuliaSettingBox) baseSettingsBox).getVectorValues();
    } else if (baseSettingsBox instanceof AffineSettingBox) {
      typeOfTransformation = "Affine";
      vectorValues = ((AffineSettingBox) baseSettingsBox).getVectorsAndMatricesValues();
    } else {
      throw new IllegalArgumentException();
    }

    if (baseSettingsBox.getRunGamePressed()) {
      settingsController.runGameFromSettings();
    }

    if (baseSettingsBox.getSaveToFilePressed()) {
      settingsController.saveGameFromSettings();
    }
  }


  /**
   * <h2> getTypeOfTransformation </h2>
   * <p> getter for typeOfTransformation </p>
   *
   * @return <p> typeOfTransformation in string form </p>
   */
  public String getTypeOfTransformation() {
    return typeOfTransformation;
  }

  /**
   * <h2> getVectorValues </h2>
   * <p> getter for Vector values </p>
   *
   * @return <p> a double[][] array with values </p>
   */
  public double[][] getVectorValues() {
    return vectorValues;
  }

  /**
   * <h2> getIterations </h2>
   * <p> getter for iterations </p>
   *
   * @return <p> iterations in a long form </p>
   */
  public long getIterations() {
    return iterations;
  }

  public boolean getAnimationSelected() {
    return animationSelected;
  }

}
