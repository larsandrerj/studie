package no.ntnu.idatt1005.controller;

import aj.org.objectweb.asm.Handle;
import java.util.logging.Logger;

import javafx.event.ActionEvent;
import no.ntnu.idatt1005.model.data.*;
import no.ntnu.idatt1005.model.data.entities.FridgeElement;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.data.entities.PurchasePlan;
import no.ntnu.idatt1005.model.data.entities.Recipe;
import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import no.ntnu.idatt1005.model.data.entities.Tag;
import no.ntnu.idatt1005.model.exceptions.ErrorCode;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.services.FridgeService;
import no.ntnu.idatt1005.model.services.IngredientService;
import no.ntnu.idatt1005.model.services.PurchasePlanService;
import no.ntnu.idatt1005.model.services.RecipeService;
import no.ntnu.idatt1005.model.services.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Intermediary layer that manages communication between the database layer and the GUI.
 * Some methods call methods in the view layer, while others are designed to be called by the view layer.
 */
@Component
public class MainController {
  private PageLoader pageLoader;
  private TagService tagService;
  private FridgeService fridgeService;
  private IngredientService ingredientService;
  private RecipeService recipeService;
  private PurchasePlanService purchasePlanService;
  @Autowired
  public MainController(TagService tagService, FridgeService fridgeService, IngredientService ingredientService, RecipeService recipeService, PurchasePlanService purchasePlanService) {
    this.tagService = tagService;
    this.fridgeService = fridgeService;
    this.ingredientService = ingredientService;
    this.recipeService = recipeService;
    this.purchasePlanService = purchasePlanService;
  }

  public MainController(){}

  public void init(PageLoader pl) {
    pageLoader = pl;
    GenerateTestData.FillDatabase(tagService, ingredientService, recipeService, fridgeService);
    LoadView();
  }

  public void start() {

  }

  /**
   * Clears and loads all visuals with up-to-date data from model
   */
  public void LoadView() {
    LoadFridge();
    //LoadPurchasePlan();
    LoadIngredientRegistry();
    LoadRecipeRegistry();
    //TODO - Tell view to close the purchase plan and show the fridge page?
  }

  /**
   * Adds all ingredients in the database to the fridge view
   */
  public void LoadFridge() {
    pageLoader.ClearFridge(); // Clear fridge view for cleanliness
    // Get all ingredients from fridge DB
    for (FridgeElement ing : fridgeService.findAllFridgeElements()) {
      HandleFridgeElementLoading(ing); // Load ingredient into fridge view
    }
  }

  /**
   * Handles loading of a fridge element into the fridge view
   *
   * @param ing The fridge element to load
   * @throws Error if the ingredient is not found in the database.
   *               This should never happen, as the ingredient should have been added to the fridge database before this method is called.
   *               This is different from AddToFridgeView, which might be called using user input, thus throwing an IllegalArgumentException instead.
   */
  private void HandleFridgeElementLoading(FridgeElement ing) throws Error {
    try {
      AddToFridgeView(ing);
    } catch (IllegalArgumentException e) {
      Logger logger = Logger.getLogger(MainController.class.getName());
      logger.severe("Ingredient retrieved from fridge DB not found in Ingredient Repository");
      throw new Error("Ingredient not found in database"); //Should have been prevented in fridge-add-logic.
    }
  }

  /**
   * Adds an ingredient to the fridge view
   *
   * @param ingredient The name and amount of the ingredient to add
   * @throws IllegalArgumentException if the ingredient is not found in the database
   */
  public void AddToFridgeView( FridgeElement ingredient ) throws IllegalArgumentException {
    // Retrieve ingredient from database for unit
    Optional<Ingredient> ingDB = ingredientService.getObjectFromDatabase(ingredient.name);
    if (ingDB.isEmpty()) {
      throw new IllegalArgumentException("Ingredient not found in database");
    }
    pageLoader.addToFridge(ingredient.name, String.valueOf(ingredient.amount), ingDB.get().getUnit());
  }

