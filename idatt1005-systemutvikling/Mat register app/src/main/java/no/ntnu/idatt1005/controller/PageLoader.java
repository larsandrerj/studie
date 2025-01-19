package no.ntnu.idatt1005.controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.*;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.scene.control.Button;
import no.ntnu.idatt1005.model.data.IDAmountStruct;
import no.ntnu.idatt1005.model.data.entities.PurchasePlan;
import no.ntnu.idatt1005.view.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Map;
import java.util.stream.Stream;
import java.util.concurrent.atomic.AtomicReference;

/**
 * <h1>PageLoader</h1>
 * <p>
 *     Class responsible for loading the user-interface.
 * </p>
 */
public class PageLoader {
    MainController mainController;
    @FXML
    private AnchorPane subSceneRoot;
    private Group fridgePane;
    private Group recipesPane;
    private FridgeViewBuilder fridgeViewBuilder = new FridgeViewBuilder();
    private RecipeViewBuilder recipeViewBuilder = new RecipeViewBuilder();
    private AlertViewBuilder alert = new AlertViewBuilder();
    private Group ingredientsPane;
    private IngredientViewBuilder ingredientViewBuilder = new IngredientViewBuilder();

    @FXML
    private VBox purchasePlanVBox;
    @FXML
    private VBox purchasePlanInfoVBox;
    @FXML
    private VBox ingredientsBox;
    @FXML
    public VBox recipesBox;
    @FXML
    public HBox purchasePlanHeader;
    @FXML
    public Label purchasePlanHeaderText;
    @FXML
    private HBox purchasePlanFooter;
    @FXML
    private Label greenStrip;
    PurchasePlanView purchasePlanView = new PurchasePlanView();
    private boolean purchasePlanVisible = false;
    private int collapsedWidth = 30;
    private int expandedWidth = 800;

    /**
     * Initializes the page loader.
     */
    public void initialize() {
        initFridgePane();
        initIngredientPane();
        initRecipePane();

        purchasePlanVBox.setVisible(true);
        purchasePlanFooter.setVisible(false);
    }

    /**
     * Saves a reference to the main controller in pageLoader
     *
     * @param mainController The main controller
     */
    public void setController(MainController mainController) {
        this.mainController = mainController;
    }

    /**
     * Initializes the fridge pane so fridge elements may be added to it.
     */
    private void initFridgePane() {
        fridgePane = fridgeViewBuilder.getFridgeGroup();
    }

    /**
     * Removes all items from the fridge.
     */
    public void ClearFridge() throws IllegalArgumentException {
        VBox masterContainer = fridgePane.getChildren().stream().filter(e -> e.getId().equals("fridge-container")).findFirst().map(node -> (VBox) node) // Cast here if the node is found.
            .orElseThrow(() -> new IllegalArgumentException("Fridge container not found")); // Or throw an exception if not found.
        masterContainer.getChildren().clear();
    }

    /**
     * Adds an ingredient to the fridge pane.
     *
     * @param name The name of the ingredient.
     * @param amount The amount of the ingredient.
     * @param unit The unit of the ingredient.
     * @throws IllegalArgumentException if the input is invalid
     */
    public void addToFridge(String name, String amount, String unit) throws IllegalArgumentException {

        VBox masterContainer = (VBox) getChildByIdInNodeStream(
            fridgePane.getChildren().stream(), "fridge-container");


        HBox masterFridgeHbox = fridgeViewBuilder.getFridgeHbox(name, amount, unit);

        Button plusButton = (Button) getChildByIdInNodeStream(
            masterFridgeHbox.getChildren().stream(), "plus-button");
        Button minusButton = (Button) getChildByIdInNodeStream(
            masterFridgeHbox.getChildren().stream(), "minus-button");
        Label amountLabel = (Label) getChildByIdInNodeStream(
            masterFridgeHbox.getChildren().stream(), "amount-label");
        Button editButton = (Button) getChildByIdInNodeStream(
            masterFridgeHbox.getChildren().stream(), "edit-button"
        );
        editButton.setOnAction(e -> editIngredientFridge(name, amount, unit));


        masterContainer
            .getChildren()
            .add(masterFridgeHbox);

    }

