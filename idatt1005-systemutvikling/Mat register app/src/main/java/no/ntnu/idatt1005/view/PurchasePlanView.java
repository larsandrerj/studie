package no.ntnu.idatt1005.view;

import java.util.HashMap;

/**
 * Represents the view model for managing purchase plans of ingredients and recipes.
 * This class manages selections of ingredients and recipes, storing details about each selection.
 */

public class PurchasePlanView {

  /**
   * Inner class to hold detailed information about an ingredient or recipe.
   */

  public class Detail {
    public float amount;
    public String unit;
    public float defaultAmount;

    /**
     * Constructs a new detail instance for an ingredient or recipe.
     *
     * @param amount The amount needed.
     * @param unit The unit of measurement.
     * @param defaultAmount The default amount usually required.
     */
    public Detail(float amount, String unit, float defaultAmount) {
      this.amount = amount;
      this.unit = unit;
      this.defaultAmount = defaultAmount;
    }
  }

  private HashMap<String, Detail> selectedIngredients;
  private HashMap<String, Detail> selectedRecipes;

  /**
   * Initializes a new PurchasePlanView instance with empty selections for ingredients and recipes.
   */
  public PurchasePlanView() {
    this.selectedIngredients = new HashMap<>();
    this.selectedRecipes = new HashMap<>();
  }

  public void clear() {
    this.selectedIngredients.clear();
    this.selectedRecipes.clear();
  }

  public void selectIngredient(String ingredientName, float amount, String unit, float defaultAmount) {
    this.selectedIngredients.put(ingredientName, new Detail(amount, unit, defaultAmount));
  }

  /**
   * Selects a recipe and records its details.
   *
   * @param recipeName The name of the recipe.
   * @param amount The amount required (in terms of portions).
   * @param unit The unit of measurement for the recipe output (e.g., portions).
   * @param defaultAmount The default serving size of the recipe.
   */

  public void selectRecipe(String recipeName, float amount, String unit, float defaultAmount) {
    this.selectedRecipes.put(recipeName, new Detail(amount, unit, defaultAmount));
  }

  /**
   * Returns a map of the selected ingredients with their details.
   *
   * @return A HashMap where the key is the ingredient name and the value is the corresponding Detail instance.
   */

  public HashMap<String, Detail> getSelectedIngredient() {
    return selectedIngredients;
  }

  /**
   * Returns a map of the selected recipes with their details.
   *
   * @return A HashMap where the key is the recipe name and the value is the corresponding Detail instance.
   */

  public HashMap<String, Detail> getSelectedRecipe() {
    return selectedRecipes;
  }

}