  /**
   * Adds an ingredient to the fridge database
   */
  public void LoadPurchasePlan() {
    pageLoader.clearPurchasePlan();
    Iterable<? extends IDAmountStruct> items = purchasePlanService.findAllPurchasePlans();
    while (items.iterator().hasNext()) {
      IDAmountStruct item = (IDAmountStruct) items.iterator().next();
      HandlePurchasePlanElementLoading(item);
    }
  }

  /**
   * Handles loading of a purchase plan element into the purchase plan view
   *
   * @param item The purchase plan element to load
   * @throws Error if the item is not found in the database.
   *               This should never happen, as the item should have been added to the purchase plan database before this method is called.
   *               This is different from AddToPurchasePlanView, which might be called using user input, thus throwing an IllegalArgumentException instead.
   */
  private void HandlePurchasePlanElementLoading(IDAmountStruct item) throws Error {
    try {
      AddToPurchasePlanView(item);
    } catch (IllegalArgumentException e) {
      Logger logger = Logger.getLogger(MainController.class.getName());
      logger.severe("Item retrieved from purchase plan DB not found in Ingredient Repository");
      throw new Error("Item not found in database"); //Should have been prevented in purchase-plan-add-logic.
    }
  }

  public void AddToPurchasePlanView( IDAmountStruct item ) {
    // Retrieve ingredient from database for unit
    Optional<? extends Item> itemDB = ingredientService.getObjectFromDatabase(item.name);
    if (itemDB.isEmpty()) {
      itemDB = recipeService.getObjectFromDatabase(item.name);
      if (itemDB.isEmpty()) {
        throw new IllegalArgumentException("Item not found in database");
      } else {
        System.out.println("Item is a recipe");
        pageLoader.addItemToPurchasePlan(item, Recipe.getUnit());
      }
    } else {
      System.out.println("Item is an ingredient");
      Ingredient ing = (Ingredient) itemDB.get();
      pageLoader.addItemToPurchasePlan(item, ing.getUnit());
    }
    pageLoader.togglePurchasePlan(new ActionEvent());
    pageLoader.togglePurchasePlan(new ActionEvent());
  }

  /**
   * Adds an item to the purchase plan database
   */
  public void LoadIngredientRegistry() {
    pageLoader.clearIngredientsPane();
    for (Ingredient ing : ingredientService.getAllObjectsFromDatabase()) {
      HandleIngredientRegistryLoading(ing);
    }
  }

  /**
   * Adds an ingredient to the ingredient registry view
   *
   * @param ingredient The ingredient to add
   */
  public void HandleIngredientRegistryLoading( Ingredient ingredient ) {
    pageLoader.addIngredientToIngredientsPane(ingredient.getName(), ingredient.getDefaultAmount(), ingredient.getUnit());
  }

  /**
   * Adds an ingredient to the ingredient registry view
   *
   * @param ingredient The ingredient to add
   * @throws IllegalArgumentException if the ingredient is not found in the database
   */
  public void AddToIngredientRegistryView( Ingredient ingredient ) throws IllegalArgumentException {
    if (ingredientService.getObjectFromDatabase(ingredient.getName()).isEmpty()) {
      throw new IllegalArgumentException("Ingredient not found in database");
    }
    HandleIngredientRegistryLoading(ingredient);
  }

  /**
   * Adds a recipe to the recipe database
   */
  public void LoadRecipeRegistry() {
    pageLoader.clearRecipesPane();
    for (Recipe recipe : recipeService.getAllObjectsFromDatabase()) {
      HandleRecipeRegistryLoading(recipe);
    }
  }


  /**
   * Loads the recipeAddPane in pageloader
   */
  public void LoadRecipeAddView() {
    pageLoader.loadRecipeAddPane();
  }

  /**
   * Loads the recipeAddPane in pageloader with given recipe name
   *
   * @param name Name of the recipe
   */
  public void LoadRecipeAddView(String name) {
    try {
      Recipe recipe = recipeService.getObjectFromDatabase(name).get();

      pageLoader.loadRecipeAddPane(
              recipe.getName(),
              recipe.getInstructions(),
              recipe.getDefaultAmount(),
              new ArrayList<IDAmountStruct>(recipe.getIngredients())
              );

    } catch (Exception e) {
      pageLoader.loadAlertWindow("Recipe " + name + " not found");
    }
  }

