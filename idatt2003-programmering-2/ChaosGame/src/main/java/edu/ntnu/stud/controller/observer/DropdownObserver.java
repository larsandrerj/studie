package edu.ntnu.stud.controller.observer;

import edu.ntnu.stud.controller.*;
import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.view.Dropdown;
import edu.ntnu.stud.view.View;

import java.io.FileNotFoundException;

/**
 * <h1>DropdownObserver</h1>
 * <p>
 * Observer for the dropdown class. When a new option is chosen, the observer is notified and
 * the settings for the chosen option is added to the view by the settingsController.
 * </p>
 */
public class DropdownObserver implements Observer<Dropdown> {
  /**
   * <h2>optionFilename</h2>
   * <p>
   * Filename of the chosen option in the dropdown in the view.
   * </p>
   */
  private String optionFilename;

  /**
   * <h2>optionFactoryStatus</h2>
   * <p>
   * Factory status of the chosen option. Tells if the option is a transformation created
   * by the GameDescriptionFactory or a transformation read from a file.
   * </p>
   */
  private boolean optionFactoryStatus;

  /**
   * <h2>controller</h2>
   * <p>
   * The main controller of the system.
   * </p>
   */
  private final Controller controller;

  /**
   * <h2>settingsController</h2>
   * <p>
   * The settings controller of the system.
   * </p>
   */
  private final SettingsController settingsController;

  /**
   * <h2>fh</h2>
   * <p>
   * The file handler of the system.
   * </p>
   */
  private final ChaosGameFileHandler fh;

  /**
   * <h2>Constructor</h2>
   *
   * @param controller The main controller of the system.
   */
  public DropdownObserver(Controller controller) {
    this.controller = controller;
    settingsController = controller.getSettingsController();
    fh = controller.getChaosGameFileHandler();
  }

  /**
   * <h2>update</h2>
   * <p>
   * Method which is called upon by an observable Dropdown when a change is made.
   * Saves the optionFilename and the optionFactoryStatus of the dropdown and calls to add
   * the settings to the view.
   * </p>
   *
   * @param dropdown <p>Type of observable object that has been updated.</p>
   */
  @Override
  public void update(Dropdown dropdown) {
    optionFilename = dropdown.getChosenOptionFilename();
    optionFactoryStatus = dropdown.getChosenOptionFactoryStatus();

    try {
      addSettings();
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }

  }

  /**
   * <h2>addSettings</h2>
   * <p>
   * Adds the settings of the chosen option to the view.
   * </p>
   *
   * @throws FileNotFoundException <p>If the file is not found.</p>
   */
  private void addSettings() throws FileNotFoundException {
    ChaosGameDescription description;

    description = optionFactoryStatus ?
        GameDescriptionFactory.getGameDescription(optionFilename) :
        fh.readFromFile(optionFilename);

    SettingFiller settingFiller = new SettingFiller(description, 100000);
    View view = controller.getView();
    view.addSettings(settingFiller.getSettingsBox(
        settingsController.getSettingsObserver()
    ));
  }
}