    /**
     * Opens an editing interface for a specified ingredient in the fridge.
     * This method retrieves the necessary UI components to edit the ingredient's details, including its name, amount, and unit.
     * The interface is presented in a new modal window.
     *
     * @param name The name of the ingredient to edit.
     * @param amount The current amount of the ingredient, displayed for editing.
     * @param unit The unit of measurement for the ingredient (e.g., grams, liters).
     */
    private void editIngredientFridge(String name, String amount, String unit) {
        Group fridgeEditPane = fridgeViewBuilder.getFridgeEdit(name, amount, unit);

        HBox nameLabelTextAreaHbox = (HBox) getChildByIdInNodeStream(
            fridgeEditPane.getChildren().stream(), "name-label-unit-text-area-hbox"
        );

        Label nameLabel = (Label) getChildByIdInNodeStream(
            nameLabelTextAreaHbox.getChildren().stream(), "name-label"
        );
        TextArea amountTextArea = (TextArea) getChildByIdInNodeStream(
            nameLabelTextAreaHbox.getChildren().stream(), "amount-text-area"
        );
        Label unitLabel = (Label) getChildByIdInNodeStream(
            nameLabelTextAreaHbox.getChildren().stream(), "unit-label"
        );
        Button saveButton = (Button) getChildByIdInNodeStream(
            nameLabelTextAreaHbox.getChildren().stream(), "save-button"
        );

        Scene scene = new Scene(fridgeEditPane);
        Stage editStage = new Stage();
        editStage.setTitle("Fridge ingredient");
        editStage.setScene(scene);
        editStage.show();

    }

    /**
     * Initializes the recipe pane.
     */
    private void initRecipePane() {
        Group recipesGroup = recipeViewBuilder.getRecipesGroup();
        VBox masterContainer = (VBox) getChildByIdInNodeStream(
                recipesGroup.getChildren().stream(),
                "recipes-container"
        );

        Button addButton = (Button) getChildByIdInNodeStream(
                masterContainer.getChildren().stream(),
                "add-button"
        );

        addButton.setOnAction(e ->{loadRecipeAddPane();});

        recipesPane = recipesGroup;

    }

    /**
     * Adds a recipe to the recipes pane with provided details.
     *
     * @param name             The name of the recipe.
     * @param unit             The unit of the recipe (e.g., portions).
     * @param defaultPortions  The default portions for the recipe.
     * @param instructions     The instructions for preparing the recipe.
     * @throws IllegalArgumentException If any argument is invalid.
     */
    public void addRecipeToRecipesPane(String name, String unit, String defaultPortions, String instructions) throws IllegalArgumentException {
        // Get the container for recipes from the recipes pane
        VBox masterContainer = (VBox) getChildByIdInNodeStream(
            recipesPane.getChildren().stream(), "recipes-container");

        // Build the VBox for the recipe
        VBox masterRecipeVbox = recipeViewBuilder.getRecipeVbox(name, defaultPortions);

        // Find the VBox for the specific recipe
        VBox recipeVbox = (VBox) getChildByIdInNodeStream(
            masterRecipeVbox.getChildren().stream(), "recipe-vbox");

        // Find the HBox containing the title and view button
        HBox titleViewButtonHbox = (HBox) getChildByIdInNodeStream(
            recipeVbox.getChildren().stream(), "title-view-button-hbox");

        // Set action for the view recipe instructions button
        Button viewRecipeInstructionsButton = (Button) getChildByIdInNodeStream(
            titleViewButtonHbox.getChildren().stream(), "view-recipe-instructions-button");

        viewRecipeInstructionsButton.setOnAction(e -> mainController.LoadRecipeInstructionsView(name));

        // Find the HBox for adding to purchase plan
        HBox addToPurchasePlanHbox = (HBox) getChildByIdInNodeStream(
            recipeVbox.getChildren().stream(), "add-to-purchase-plan-hbox");

        // Find the HBox for editing and removing
        HBox editRemoveHbox = (HBox) getChildByIdInNodeStream(
            recipeVbox.getChildren().stream(), "edit-remove-hbox");

        // Find the edit button and set action to load edit pane
        Button editButton = (Button) getChildByIdInNodeStream(
            editRemoveHbox.getChildren().stream(), "edit-button");
        editButton.setOnAction(e -> mainController.LoadRecipeAddView(name));

        // Find the remove button and set action to remove the recipe
        Button removeButton = (Button) getChildByIdInNodeStream(
            editRemoveHbox.getChildren().stream(), "remove-button");
        removeButton.setOnAction(e -> mainController.RemoveRecipeFromRegistry(name));

        // Add the recipe VBox to the master container
        masterContainer.getChildren().add(masterRecipeVbox);
    }

