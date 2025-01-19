package no.ntnu.idatt1005.view;

import javafx.scene.Group;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

/**
 * Provides utility methods for creating UI components related to a fridge interface.
 * This class handles the construction of various visual elements used to display and edit items in a fridge.
 */

public class FridgeViewBuilder {

  /**
   * Constructs a FridgeViewBuilder.
   */
  public FridgeViewBuilder() {
  }

  /**
   * Creates and returns the main container for the fridge UI as a Group containing a VBox.
   *
   * @return A Group containing an empty VBox with ID 'fridge-container'.
   */
  public Group getFridgeGroup() {
    VBox masterContainer = new VBox();
    masterContainer.setId("fridge-container");

    return new Group(
        masterContainer
    );
  }

  /**
   * Creates an HBox for displaying fridge item details including name, amount, unit, and edit functionality.
   *
   * @param name The name of the item.
   * @param amount The amount of the item.
   * @param unit The unit of the item amount.
   * @return An HBox containing labels and buttons for item manipulation.
   */

  public HBox getFridgeHbox(String name, String amount, String unit) {
    Button decreaseButton = new Button("-");
    decreaseButton.setId("minus-button");
    Button increaseButton = new Button("+");
    increaseButton.setId("plus-button");

    //TextArea amountTextArea = new TextArea(amount);
    //amountTextArea.setId("amount-text-area");

    Label amountLabel = new Label(amount);
    amountLabel.setId("amount-label");
    Label nameLabel = new Label(name);
    Label unitLabel = new Label(unit);

    HBox fridgeBox = new HBox();
    fridgeBox.setSpacing(10);

    Button editButton = new Button("edit");
    editButton.setId("edit-button");

    nameLabel.setPrefSize(100, 20);
    decreaseButton.setPrefSize(20, 20);
    amountLabel.setPrefSize(40, 20);
    //amountTextArea.setPrefSize(100,10);
    increaseButton.setPrefSize(20, 20);
    unitLabel.setPrefSize(50, 20);

    fridgeBox.getChildren().addAll(nameLabel, decreaseButton, amountLabel, increaseButton, unitLabel, editButton);
    fridgeBox.setId("fridge-hbox");
    return fridgeBox;
  }

  /**
   * Creates an HBox for editing fridge item details, including interactive elements for changing amount.
   *
   * @param name The name of the item.
   * @param amount The initial amount of the item.
   * @param unit The unit of the item amount.
   * @return An HBox containing interactive elements for item editing.
   */

  public HBox getEditFridgeHbox(String name, String amount, String unit){
    Button decreaseButton = new Button("-");
    decreaseButton.setId("minus-button");
    Button increaseButton = new Button("+");
    increaseButton.setId("plus-button");

    TextArea amountTextArea = new TextArea(amount);
    amountTextArea.setId("amount-text-area");

    Label nameLabel = new Label(name);
    Label unitLabel = new Label(unit);

    HBox editFridgeBox = new HBox();
    editFridgeBox.setSpacing(10);

    Button saveButton = new Button("save");
    saveButton.setId("save-button");

    nameLabel.setPrefSize(100, 20);
    decreaseButton.setPrefSize(20, 20);
    amountTextArea.setPrefSize(100,10);
    increaseButton.setPrefSize(20, 20);
    unitLabel.setPrefSize(50, 20);

    editFridgeBox.getChildren().addAll(nameLabel, decreaseButton, amountTextArea, increaseButton, unitLabel, saveButton);
    editFridgeBox.setId("fridge-hbox");
    return editFridgeBox;
  }

  /**
   * Creates a Group containing UI elements for editing a fridge item with actions to save changes.
   *
   * @param name The name of the item.
   * @param amount The initial amount of the item.
   * @param unit The unit of the item amount.
   * @return A Group with interactive elements to edit and save fridge item details.
   */

  public Group getFridgeEdit(String name, String amount, String unit) {
    Label nameLabel = new Label(name);
    nameLabel.setId("name-label");
    nameLabel.setPrefSize(100,30);

    TextArea amountTextArea = new TextArea(amount);
    amountTextArea.setId("amount-text-area");
    amountTextArea.setPrefSize(100,30);

    Label unitLabel = new Label(unit);
    unitLabel.setId("unit-label");

    Button saveButton = new Button("save");
    saveButton.setId("save-button");
    saveButton.setOnAction(e-> saveButtonFridgeAmount(amountTextArea.getText()));


    HBox nameLabelUnitTextAreaHbox = new HBox(
        nameLabel,
        amountTextArea,
        unitLabel,
        saveButton
    );
    nameLabelUnitTextAreaHbox.setId(
        "name-label-unit-text-area-hbox"
    );

    return new Group(
        nameLabelUnitTextAreaHbox
    );
  }

  /**
   * Updates the fridge item amount based on user input from the save button action.
   *
   * @param amount The new amount to update.
   */

  private void saveButtonFridgeAmount(String amount){
    //method to update amount
  }

}