  /**
   * Loads the detailed recipe pane in pageloader
   *
   * @param name Name of the ingredient
   */
  public void LoadRecipeInstructionsView(String name) {
    try {
      Recipe recipe = recipeService.getObjectFromDatabase(name).get();

      pageLoader.loadRecipeInstructionsPane(
              recipe.getName(),
              recipe.getInstructions(),
              recipe.getDefaultAmount(),
              new ArrayList<IDAmountStruct>(recipe.getIngredients())
      );
    } catch (Exception e) {
      pageLoader.loadAlertWindow("Recipe " + name + " not found");
    }
  }

  /**
   * Checks if a given recipe exists in the database.
   *
   * @param name Name of the ingredient
   * @return True if the ingredient exists, false otherwise
   */
  public boolean IngredientExists(String name) {
    return ingredientService.getObjectFromDatabase(name).isPresent();
  }

  /**
   * Adds a recipe to the recipe registry view
   *
   * @param recipe The recipe to add
   */
  public void HandleRecipeRegistryLoading( Recipe recipe ) {
    pageLoader.addRecipeToRecipesPane(recipe.getName(), Recipe.getUnit(), String.valueOf((int) recipe.getDefaultAmount()), recipe.getInstructions());
  }

  /**
   * Adds a recipe to the recipe registry view
   *
   * @param recipe The recipe to add
   * @throws IllegalArgumentException if the recipe is not found in the database
   */
  public void AddToRecipeRegistryView( Recipe recipe ) throws IllegalArgumentException {
    if (recipeService.getObjectFromDatabase(recipe).isEmpty()) {
      throw new IllegalArgumentException("Recipe not found in database");
    }
    HandleRecipeRegistryLoading(recipe);
  }

  /**
   * Adds an ingredient to the ingredient registry
   *
   * @param ingredientInfo The name and amount of the ingredient
   * @param unit The unit of the ingredient
   * @param tags The tags of the ingredient
   * @throws Exception if the ingredient is not found in the database,
   *                   if the ingredient is a duplicate,
   *                   or if there is an error loading data from the view
   */
  public void AddIngredientToRegistry(IDAmountStruct ingredientInfo, String unit, String[] tags) {
    try {
      List<Tag> tagsList = GenerateTagsListFromDB(tags);
      Ingredient ing = new Ingredient(ingredientInfo.name, ingredientInfo.amount, unit, tagsList);
      ingredientService.saveObjectToDatabase(ing); // Throws ServiceException
      HandleIngredientRegistryLoading(ing); // Throws JavaFXException
    } catch (ServiceException e) {
      HandleServiceException(e);
    } catch (IllegalArgumentException e) {
      pageLoader.loadAlertWindow("Error loading data from view. You may try refreshing the view.");
    }
  }

  /**
   * Edits info about an ingredient in the database and reloads it in the view.
   *
   * @param ingredientInfo
   * @param unit
   * @param tags
   */
  public void EditIngredientInRegistry(IDAmountStruct ingredientInfo, String unit, String[] tags) {
    try {
      List<Tag> tagsList = GenerateTagsListFromDB(tags);
      Ingredient ing = new Ingredient(ingredientInfo.name, ingredientInfo.amount, unit, tagsList);
      ingredientService.updateObjectInDatabase(ing); // Throws ServiceException
      pageLoader.removeIngredientFromIngredients(ingredientInfo.name);
      HandleIngredientRegistryLoading(ing); // Throws JavaFXException
    } catch (ServiceException e) {
      HandleServiceException(e);
    } catch (IllegalArgumentException e) {
      pageLoader.loadAlertWindow("Error loading data from view. You may try refreshing the view.");
    }
  }