    /**
     * Calls to loadRecipeAddPane() with empty arguments. Used to create a new recipe.
     */
    public void loadRecipeAddPane() {
        String name = "";
        String instructions = "";
        float defaultPortions = 0f;
        List<IDAmountStruct> ingredients = new ArrayList<>();

        loadRecipeAddPane(name, instructions, defaultPortions, ingredients);
    }

    /**
     * Loads the recipe add pane. The recipe add pane edits an existing recipe or creates a new
     * one. Adds pre-data name, instructions default portions and
     * ingredients which belong to a given recipe. The recipe add pane contains text areas to
     * edit the name and instructions. Buttons to increment or decrement the portions of a
     * recipe, as well as buttons to add new ingredients to a recipe.
     *
     * @param name name of a recipe.
     * @param instructions instructions to the recipe
     * @param defaultPortions portions the recipe will create.
     * @param ingredients ingredients in the recipe
     */
    public void loadRecipeAddPane(String name, String instructions, float defaultPortions,
                                   List<IDAmountStruct> ingredients) {
        Group recipeAddPane = recipeViewBuilder.getRecipeAddPane(
                        name,
                        instructions,
                        defaultPortions,
                        ingredients
                );

        VBox masterContainer = (VBox) getChildByIdInNodeStream(
                recipeAddPane
                        .getChildren()
                        .stream(),
                "recipe-add-pane"
        );

        Button addButton = (Button) getChildByIdInNodeStream(
                masterContainer
                        .getChildren()
                        .stream(),
                "recipe-add-button"
        );

        addButton.setOnAction(e -> {extractValuesFromRecipeAddPane(recipeAddPane);});


        subSceneRoot.getChildren().setAll(
                recipeAddPane
        );
    }

    /**
     * Extracts the values from the recipeAddPane and saves the changes to the registry.
     *
     * @param recipeAddPane pane that contains the data of an edited or new recipe.
     */
    private void extractValuesFromRecipeAddPane(Group recipeAddPane) {
        VBox masterContainer = (VBox) getChildByIdInNodeStream(
                recipeAddPane.getChildren().stream(),
                "recipe-add-pane"
        );

        HBox namePortionDescriptionIngredients = (HBox) getChildByIdInNodeStream(
                masterContainer.getChildren().stream(),
                "name-portion-description-ingredients"
        );

        VBox namePortionInstructionsVbox = (VBox) getChildByIdInNodeStream(
                namePortionDescriptionIngredients.getChildren().stream(),
                "name-portion-instructions-vbox"
        );

        HBox nameLabelTextAreaHbox = (HBox) getChildByIdInNodeStream(
                namePortionInstructionsVbox.getChildren().stream(),
                "name-label-textarea-hbox"
        );

        String name = ((TextArea) getChildByIdInNodeStream(
                nameLabelTextAreaHbox.getChildren().stream(),
                "name-textarea"
        )).getText();

        HBox portionHbox = (HBox) getChildByIdInNodeStream(
                namePortionInstructionsVbox.getChildren().stream(),
                "portion-hbox"
        );

        float amount = Float.parseFloat(((Text) getChildByIdInNodeStream(
                portionHbox.getChildren().stream(),
                "portion-text"
        )).getText());

        String instructions = ((TextArea) getChildByIdInNodeStream(
                namePortionInstructionsVbox.getChildren().stream(),
                "instructions-textarea"
        )).getText();

        Group ingredientsGroup = (Group) getChildByIdInNodeStream(
                namePortionDescriptionIngredients.getChildren().stream(),
                "ingredients-group"
        );

        VBox recipeIngredientsMaster = (VBox) getChildByIdInNodeStream(
                ingredientsGroup.getChildren().stream(),
                "recipe-ingredients-master"
        );


        VBox ingredientsVbox = (VBox) getChildByIdInNodeStream(
                recipeIngredientsMaster.getChildren().stream(),
                "recipe-ingredients-vbox"
        );


        List<IDAmountStruct> ingredients = new ArrayList<>();

        ingredientsVbox.getChildren().stream().filter(
                e -> Objects.equals(
                        e.getId(), "ingredient-add-area-hbox"
                )
        ).forEach(
                e -> {
                    IDAmountStruct ing = getIDAmountStructIngredientFromHbox((HBox) e);
                    if (!Objects.equals(ing.getName(), null)) {
                        ingredients.add(ing);
                    }
                }
        );

        mainController.EditRecipeInRegistry(
                new IDAmountStruct(name, amount),
                ingredients.toArray(new IDAmountStruct[ingredients.size()]),
                new String[]{},
                instructions
        );

    }

