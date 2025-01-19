package edu.ntnu.stud.view;

import edu.ntnu.stud.controller.observer.Observable;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.ComboBox;
import javafx.stage.Stage;

import java.io.File;
import java.util.ArrayList;

/**
 * <h1>Dropdown</h1>
 * <p>
 * Class responsible for creating and handling the dropdown menu in the user interface.
 * </p>
 */
public class Dropdown extends Observable<Dropdown> {
  /**
   * <h2>fe</h2>
   * <p>
   * File explorer used to open a file dialog when a file option is chosen in the dropdown.
   * </p>
   */
  private final FileExplorer fe = new FileExplorer();

  /**
   * <h2>comboBox</h2>
   * <p>
   * The dropdown menu in the user interface.
   * </p>
   */
  private final ComboBox<String> comboBox;

  /**
   * <h2>displayNameList</h2>
   * <p>
   * List of display names for the options in the dropdown.
   * </p>
   */
  private final ObservableList<String> displayNameList;

  /**
   * <h2>factoryStatusList</h2>
   * <p>
   * List of factory status for the options in the dropdown.
   * </p>
   */
  private final ArrayList<Boolean> factoryStatusList;

  /**
   * <h2>filenameList</h2>
   * <p>
   * List of filenames for the options in the dropdown.
   * </p>
   */
  private final ArrayList<String> filenameList;

  /**
   * <h2>chosenOptionFactoryStatus</h2>
   * <p>
   * Factory status of the index of the chosen option in the dropdown.
   * </p>
   */
  private boolean chosenOptionFactoryStatus;

  /**
   * <h2>chosenOptionFilename</h2>
   * <p>
   * Filename of the index of the chosen option in the dropdown.
   * </p>
   */
  private String chosenOptionFilename;

  /**
   * <h2>Constructor</h2>
   * <p>
   * Initializes the dropdown menu.
   * </p>
   */
  public Dropdown() {
    displayNameList = FXCollections.observableArrayList();
    factoryStatusList = new ArrayList<>();
    filenameList = new ArrayList<>();

    this.comboBox = new ComboBox<>(displayNameList);
    comboBox.setPromptText("Choose a Transformation");
    comboBox.setStyle("-fx-prompt-text-fill: black; -fx-font-size: 24; -fx-alignment: center;" +
        " -fx-background-color: #F0F0F0; -fx-border-color: #C0C0C0; -fx-border-radius: 15;" +
        " -fx-padding: 10; -fx-cursor: hand;");

    // Updates the observers when an option is chosen in the comboBox.
    comboBox.setOnAction(
        e -> {
          int chosenOption = displayNameList.indexOf(comboBox.getValue());

          if (chosenOption == displayNameList.size() - 1) {
            File file = fe.getFile(new Stage());
            chosenOptionFactoryStatus = false;
            chosenOptionFilename = file.getAbsolutePath();

          } else {
            chosenOptionFactoryStatus = factoryStatusList.get(chosenOption);
            chosenOptionFilename = filenameList.get(chosenOption);
          }


          updateObservers(this);
        }
    );
  }

  /**
   * <h2>getDropdown</h2>
   * <p>
   * Returns the comboBox.
   * </p>
   *
   * @return <p>The comboBox.</p>
   */
  public ComboBox<String> getDropdown() {
    return comboBox;
  }

  /**
   * <h2>addOption</h2>
   * <p>
   * Adds an option to the dropdown, its status to the factoryStatusList and its filename to
   * the filenameList.
   * </p>
   *
   * @param factory     <p>Status of the option. True if the option is created by the
   *                    GameDescriptionFactory.</p>
   * @param filename    <p>Filename of the option.
   *                    If the option is created by the GameDescriptionFactory, the filename is
   *                    the name of the corresponding factory method.</p>
   * @param displayName <p>Name which will be displayed in the comboBox.</p>
   */
  public void addOption(boolean factory, String filename, String displayName) {
    displayNameList.add(displayName);
    factoryStatusList.add(factory);
    filenameList.add(filename);
  }

  /**
   * <h2>getChosenOptionFactoryStatus</h2>
   * <p>
   * Returns the factory status of the chosen option in the dropdown.
   * </p>
   *
   * @return <p>The factory status of the chosen option in the dropdown.</p>
   */
  public boolean getChosenOptionFactoryStatus() {
    return chosenOptionFactoryStatus;
  }

  /**
   * <h2>getChosenOptionFilename</h2>
   * <p>
   * Returns the filename of the chosen option in the dropdown.
   * </p>
   *
   * @return <p>The filename of the chosen option in the dropdown.</p>
   */
  public String getChosenOptionFilename() {
    return chosenOptionFilename;
  }


}