  /**
   * Edits info about a recipe in the database and reloads it in the view.
   *
   * @param recipeInfo The name and default portion amount of the recipe
   * @param ingredients The ingredients of the recipe
   * @param tags The tags of the recipe
   */
  public void EditRecipeInRegistry(IDAmountStruct recipeInfo, IDAmountStruct[] ingredients, String[] tags, String instructions) {
    ArrayList<RecipeIngredientElement> ingredientsList = new ArrayList<>();
    for (IDAmountStruct ingredient : ingredients) {
      ingredientsList.add(new RecipeIngredientElement(ingredient));
    }
    List<Tag> tagsList = GenerateTagsListFromDB(tags);
    Recipe recipe = new Recipe(recipeInfo.name, recipeInfo.amount, tagsList, ingredientsList, instructions);
    try {
      recipeService.updateObjectInDatabase(recipe);
    } catch (ServiceException e) {
      try {
        recipeService.saveObjectToDatabase(recipe);
      } catch (ServiceException d) {
        HandleServiceException(d);
      }
    }
    pageLoader.removeRecipeFromRecipes(recipeInfo.name);
    HandleRecipeRegistryLoading(recipe);
    pageLoader.loadAlertWindow("Recipe has been added");
  }

  /**
   * Takes a service exception and presents the proper information to the user.
   *
   * @param e The exception
   */
  public void HandleServiceException(ServiceException e) {
    String hint = " You may try refreshing the view.";
    if (e.getErrorCodeId() == ErrorCode.OBJECT_NOT_FOUND.getId()) {
      pageLoader.loadAlertWindow(e.getErrorCodeMessage() + " Object: " + e.getObjectName() + "(Tag)" + hint);
    } else if (e.getErrorCodeId() == ErrorCode.DUPLICATE_OBJECT_PASSED_TO_SERVICE.getId()) {
      pageLoader.loadAlertWindow(e.getErrorCodeMessage() + " Object: " + e.getObjectName() + "(Ingredient)" + hint);
    } else {
      pageLoader.loadAlertWindow(e.getErrorCodeMessage());
    }
  }

  /**
   * Generates a list of tags retrieved from the database based on the tag names.
   *
   * @param tags The names of the tags to retrieve
   * @return A list of tags retrieved from the database
   */
  private List<Tag> GenerateTagsListFromDB(String[] tags) {
    List<Tag> tagsList = new ArrayList<>();
    for (String tag : tags) {
      tagService.getObjectFromDatabase(tag).ifPresent(tagsList::add);
    }
    return tagsList;
  }

  /**
   * Adds a recipe to the recipe registry
   *
   * @param recipeInfo The name and default portion amount of the recipe
   * @param ingredients The ingredients of the recipe
   * @param tags The tags of the recipe
   * @param instructions The instructions of the recipe
   */
  public void AddRecipeToRegistry(IDAmountStruct recipeInfo, IDAmountStruct[] ingredients, String[] tags, String instructions) {
    ArrayList<RecipeIngredientElement> ingredientsList = new ArrayList<>();
    for (IDAmountStruct ingredient : ingredients) {
      ingredientsList.add(new RecipeIngredientElement(ingredient));
    }
    ArrayList<Tag> tagsList = new ArrayList<>();
    for (String tag : tags) {
      try {
        tagsList.add(tagService.getObjectFromDatabase(tag).get());
      } catch (ArrayIndexOutOfBoundsException e) {
        // TODO - Handle exception
      } catch (NoSuchElementException e) {
        // TODO - Handle exception
      }
    }
    Recipe recipe = new Recipe(recipeInfo.name, recipeInfo.amount, tagsList, ingredientsList, instructions);
    recipeService.saveObjectToDatabase(recipe);
    HandleRecipeRegistryLoading(recipe);
  }

  /**
   * Adds an amount of the given ingredient to the fridge
   *
   * @param ingredient The name and amount of the ingredient to add.
   */
  public void AddIngredientToFridge(IDAmountStruct ingredient) {
    Optional<FridgeElement> fetched = fridgeService.findFridgeElementByName(ingredient.name);
    if (fetched.isPresent()) {
      AlterFridgeIngredientAmount(new IDAmountStruct(ingredient.name, ingredient.amount + fetched.get().getAmount()));
    } else {
      try {
        fridgeService.saveFridgeElement((FridgeElement) ingredient);
        HandleFridgeElementLoading((FridgeElement) ingredient);
      } catch (ServiceException e) {
        //TODO - Handle exception
      } catch (NumberFormatException e) {
        //TODO - Handle exception
      }
    }
  }