    /**
     * Method for finding name and amount values to an ingredient HBox and returning an
     * IDAmountStruct-object
     * from those values.
     *
     * @param hBox Hbox with values to an ingredient.
     * @return IDAmountStruct-object with name and amount values to an ingredient.
     */
    private IDAmountStruct getIDAmountStructIngredientFromHbox(HBox hBox) {
        //FORTSETT VIDERE PÅ AAAAAAAA
        String name = ((TextArea) getChildByIdInNodeStream(
                hBox.getChildren().stream(),
                "name-text-area"
        )).getText();

        if (name.isEmpty()) {
            return new IDAmountStruct();
        }

        float amount = Float.parseFloat(((Text) getChildByIdInNodeStream(
                hBox.getChildren().stream(),
                "amount-text"
        )).getText());

        return new IDAmountStruct(name, amount);
    }

    /**
     * Loads the recipe instructions pane with the provided name and instructions.
     *
     * @param name The name of the recipe.
     * @param instructions The instructions for preparing the recipe.
     */
    public void loadRecipeInstructionsPane(String name, String instructions,
                                            float defaultPortions,
                                            List<IDAmountStruct> ingredients) {

        subSceneRoot.getChildren().setAll(
                        recipeViewBuilder.getRecipeInstructionsPane(name, instructions,
                                defaultPortions, ingredients));
    }

    /**
     * Clears all recipes from the recipes pane.
     */
    public void clearRecipesPane() {
        recipesPane.getChildren().clear();
        initRecipePane();
    }

    /**
     * Clears all ingredients from the ingredients pane.
     */
    public void clearIngredientsPane() {
        ingredientsPane.getChildren().clear();
        initIngredientPane();
    }

    /**
     * Finds a recipe vbox with a given name, and removes it from the recipesPane.
     *
     * @param name name of a recipe.
     */
    public void removeRecipeFromRecipes(String name) {
        VBox masterContainer = (VBox) getChildByIdInNodeStream(
                recipesPane
                        .getChildren()
                        .stream(),
                "recipes-container"
        );

        masterContainer
                .getChildren().removeIf(
                        e -> Objects.equals(
                                e.getId(), "recipe-removable-" + name
                        )
                );
    }

    /**
     * Initializes the ingredients panel by setting it up with a Group component obtained from IngredientViewBuilder.
     * This method sets up the primary container for ingredient management in the user interface.
     */
    private void initIngredientPane() {
        ingredientsPane = ingredientViewBuilder.getIngredientsGroup();
    }

    /**
     * Adds an ingredient to the ingredients pane using the specified name, default amount, and unit.
     * This method constructs interactive components for adjusting amounts, adding to a list, and
     * managing the ingredient via edit and remove functionalities.
     *
     * @param name The name of the ingredient to be added.
     * @param defaultAmount The default amount of the ingredient, used for initial display and adjustments.
     * @param unit The unit of measurement for the ingredient (e.g., grams, liters).
     * @throws IllegalArgumentException If any of the parameters are invalid or if the ingredient cannot be added to the pane.
     */

