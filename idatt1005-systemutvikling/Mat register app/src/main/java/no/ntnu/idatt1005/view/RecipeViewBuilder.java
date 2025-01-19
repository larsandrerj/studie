package no.ntnu.idatt1005.view;

import javafx.scene.Group;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import no.ntnu.idatt1005.model.data.IDAmountStruct;

import java.util.ArrayList;
import java.util.List;

/**
 * Class responsible for creating the content of all recipes in RecipesPane and content of a
 * specific recipe in RecipesPane.
 */
public class RecipeViewBuilder {
    public RecipeViewBuilder() {
    }

    /**
     * Method for getting the Group that is going to contain all the recipes.
     *
     * @return empty Group-object with id recipes-container
     */
    public Group getRecipesGroup() {
        VBox masterContainer = new VBox();
        masterContainer.setId("recipes-container");

        Button addButton = new Button("Add new recipe");
        addButton.setId("add-button");

        masterContainer.getChildren().add(addButton);

        return new Group(
                masterContainer
        );
    }

    /**
     * Method for creating a Vbox with the name and portion size of a recipe.
     * Includes buttons for adding and subtracting the amount to add the purchase plan, button
     * for adding to the purchase plan, as well as buttons for editing and viewing the recipe.
     *
     * @param name Title of the recipe.
     * @param defaultAmount Portion size of the recipe.
     * @return Vbox with the name and portion size of a recipe, with buttons to process it.
     */
    public VBox getRecipeVbox(String name, String defaultAmount) {
        Text title = new Text(name);

        Button viewButton = new Button("View");

        viewButton.setId(
                "view-recipe-instructions-button"
        );

        Button addToPurchasePlanButton = new Button("Add to list");

        Text addAmountToListAsText = new Text(defaultAmount);
        addAmountToListAsText
                .setId(
                        "add-amount-to-list-as-text"
                );

        Button plusButton = new Button("+");
        plusButton
                .setId("plus-button");
        plusButton.setOnAction(
                e -> {
                    addOrSubText("+", addAmountToListAsText);
                }
        );

        Button minusButton = new Button("-");
        minusButton
                .setId("minus-button");
        minusButton.setOnAction(
                e -> {
                    addOrSubText("-", addAmountToListAsText);
                }
        );


        HBox titleViewButtonHbox = new HBox(title, viewButton);

        titleViewButtonHbox
                .setId(
                        "title-view-button-hbox"
                );

        HBox addToPurchasePlanHbox = new HBox(
                minusButton,
                addAmountToListAsText,
                plusButton,
                addToPurchasePlanButton
        );

        addToPurchasePlanHbox
                .setId(
                        "add-to-purchase-plan-hbox"
                );

        Button editButton = new Button("Edit");
        editButton
                .setId(
                        "edit-button"
                );

        Button removeButton = new Button("Remove");
        removeButton
                .setId(
                        "remove-button"
                );

        HBox editRemoveHbox = new HBox(
                editButton,
                removeButton
        );

        editRemoveHbox
                .setId(
                        "edit-remove-hbox"
                );

        VBox recipeVbox = new VBox(
                titleViewButtonHbox,
                //description,
                addToPurchasePlanHbox,
                editRemoveHbox
        );
        recipeVbox.setId("recipe-vbox");

        VBox masterRecipeVbox = new VBox(
                recipeVbox
        );
        masterRecipeVbox.setId("recipe-removable-" + name);

        return masterRecipeVbox;
    }