  /**
   * Adds an amount of an ingredient or recipe to the purchase plan
   *
   * @param item The name and amount of the item to add.
   */
  public void AddItemToPurchasePlan(PurchasePlan item) {
    try {
      purchasePlanService.savePurchasePlan(item);
      System.out.println("Saved purchase plan to DB");
      HandlePurchasePlanElementLoading(item);
      System.out.println("Handled loading in view");
    } catch (ServiceException e) {
      //TODO - Handle exception
    } catch (NumberFormatException e) {
      //TODO - Handle exception
    }
  }

  /**
   * Sets the amount of a specific ingredient in the fridge
   * Can be used to alter amount, or remove if the new amount is 0
   *
   * @param ingredient The name of the ingredient to alter + the new amount
   * @throws IllegalArgumentException if a non-existant ingredient is attempted removed from the fridge.
   */
  public void AlterFridgeIngredientAmount ( IDAmountStruct ingredient )throws IllegalArgumentException  {
    if (ingredient.amount == 0) {
      try {
        fridgeService.deleteFridgeElement(new FridgeElement(ingredient.name, ingredient.amount));
      } catch (ServiceException e) {
        throw new IllegalArgumentException("Attempted to remove an ingredient that is not in the fridge.");
      }
    }
    try {
      fridgeService.updateFridgeElement(new FridgeElement(ingredient.name, ingredient.amount));
    } catch (IllegalArgumentException e) {
      fridgeService.saveFridgeElement((FridgeElement) ingredient);
    }
    // TODO: pageLoader.removeIngredientFromFridgePane(ingredient.name);
    pageLoader.addToFridge(ingredient.name, String.valueOf(ingredient.amount), ingredientService.getObjectFromDatabase(ingredient.name).get().getUnit());
  }

  /**
   * Sets the amount of a specific ingredient in the fridge
   * Can be used to alter amount, or remove if the new amount is 0
   *
   * @param item The name of the item to alter + the new amount
   * @throws IllegalArgumentException if a non-existent item is attempted removed from the purchase plan.
   */
  public void AlterPurchasePlanItemAmount( IDAmountStruct item ) {
    if (item.amount == 0) {
      try {
        purchasePlanService.deletePurchasePlan((PurchasePlan) item);
      } catch (ServiceException e) {
        throw new IllegalArgumentException("Attempted to remove an item not in the purchase plan");
      }
    }
    try {
      purchasePlanService.updatePurchasePlan((PurchasePlan) item);
    } catch (IllegalArgumentException e) {
      purchasePlanService.savePurchasePlan((PurchasePlan) item);
    }
  }

  /**
   * Converts all recipes in the purchase plan to ingredients and saves the updated purchase plan to the database
   */
  public void GenerateShoppingList() throws IllegalArgumentException {
    //Fetch all items in the purchase plan database
    ArrayList<PurchasePlan> items = new ArrayList<>();
    Iterable<PurchasePlan> fetchedPP = purchasePlanService.findAllPurchasePlans();
    for (PurchasePlan item : fetchedPP) {
      items.add(item);
    }

    //Iterate through all items in the purchase plan and break them into ingredients, summing up the amounts
    HashMap<String, Float> shoppingList = new HashMap<>();
    Optional<? extends Item> fetched;
    for (PurchasePlan item : items) {
      fetched = ingredientService.getObjectFromDatabase(item.name);
      if ( fetched.isPresent() ) {
        if (shoppingList.containsKey(item.name)) {
          float current = shoppingList.get(item.name);
          shoppingList.put(item.name, current + item.amount);
        } else {
          shoppingList.put(item.name, item.amount);
        }
      } else {
        fetched = recipeService.getObjectFromDatabase(item.name);
        if ( fetched.isPresent() ) {
          Recipe currentRecipe = (Recipe) fetched.get();
          for (IDAmountStruct ingredient : currentRecipe.getIngredients()) {
            float newAmount = ingredient.amount / currentRecipe.getDefaultAmount() * item.amount;
            if (shoppingList.containsKey(item.name)) {
              float current = shoppingList.get(item.name);
              shoppingList.put(item.name, current + newAmount);
            } else {
              shoppingList.put(item.name, newAmount);
            }
          }
        } else {
          throw new IllegalArgumentException("No ingredient or recipe exists with specified identifier.");
        }
      }
      //Delete the processed ingredient/recipe from the purchase plan.
      purchasePlanService.deletePurchasePlan(item);
    }

    //Save the shopping list to the purchase plan database
    shoppingList.forEach((key, value) -> {
      purchasePlanService.savePurchasePlan(new PurchasePlan(key, value));
    });
  }