    public void addIngredientToIngredientsPane(String name, float defaultAmount, String unit) throws IllegalArgumentException {

        VBox masterContainer = (VBox) getChildByIdInNodeStream(
            ingredientsPane.getChildren().stream(), "ingredient-container");

        VBox masterIngredientVbox = ingredientViewBuilder.getIngredientVbox(name, defaultAmount, unit);

        VBox ingredientVbox = (VBox) getChildByIdInNodeStream(
            masterIngredientVbox.getChildren().stream(), "ingredient-vbox");

        HBox titleEditButtonHbox = (HBox) getChildByIdInNodeStream(
            ingredientVbox.getChildren().stream(), "title-hbox");

        Text titleIngredientText = (Text) getChildByIdInNodeStream(
            titleEditButtonHbox.getChildren().stream(), "title-ingredient-text");

        HBox adjustAmountHbox = (HBox) getChildByIdInNodeStream(
            ingredientVbox.getChildren().stream(), "adjust-amount-hbox");

        HBox addTolistHbox = (HBox) getChildByIdInNodeStream(
            ingredientVbox.getChildren().stream(), "add-to-list-hbox");

        Text addAmountToList = (Text) getChildByIdInNodeStream(
            adjustAmountHbox.getChildren().stream(), "add-amount-to-list-text");

        Button plusButton = (Button) getChildByIdInNodeStream(
            adjustAmountHbox.getChildren().stream(), "plus-button");
        plusButton.setOnAction(e -> incrementDecrementIngredientAmountToList("+", addAmountToList));

        Button minusButton = (Button) getChildByIdInNodeStream(
            adjustAmountHbox.getChildren().stream(), "minus-button");
        minusButton.setOnAction(e -> incrementDecrementIngredientAmountToList("-", addAmountToList));

        Button addToListButton = (Button) getChildByIdInNodeStream(
            addTolistHbox.getChildren().stream(), "add-to-list-button");
        addToListButton.setOnAction(e -> addIngredientToListFromFridge(name, addAmountToList, defaultAmount));


        Label unitLabel = (Label) getChildByIdInNodeStream(
            adjustAmountHbox.getChildren().stream(), "ingredient-unit");

        HBox editRemoveHbox = (HBox) getChildByIdInNodeStream(
            ingredientVbox.getChildren().stream(), "edit-remove-hbox");

        Button editIngredientButton = (Button) getChildByIdInNodeStream(
            editRemoveHbox.getChildren().stream(), "edit-ingredient-button");
        editIngredientButton.setOnAction(e -> loadIngredientEditPane(name, defaultAmount, unit));

        Button removeButton = (Button) getChildByIdInNodeStream(
            editRemoveHbox.getChildren().stream(), "remove-button");
        removeButton.setOnAction(e -> mainController.RemoveIngredientFromRegistry(name));

        masterContainer.getChildren().add(masterIngredientVbox);
    }

