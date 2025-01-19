package no.ntnu.idatt1005.view;


import javafx.scene.Group;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

/**
 * This class is responsible for creating user interface components related to ingredient management in a JavaFX application.
 * It provides methods to build and return graphical components for displaying and editing ingredients.
 */

public class IngredientViewBuilder {

  /**
   * Constructor for IngredientViewBuilder.
   */

  public IngredientViewBuilder() {
  }

  /**
   * Creates and returns a Group containing a VBox as its root element.
   * This container is used to group elements in the ingredient view but is initially empty.
   *
   * @return a Group object containing an empty VBox with ID set to "ingredient-container".
   */

  public Group getIngredientsGroup() {
    VBox masterContainer = new VBox();
    masterContainer.setId("ingredient-container");

    return new Group(
        masterContainer
    );
  }
  /**
   * Creates a VBox containing the UI components for managing a single ingredient.
   * This includes elements for displaying the ingredient's name, adjusting its amount, and editing or removing the ingredient.
   *
   * @param name The name of the ingredient.
   * @param defaultAmount The default amount of the ingredient.
   * @param unit The unit of measure for the ingredient (e.g., grams, liters).
   * @return a VBox containing the UI elements for ingredient management.
   */

  public VBox getIngredientVbox(String name, float defaultAmount, String unit) {
    Text title = new Text(name);
    title.setId("title-ingredient-text");

    Button plusButton = new Button("+");
    plusButton
        .setId("plus-button");

    Button minusButton = new Button("-");
    minusButton
        .setId("minus-button");

    Text addAmountToListText = new Text(String.valueOf(defaultAmount));
    addAmountToListText.setId("add-amount-to-list-text");

    Label ingredientUnit = new Label(unit);
    ingredientUnit.setId("ingredient-unit");

    Button addToListButton = new Button("Add to list");
    addToListButton
        .setId("add-to-list-button"
        );

    Button editButton = new Button("Edit");
    editButton.setId(
        "edit-ingredient-button"
    );

    Button removeButton = new Button("Remove");
    removeButton
        .setId(
            "remove-button"
        );
    HBox titleHbox = new HBox(title);
    titleHbox
        .setId(
            "title-hbox"
        );

    HBox adjustAmountHbox = new HBox(
        minusButton,
        addAmountToListText,
        plusButton,
        ingredientUnit
    );
    adjustAmountHbox
        .setId(
            "adjust-amount-hbox"
        );

    HBox addToListHbox = new HBox(
        addToListButton
    );
    addToListHbox.setId("add-to-list-hbox");

    HBox editRemoveHbox = new HBox(
        editButton,
        removeButton
    );
    editRemoveHbox
        .setId(
            "edit-remove-hbox"
        );

    VBox ingredientVbox = new VBox(
        titleHbox,
        adjustAmountHbox,
        addToListHbox,
        editRemoveHbox
    );
    ingredientVbox.setId("ingredient-vbox");

    VBox masterIngredientVbox = new VBox(
        ingredientVbox
    );
    masterIngredientVbox.setId("ingredient-removable-" + name);

    return masterIngredientVbox;
  }

  /**
   * Builds and returns a Group containing a pane for editing an ingredient's properties.
   * This pane allows modification of the ingredient's name, unit, and default amount, and includes a save button.
   *
   * @param name The initial name of the ingredient to display in the edit pane.
   * @param unit The initial unit of the ingredient to display in the edit pane.
   * @param defaultAmount The initial default amount of the ingredient to display in the edit pane.
   * @return a Group containing a VBox configured for editing an ingredient's details.
   */

  public Group getIngredientEditPane(String name, String unit, float defaultAmount) {
    Label nameLabel = new Label("Name: ");
    nameLabel.setId("name-label");
    nameLabel.setPrefSize(100,30);

    TextArea nameTextArea = new TextArea(name);
    nameTextArea.setId("name-text-area");
    nameTextArea.setPrefSize(100,30);

    HBox nameLabelTextAreaHbox = new HBox(
        nameLabel,
        nameTextArea
    );
    nameLabelTextAreaHbox.setId(
        "name-label-text-area-hbox"
    );

    Label unitLabel = new Label("unit: ");
    unitLabel.setId("unit-label");
    unitLabel.setPrefSize(100,30);

    TextArea unitTextArea = new TextArea(unit);
    unitTextArea.setId("unit-text-area");
    unitTextArea.setPrefSize(100,30);
    HBox unitLabelTextArea = new HBox(
        unitLabel,
        unitTextArea
    );
    unitLabelTextArea.setId("unit-label-text-area-hbox");

    Label defaultAmountLabel = new Label("Default amount: ");
    defaultAmountLabel.setId("default-amount-label");
    defaultAmountLabel.setPrefSize(100,30);

    TextArea defaultAmountTextArea = new TextArea(String.valueOf(defaultAmount));
    defaultAmountTextArea.setId("default-amount-text-area");
    defaultAmountTextArea.setPrefSize(100,30);

    HBox defaultAmountLabelTextArea = new HBox(
        defaultAmountLabel,
        defaultAmountTextArea
    );
    defaultAmountLabelTextArea.setId("default-amount-label-text-area-hbox");

    Button saveButton = new Button("save");
    saveButton.setId("save-button");

    VBox nameUnitDefaultAmountVbox = new VBox(
        nameLabelTextAreaHbox,
        unitLabelTextArea,
        defaultAmountLabelTextArea,
        saveButton
    );
    nameUnitDefaultAmountVbox.setId("name-unit-default-amount-vbox");

    VBox masterContainer = new VBox(
        nameUnitDefaultAmountVbox
    );

    masterContainer.setId(
        "ingredient-edit-pane"
    );

    return new Group(
        masterContainer
    );
  }
}