    /**
     * Method for getting the Group with the information to a specific recipe. Contains the name
     * and instructions to a given recipe.
     *
     * @param name Title to the recipe.
     * @param instructions Instructions to the recipe.
     * @param defaultPortions portions that the recipe will create.
     * @param ingredients ingredients needed for the recipe.
     * @return Group-object with information to a recipe.
     */
    public Group getRecipeInstructionsPane(String name, String instructions, float defaultPortions,
                                  List<IDAmountStruct> ingredients) {
        Label nameLabel = new Label("Name: " + name);
        nameLabel.setId("recipe-name-label");

        Label portionLabel = new Label("Standard portion: " + defaultPortions);
        portionLabel.setId("portion-label");

        Label instructionsLabel = new Label("Instructions:");
        instructionsLabel.setId(
                "instructions-label"
        );

        Text instructionsText = new Text(instructions);
        instructionsText.setId(
                "recipe-instructions-text"
        );

        VBox namePortionInstructionsVbox = new VBox(
                nameLabel,
                portionLabel,
                instructionsLabel,
                instructionsText
        );

        namePortionInstructionsVbox.setId(
                "name-portion-instructions-vbox"
        );

        Group ingredientsGroup = createIngredientsGroup(ingredients, false);

        HBox namePortionDescriptionIngredients = new HBox(
                namePortionInstructionsVbox,
                ingredientsGroup
        );

        VBox masterContainer = new VBox(
                namePortionDescriptionIngredients
        );

        masterContainer.setId(
                "recipe-instructions-pane"
        );

        return new Group(
                masterContainer
        );
    }

    /**
     * Returns a Group-object with the editable textareas for the name of the recipe, portion
     * size, instructions and toggleable buttons for the ingredients.
     *
     * @param name Name of a recipe.
     * @param instructions Instructions to the recipe.
     * @param defaultPortions Portion size of the recipe.
     * @param ingredients ingredients that the recipe already contains.
     * @return Group with editable components to a Recipe.
     */
    public Group getRecipeAddPane(String name, String instructions, float defaultPortions,
                                  List<IDAmountStruct> ingredients) {
        Label nameLabel = new Label("Name: ");
        nameLabel.setId("name-label");
        TextArea nameTextArea = new TextArea(name);
        nameTextArea.setId("name-textarea");

        HBox nameLabelTextAreaHbox = new HBox(
                nameLabel,
                nameTextArea
        );

        nameLabelTextAreaHbox.setId(
                "name-label-textarea-hbox"
        );

        Label portionLabel = new Label("Standard portion: ");
        portionLabel.setId("portion-label");

        Text portionText = new Text(defaultPortions + "");
        portionText.setId("portion-text");

        Button minusButton = new Button("-");
        minusButton.setOnAction(e -> {addOrSubText("-", portionText);});
        Button plusButton = new Button("+");
        plusButton.setOnAction(e -> {addOrSubText("+", portionText);});



        HBox portionHbox = new HBox(
                portionLabel,
                minusButton,
                portionText,
                plusButton
        );

        portionHbox.setId("portion-hbox");

        Label instructionsLabel = new Label("Instructions:");
        instructionsLabel.setId(
                "instructions-label"
        );

        TextArea instructionsTextArea = new TextArea(instructions);
        instructionsTextArea.setId(
                "instructions-textarea"
        );

        VBox namePortionInstructionsVbox = new VBox(
                nameLabelTextAreaHbox,
                portionHbox,
                instructionsLabel,
                instructionsTextArea
        );

        namePortionInstructionsVbox.setId(
                "name-portion-instructions-vbox"
        );

        Group ingredientsGroup = createIngredientsGroup(ingredients,
                true);

        ingredientsGroup.setId("ingredients-group");

        HBox namePortionDescriptionIngredients = new HBox(
                namePortionInstructionsVbox,
                ingredientsGroup
        );

        namePortionDescriptionIngredients.setId(
                "name-portion-description-ingredients"
        );

        Button addButton = new Button("Add / Update");
        addButton.setId(
                "recipe-add-button"
        );


        VBox masterContainer = new VBox(
                namePortionDescriptionIngredients,
                addButton
        );

        masterContainer.setId(
                "recipe-add-pane"
        );

        return new Group(
                masterContainer
        );
    }

    private Group createIngredientsGroup() {
        List<IDAmountStruct> ingredients = new ArrayList<>();

        return createIngredientsGroup(ingredients, false);
    }