    /**
     * Loads the editing pane for an ingredient to allow modification of its name, default amount, and unit.
     * This method constructs and displays a detailed editing interface with text areas for each
     * property and a save button.
     * Changes are committed when the save button is clicked.
     *
     * @param name The name of the ingredient to be edited.
     * @param defaultAmount The initial default amount of the ingredient, displayed for editing.
     * @param unit The unit of measurement for the ingredient (e.g., grams, liters).
     */
    private void loadIngredientEditPane(String name, float defaultAmount, String unit) {
        Group ingredientEditPane = ingredientViewBuilder.getIngredientEditPane(name, unit, defaultAmount);
        VBox masterContainer = (VBox) getChildByIdInNodeStream(
            ingredientEditPane.getChildren().stream(), "ingredient-edit-pane"
        );
        VBox nameUnitDefaultAmountVbox = (VBox) getChildByIdInNodeStream(
            masterContainer.getChildren().stream(), "name-unit-default-amount-vbox"
        );
        HBox nameLabelTextAreaHbox = (HBox) getChildByIdInNodeStream(
            nameUnitDefaultAmountVbox.getChildren().stream(), "name-label-text-area-hbox"
        );
        HBox unitLabelTextAreaHbox = (HBox) getChildByIdInNodeStream(
            nameUnitDefaultAmountVbox.getChildren().stream(), "unit-label-text-area-hbox"
        );
        HBox defaultAmountLabelTextAreaHbox = (HBox) getChildByIdInNodeStream(
            nameUnitDefaultAmountVbox.getChildren().stream(), "default-amount-label-text-area-hbox"
        );
        Button saveButton = (Button) getChildByIdInNodeStream(
            nameUnitDefaultAmountVbox.getChildren().stream(), "save-button"
        );
        TextArea nameTextArea = (TextArea) getChildByIdInNodeStream(
            nameLabelTextAreaHbox.getChildren().stream(), "name-text-area"
        );
        nameTextArea.textProperty().addListener((observable, oldValue, newValue) -> {
            nameTextArea.setText(newValue);
        });

        Label unitLabel = (Label) getChildByIdInNodeStream(
            unitLabelTextAreaHbox.getChildren().stream(), "unit-label"
        );
        TextArea unitTextArea = (TextArea) getChildByIdInNodeStream(
            unitLabelTextAreaHbox.getChildren().stream(), "unit-text-area"
        );
        Label defaultAmountLabel = (Label) getChildByIdInNodeStream(
            defaultAmountLabelTextAreaHbox.getChildren().stream(), "default-amount-label"
        );
        TextArea defaultAmountTextArea = (TextArea) getChildByIdInNodeStream(
            defaultAmountLabelTextAreaHbox.getChildren().stream(), "default-amount-text-area"
        );
        saveButton.setOnAction(e -> saveIngredient(nameTextArea, unitTextArea, defaultAmountTextArea));
        Label nameLabel = (Label) getChildByIdInNodeStream(
            nameLabelTextAreaHbox.getChildren().stream(), "name-label"
        );

        Scene scene = new Scene(ingredientEditPane);
        Stage editStage = new Stage();
        editStage.setTitle("Edit Ingredient");
        editStage.setScene(scene);
        editStage.show();
    }

    /**
     * Clears all the ingredients from the ingredient pane.
     * This method removes all child nodes from the ingredientsPane, effectively emptying the display.
     */
    public void clearIngredientPane() {
        ingredientsPane.getChildren().removeAll();
    }

    /**
     * Modifies the displayed ingredient amount by incrementing or decrementing it based on the operation specified.
     * This method adjusts the amount directly in the interface, allowing for immediate visual feedback.
     *
     * @param op The operation to perform, "+" to increment or "-" to decrement the amount.
     * @param text The text element displaying the amount of the ingredient.
     */
    private void incrementDecrementIngredientAmountToList(String op, Text text) {
        float i = Float.parseFloat(text.getText());
        if (op.equals("-") && i > 0) {
            i -= 1.0f;
        } else if (op.equals("+")){
            i += 1.0f;
        }
        text.setText(i + "");
    }

    /**
     * Removes a specific ingredient from the ingredients pane based on its name.
     * This method locates the ingredient container by ID and removes the specified ingredient if found.
     *
     * @param name The name of the ingredient to remove.
     */
    public void removeIngredientFromIngredients(String name) {
        VBox masterContainer = (VBox) getChildByIdInNodeStream(
            ingredientsPane
                .getChildren()
                .stream(),
            "ingredient-container"
        );

        masterContainer
            .getChildren().removeIf(
                e -> e.getId().equals("ingredient-removable-" + name)
            );
    }

    /**
     * Adds an item to the purchase plan.
     *
     * @param name The name of the item.
     * @param addAmountToList  The text field containing the amount to add to the purchase plan.
     * @param defaultAmount The default amount of the item.
     */
    private void addIngredientToListFromFridge(String name, Text addAmountToList, float defaultAmount) {
        AlertViewBuilder alertViewBuilder = new AlertViewBuilder();
        alertViewBuilder.showAlert("This amount is added to the shopping list: " + Float.parseFloat(addAmountToList.getText()));
        mainController.AddItemToPurchasePlan(new PurchasePlan(name, Float.parseFloat(addAmountToList.getText())));
        addAmountToList.setText(defaultAmount+"");
    }