  /**
   * Converts the purchase plan to a shopping list and reloades view.
   */
  public void ConvertPurchasePlanToShoppingList() {
    try {
      GenerateShoppingList();
    } catch (IllegalArgumentException e) {
      pageLoader.loadAlertWindow("There was an error generating the shopping list.");
      return;
    }
    pageLoader.clearPurchasePlan();
    LoadPurchasePlan();
    pageLoader.loadAlertWindow("The purchase plan has been converted to a shopping list.");
  }

  /**
   * Moves all items in the purchase plan to the fridge
   */
  public void MovePurchasePlanToFridge() {
    Iterable<PurchasePlan> fetchedPP = purchasePlanService.findAllPurchasePlans();
    for (PurchasePlan item : fetchedPP) {
      if (recipeService.getObjectFromDatabase(item.name).isPresent()) {
        pageLoader.loadAlertWindow("The purchase plan contains recipes. Please convert to shopping list before moving to fridge.");
        return;
      } else if (ingredientService.getObjectFromDatabase(item.name).isEmpty()) {
        pageLoader.loadAlertWindow("ERROR: The purchase plan contains ingredients items that don't exist in the database.");
      }
    }
    for (PurchasePlan item : fetchedPP) {
      FridgeElement itemFridge = new FridgeElement(item.name, item.amount);
      AddIngredientToFridge(itemFridge);
    }
    pageLoader.clearPurchasePlan();
    pageLoader.ClearFridge();
    LoadFridge();
  }

  /**
   * Moves a specific item in the purchase plan to the fridge
   *
   * @param name The name of the item to move to the fridge
   */
  public void MoveIngredientToFridge(String name) {
    Optional<PurchasePlan> fetched = purchasePlanService.findPurchasePlanByName(name);
    if(fetched.isEmpty()) {
      pageLoader.loadAlertWindow("The item is not in the purchase plan.");
      return;
    }
    PurchasePlan item = fetched.get();
    if (recipeService.getObjectFromDatabase(item.name).isPresent()) {
      pageLoader.loadAlertWindow("The item is a recipe. Please convert to shopping list before moving to fridge.");
      return;
    } else if (ingredientService.getObjectFromDatabase(item.name).isEmpty()) {
      pageLoader.loadAlertWindow("ERROR: The item doesn't exist in the database.");
    }
    AddIngredientToFridge(item);
    pageLoader.clearPurchasePlan();
    pageLoader.ClearFridge();
    LoadFridge();
  }

  /**
   * Removes an ingredient from the ingredient registry
   *
   * @param name The name of the ingredient to remove.
   */
  public void RemoveIngredientFromRegistry(String name) {
    try {
      ingredientService.removeObjectFromDatabase(ingredientService.getObjectFromDatabase(name).get());
      pageLoader.removeIngredientFromIngredients(name);
    } catch (Exception e) {
      pageLoader.loadAlertWindow("Error: ingredient could not be removed");
    }
  }

  /**
   * Removes an ingredient from the ingredient registry
   *
   * @param name The name of the ingredient to remove.
   */
  public void RemoveRecipeFromRegistry(String name) {
    try {
      recipeService.removeObjectFromDatabase(recipeService.getObjectFromDatabase(name).get());
      pageLoader.removeRecipeFromRecipes(name);
    } catch (Exception e) {
      pageLoader.loadAlertWindow("Error: recipe could not be removed");
    }
  }
}