    /**
     * Creates a Group-object with a list of all ingredients in a recipe.
     * Each ingredient has a designated radio-button to show if it selected in the recipe, in
     * addition to having an amount-value to describe how much of an ingredient is in the recipe.
     *
     * @param ingredients List of ingredients used to create the ingredients Group-object.
     * @param isSelectable Boolean to decide if the buttons to handle ingredients are to be shown
     *                    or not.
     * @return Group with selectable buttons for each ingredient.
     */
    private Group createIngredientsGroup(List<IDAmountStruct> ingredients,
                                         Boolean isSelectable) {
        VBox master = new VBox();
        master.setId("recipe-ingredients-master");
        VBox ingredientsVbox = new VBox();
        ingredientsVbox.setId("recipe-ingredients-vbox");

        if (isSelectable) {
            ingredients.forEach(
                    e -> {
                        ingredientsVbox
                                .getChildren()
                                .add(
                                        getIngredientAddArea(
                                                e.getName(), e.getAmount()
                                        )
                                );
                    }
            );

            Button addNewIngredientButton = new Button("Add new ingredient");
            addNewIngredientButton.setOnAction(
                    e -> {
                        ingredientsVbox
                                .getChildren()
                                .add(
                                        getIngredientAddArea()
                                );
                    }
            );

            master.getChildren().add(addNewIngredientButton);



        } else {
            ingredients.forEach(
                    e -> {

                        HBox hBox = new HBox(
                                new Text(e.getName() + " x " + e.getAmount())
                        );

                        hBox.setId(
                                "ingredient-text"
                        );

                        ingredientsVbox
                                .getChildren()
                                .add(
                                        hBox
                                );
                    }
            );
        }

        master.getChildren().add(ingredientsVbox);
        return new Group(master);
    }


    /**
     * Method to create an Hbox that contains an empty textarea and an amount-counter that is 0
     *
     * @return
     */
    private HBox getIngredientAddArea() {
        return getIngredientAddArea("", 0 );
    }


    /**
     * Method to create an HBox that contains a textarea that may be filled with a predisposed
     * name of an ingredient, and a amount-counter that can be incremented with + and - buttons
     * besides it.
     *
     * @param name name of a predisposed ingredient.
     * @param amount amount of said ingredient in a recipe.
     * @return HBox with textarea with the name of an ingredient, and an amount-counter.
     */
    private HBox getIngredientAddArea(String name, float amount) {
        HBox ingredientAddAreaHBox = new HBox();
        ingredientAddAreaHBox.setId(
                "ingredient-add-area-hbox"
        );

        TextArea nameTextArea = new TextArea(name);
        nameTextArea.setId(
                "name-text-area"
        );
        nameTextArea.setMaxHeight(50);

        Text amountText = new Text(amount + "");
        amountText.setId(
                "amount-text"
        );
        Button minusButton = new Button("-");
        minusButton.setOnAction(
                e -> {
                    addOrSubText("-", amountText);
                }
        );

        Button plusButton = new Button("+");
        plusButton.setOnAction(
                e -> {
                    addOrSubText("+", amountText);
                }
        );

        ingredientAddAreaHBox
                .getChildren()
                .addAll(
                        new Text("name: "),
                        nameTextArea,
                        new Text("amount: "),
                        minusButton,
                        amountText,
                        plusButton
                );


        return ingredientAddAreaHBox;

    }

    /**
     * Method that increments or decrements an int or float in a Text-object.
     *
     * @param op operation to be imposed on the Text int/float-value.
     * @param text Text that will be incremented of decremented.
     */
    private void addOrSubText(String op, Text text) {
        float f = 0.0f;

        try {
            f = Float.parseFloat(text.getText());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }


        if (op.equals("-") && f > 0) {
            f--;
        } else if (op.equals("+")){
            f++;
        }

        if (f == (int) f) {
            text.setText((int) f + "");
        } else {
            text.setText(f + "");
        }


    }
}