    /**
     * Saves the modified details of an ingredient based on the inputs from text areas.
     * This method collects the name, unit, and default amount from the respective text areas
     * and updates the ingredient registry.
     *
     * @param name The text area containing the name of the ingredient.
     * @param unit The text area containing the unit of measurement of the ingredient.
     * @param defaultAmount The text area containing the default amount of the ingredient.
     */
    private void saveIngredient(TextArea name, TextArea unit, TextArea defaultAmount){
        String nameString = name.getText();
        String unitString = unit.getText();
        String defaultAmountString = defaultAmount.getText();
        mainController.EditIngredientInRegistry(new IDAmountStruct(nameString, Float.parseFloat(defaultAmountString)), unitString, new String[]{});
    }


    /**
     * Adds an item to the purchase plan.
     *
     * @param item The item to add.
     * @param unit The unit of the item.
     */
    public void addItemToPurchasePlan(IDAmountStruct item, String unit) {
        purchasePlanView.selectIngredient(item.name, item.amount, unit, item.amount);
    }

    /**
     * Gets subSceneRoot pane from the View and sets ingredientsPane as its content
     *
     * @param event  Action event of the button that calls the method
     * @throws IOException
     */
    @FXML
    private void loadIngredientsPane(ActionEvent event) throws IOException {
        subSceneRoot.getChildren().setAll(ingredientsPane);
    }


    /**
     * Gets subSceneRoot pane from the View and sets fridgePane as its content
     *
     * @param event Action event of the button that calls the method
     * @throws IOException if the pane cannot be loaded
     */
    @FXML
    private void loadFridgePane(ActionEvent event) throws IOException {
        subSceneRoot.getChildren().setAll(fridgePane);
    }


    /**
     * Gets subSceneRoot pane from the View and sets recipesPane as its content
     *
     * @param event Action event of the button that calls the method
     * @throws IOException if the pane cannot be loaded
     */
    @FXML
    private void loadRecipePane(ActionEvent event) throws IOException {
        subSceneRoot.getChildren().setAll(recipesPane);
    }


    /**
     * Method to create UI elements for ingredients or recipes
     *
     * @param items    Map of items to be displayed
     * @param container Container to hold the items
     */
    private void createUIElements(Map<String, PurchasePlanView.Detail> items, VBox container) {
        for (Map.Entry<String, PurchasePlanView.Detail> entry : items.entrySet()) {
            String itemName = entry.getKey();
            PurchasePlanView.Detail detail = entry.getValue();
            AtomicReference<Float> amount = new AtomicReference<>(detail.amount);
            String unit = detail.unit;
            float defaultAmount = detail.defaultAmount;

            Label nameLabel = new Label(itemName);
            Label amountLabel = new Label(" " + amount.get() + " ");
            Label unitLabel = new Label(" " + unit);

            Button decreaseButton = new Button("-");
            decreaseButton.setOnAction(decrease -> {
                amount.updateAndGet(v -> {
                    float newValue = v - defaultAmount;
                    return newValue < 0 ? 0 : newValue;
                });
                amountLabel.setText(" " + amount.get() + " ");
            });

            Button increaseButton = new Button("+");
            increaseButton.setOnAction(increase -> {
                amount.updateAndGet(v -> v + defaultAmount);
                amountLabel.setText(" " + amount.get() + " ");
            });

            HBox itemBox = new HBox(nameLabel, decreaseButton, amountLabel, increaseButton, unitLabel);
            container.getChildren().add(itemBox);
        }
    }

    /**
     * Toggles the visibility of the purchase plan.
     *
     * @param event Action event of the button that calls the method
     */
    @FXML
    public void togglePurchasePlan(ActionEvent event) {


        purchasePlanVisible = !purchasePlanVisible;

        if (purchasePlanVisible) {
            // Expand the purchase plan
            purchasePlanVBox.setPrefWidth(expandedWidth);
            greenStrip.setPrefWidth(expandedWidth);
            // Show inner VBox with headers and information
            purchasePlanInfoVBox.setVisible(true);
            purchasePlanHeaderText.setVisible(true);
            purchasePlanFooter.setVisible(true);
            //changes the background color style<
            purchasePlanHeader.setStyle("-fx-background-color: #396741; -fx-padding: 10px;");


        } else {
            // Collapse the purchase plan
            purchasePlanVBox.setPrefWidth(collapsedWidth);
            greenStrip.setPrefWidth(collapsedWidth);
            // Hide inner VBox with headers and information
            purchasePlanInfoVBox.setVisible(false);
            purchasePlanHeaderText.setVisible(false);
            purchasePlanFooter.setVisible(false);
            purchasePlanHeader.setStyle("-fx-background-color: #A6C857; -fx-padding: 10px;");

        }


        //Updates the visual purchase plan
        // Loop through the ingredients list and create labels
        updatePurchasePlanContent();

        // Call the method to create UI elements for ingredients
        createUIElements(purchasePlanView.getSelectedIngredient(), ingredientsBox);

        // Call the method to create UI elements for recipes
        createUIElements(purchasePlanView.getSelectedRecipe(), recipesBox);
    }


    /**
     * Clears all elements in the purchase plan.
     */
    private void updatePurchasePlanContent() {
        ingredientsBox.getChildren().clear();
        recipesBox.getChildren().clear();
    }


    /**
     * Creates a shopping list text for the purchase plan.
     *
     * @param items    Map of items to be displayed
     * @param container Container to hold the items
     */
    private void createShoppingListText(Map<String, PurchasePlanView.Detail> items, VBox container) {
        for (Map.Entry<String, PurchasePlanView.Detail> entry : items.entrySet()) {
            String itemName = entry.getKey();
            PurchasePlanView.Detail detail = entry.getValue();
            AtomicReference<Float> amount = new AtomicReference<>(detail.amount);
            String unit = detail.unit;

            Label nameLabel = new Label(itemName);
            Label amountLabel = new Label(" " + amount.get() + " ");
            Label unitLabel = new Label(" " + unit);

            HBox itemBox = new HBox(nameLabel, amountLabel, unitLabel);
            container.getChildren().add(itemBox);
        }
    }

    /**
     * Clears all elements in the purchase plan.
     */
    public void clearPurchasePlan() {
        purchasePlanView.clear();
        togglePurchasePlan(new ActionEvent());
        togglePurchasePlan(new ActionEvent());
    }

    /**
     * Calls controller to move the purchase plan to the fridge.
     *
     * @param event
     */
    @FXML
    public void addPurchasePlanToFridge(ActionEvent event) {
        mainController.MovePurchasePlanToFridge();
    }
    @FXML
    public void generateShoppingList(ActionEvent event) {
        // Create a new stage
        Stage shoppingListStage = new Stage();
        shoppingListStage.setTitle("Shopping List");

        shoppingListStage.setMinWidth(300);
        shoppingListStage.setMinHeight(200);
        shoppingListStage.setMaxWidth(600);
        shoppingListStage.setMaxHeight(400);

        // Create a VBox to hold the shopping list items
        VBox vBox = new VBox();

        // Create UI elements without buttons for selected ingredients and recipes
        createShoppingListText(purchasePlanView.getSelectedIngredient(), vBox);
        createShoppingListText(purchasePlanView.getSelectedRecipe(), vBox);

        // Create a button to close the window
        Button closeButton = new Button("Close");
        closeButton.setOnAction(e -> shoppingListStage.close());

        // Add the close button to an HBox
        HBox closeButtonBox = new HBox(closeButton);

        // Create a VBox to hold the shopping list items and the close button
        VBox root = new VBox(vBox, closeButtonBox);

        // Set the scene in the stage
        shoppingListStage.setScene(new Scene(root));

        // Show the stage
        shoppingListStage.show();
    }

    /**
     * Filters through a stream of children belonging to a node, and returns a single child by
     * given filter.
     *
     * @param stream stream of children to a node
     * @param childId id used to filter and find child
     * @return child Node-object
     * @throws IllegalArgumentException if there is no child-node of given id
     */
    private Node getChildByIdInNodeStream(Stream<Node> stream, String childId) throws IllegalArgumentException {

        return stream
                .filter(
                        e -> Objects.equals(
                                e.getId(), childId
                        )
                )
                .map(
                        node -> (Node) node
                )
                .findFirst()
                .orElseThrow(
                        () -> new IllegalArgumentException(
                                childId + "not found"
                        )
                );
    }

    /**
     * Loads a new stage with a given message.
     *
     * @param s message to be displayed
     */
    public void loadAlertWindow(String s) {
        alert.showAlert(s);
    }
}

