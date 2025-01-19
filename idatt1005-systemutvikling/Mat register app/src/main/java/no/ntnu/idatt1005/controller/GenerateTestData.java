package no.ntnu.idatt1005.controller;

import no.ntnu.idatt1005.model.data.entities.FridgeElement;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.data.entities.Recipe;
import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import no.ntnu.idatt1005.model.data.entities.Tag;
import no.ntnu.idatt1005.model.services.FridgeService;
import no.ntnu.idatt1005.model.services.IngredientService;
import no.ntnu.idatt1005.model.services.RecipeService;
import no.ntnu.idatt1005.model.services.TagService;

import java.util.*;

/**
 * Class for generating test data for the database.
 */
public abstract class GenerateTestData {
  /**
   * Fills the database with realistic test data.
   *
   * @param ts TagService
   * @param is IngredientService
   * @param rs RecipeService
   * @param fs FridgeService
   */
  public static void FillDatabase(TagService ts, IngredientService is, RecipeService rs, FridgeService fs) {
    FillDatabaseWithTags(ts);
    FillDatabaseWithIngredients(ts, is);
    FillDatabaseWithRecipes(ts, rs);
    FillDatabaseWithFridgeElements(fs);
  }

  /**
   * Fills the database with tags
   *
   * @param ts TagService
   */
  private static void FillDatabaseWithTags(TagService ts) {
    // Budget
    ts.saveObjectToDatabase(new Tag("expensive", "cost"));
    ts.saveObjectToDatabase(new Tag("budget-friendly", "cost"));

    // Preparation time
    ts.saveObjectToDatabase(new Tag("quick", "preparation time"));
    ts.saveObjectToDatabase(new Tag("long", "preparation time"));
    ts.saveObjectToDatabase(new Tag("slow cook", "preparation time"));

    // Difficulty
    ts.saveObjectToDatabase(new Tag("easy", "difficulty"));
    ts.saveObjectToDatabase(new Tag("medium", "difficulty"));
    ts.saveObjectToDatabase(new Tag("hard", "difficulty"));
    ts.saveObjectToDatabase(new Tag("very hard", "difficulty"));

    // Allergens
    ts.saveObjectToDatabase(new Tag("gluten", "allergen"));
    ts.saveObjectToDatabase(new Tag("dairy", "allergen"));
    ts.saveObjectToDatabase(new Tag("nuts", "allergen"));
    ts.saveObjectToDatabase(new Tag("seafood", "allergen"));
    ts.saveObjectToDatabase(new Tag("soy", "allergen"));

    //Health
    ts.saveObjectToDatabase(new Tag("healthy", "health"));
    ts.saveObjectToDatabase(new Tag("unhealthy", "health"));

    // Nutrition
    ts.saveObjectToDatabase(new Tag("high-protein", "nutrition"));
    ts.saveObjectToDatabase(new Tag("heart-healthy", "nutrition"));
    ts.saveObjectToDatabase(new Tag("low-calorie", "nutrition"));
    ts.saveObjectToDatabase(new Tag("high-calorie", "nutrition"));
    ts.saveObjectToDatabase(new Tag("low-carb", "nutrition"));
    ts.saveObjectToDatabase(new Tag("high-carb", "nutrition"));
    ts.saveObjectToDatabase(new Tag("low-fat", "nutrition"));
    ts.saveObjectToDatabase(new Tag("high-fat", "nutrition"));
    ts.saveObjectToDatabase(new Tag("low-sugar", "nutrition"));
    ts.saveObjectToDatabase(new Tag("high-sugar", "nutrition"));
    ts.saveObjectToDatabase(new Tag("protein", "nutrition"));
    ts.saveObjectToDatabase(new Tag("lean", "nutrition"));
    ts.saveObjectToDatabase(new Tag("omega-3", "nutrition"));

    // Diets
    ts.saveObjectToDatabase(new Tag("vegetarian", "dietary restriction"));
    ts.saveObjectToDatabase(new Tag("vegan", "dietary restriction"));

    // Seasonality
    ts.saveObjectToDatabase(new Tag("seasonal", "availability"));
    ts.saveObjectToDatabase(new Tag("year-round", "availability"));

    ts.saveObjectToDatabase(new Tag("tropical", "availability"));
    ts.saveObjectToDatabase(new Tag("grain", "category"));
    ts.saveObjectToDatabase(new Tag("staple", "category"));
    ts.saveObjectToDatabase(new Tag("fiber", "category"));
    ts.saveObjectToDatabase(new Tag("legume", "category"));
    ts.saveObjectToDatabase(new Tag("baking", "category"));
    ts.saveObjectToDatabase(new Tag("seasoning", "category"));
    ts.saveObjectToDatabase(new Tag("milk", "category"));
    ts.saveObjectToDatabase(new Tag("cheese", "category"));
    ts.saveObjectToDatabase(new Tag("yogurt", "category"));
    ts.saveObjectToDatabase(new Tag("butter", "category"));
    ts.saveObjectToDatabase(new Tag("oil", "category"));
    ts.saveObjectToDatabase(new Tag("cooking oil", "category"));
    ts.saveObjectToDatabase(new Tag("olive oil", "category"));
    ts.saveObjectToDatabase(new Tag("vegetable oil", "category"));
    ts.saveObjectToDatabase(new Tag("coconut oil", "category"));

    // North America
    ts.saveObjectToDatabase(new Tag("United States", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Canada", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Mexico", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Panama", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Haiti", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Jamaica", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Peru", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Dominican Republic", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Cuba", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Greenland", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("El Salvador", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Puerto Rico", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Colombia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Venezuela", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Honduras", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Guyana", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Guatemala", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Bolivia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Argentina", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Ecuador", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Chile", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Brazil", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Costa Rica", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Belize", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Nicaragua", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Bahamas", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Trinidad and Tobago", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Paraguay", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Uruguay", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Suriname", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("French Guiana", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Barbados", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Guam", "Cuisine"));

    // Europe
    ts.saveObjectToDatabase(new Tag("Norway", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Sweden", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Iceland", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Finland", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Germany", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Switzerland", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Austria", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Czech Republic", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Italy", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Turkey", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Greece", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Poland", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Romania", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Scotland", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Albania", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Ireland", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Russia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Oman", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Bulgaria", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Saudi Arabia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Hungary", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Cyprus", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Iraq", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Iran", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Syria", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Lebanon", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Israel", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Jordan", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Yemen", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Kuwait", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Bahrain", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Netherlands", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Luxembourg", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Belgium", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Portugal", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("France", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("England", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Denmark", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Spain", "Cuisine"));

    // Asia
    ts.saveObjectToDatabase(new Tag("India", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Pakistan", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Myanmar (Burma)", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Afghanistan", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Thailand", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Nepal", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Bhutan", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Cambodia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Malaysia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Bangladesh", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("China", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("South Korea", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Japan", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Mongolia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Laos", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Tibet", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Indonesia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Philippines", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Taiwan", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Sri Lanka", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("New Guinea", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Sumatra", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Borneo", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Vietnam", "Cuisine"));

    // Africa
    ts.saveObjectToDatabase(new Tag("Tunisia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Morocco", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Uganda", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Angola", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Zimbabwe", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Djibouti", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Botswana", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Mozambique", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Zambia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Swaziland", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Gambia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Guinea", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Algeria", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Ghana", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Burundi", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Lesotho", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Malawi", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Togo", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Niger", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Nigeria", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Chad", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Liberia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Egypt", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Benin", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Gabon", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Tanzania", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Somalia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Kenya", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Mali", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Sierra Leone", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Ethiopia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Guinea-Bissau", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Madagascar", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Rwanda", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Comoros", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Mauritania", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Transylvania", "Cuisine"));

    // Oceania
    ts.saveObjectToDatabase(new Tag("Fiji", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Australia", "Cuisine"));
    ts.saveObjectToDatabase(new Tag("Sudan", "Cuisine"));
  }

  /**
   * Generates a list of tags fetched from the database based on String names.
   *
   * @param ts TagService
   * @param tags List of tags
   * @return List of tags
   */
  private static List<Tag> GenerateTagsListFromDB(TagService ts, String[] tags) {
    List<Tag> tagsList = new ArrayList<>();
    for (String tag : tags) {
      ts.getObjectFromDatabase(tag).ifPresent(tagsList::add);
    }
    return tagsList;
  }

  /**
   * Fills the database with recipes
   *
   * @param ts TagService
   * @param is IngredientService
   */
  private static void FillDatabaseWithIngredients(TagService ts, IngredientService is) {
    // Vegetables
    is.saveObjectToDatabase(new Ingredient("Tomato", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Lettuce", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Carrot", 100, "grams",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "high-vitamin"})));
    is.saveObjectToDatabase(new Ingredient("Cucumber", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "low-calorie", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Bell Pepper", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "high-vitamin", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Spinach", 100, "grams",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "high-vitamin", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Broccoli", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "high-vitamin", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Zucchini", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "low-calorie", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Mushroom", 100, "grams",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "low-calorie", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Cauliflower", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "high-vitamin", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Onion", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "staple", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Red Onion", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "staple", "seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Ginger", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "seasonal"})));

    // Fruits
    is.saveObjectToDatabase(new Ingredient("Apple", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Banana", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"tropical"})));
    is.saveObjectToDatabase(new Ingredient("Orange", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"seasonal", "citrus"})));
    is.saveObjectToDatabase(new Ingredient("Grapes", 100, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Strawberry", 100, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Pineapple", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"tropical"})));
    is.saveObjectToDatabase(new Ingredient("Watermelon", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Kiwi", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Peach", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"seasonal"})));
    is.saveObjectToDatabase(new Ingredient("Mango", 1, "pcs",
        GenerateTagsListFromDB(ts, new String[]{"tropical"})));

    // Meat
    is.saveObjectToDatabase(new Ingredient("Chicken Breast", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"protein", "lean"})));
    is.saveObjectToDatabase(new Ingredient("Beef Steak", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"protein"})));
    is.saveObjectToDatabase(new Ingredient("Pork Chop", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"protein"})));
    is.saveObjectToDatabase(new Ingredient("Salmon Fillet", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"protein", "omega-3"})));
    is.saveObjectToDatabase(new Ingredient("Tofu", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"vegetarian", "protein"})));
    is.saveObjectToDatabase(new Ingredient("Shrimp", 100, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seafood", "protein"})));
    is.saveObjectToDatabase(new Ingredient("Ground Turkey", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"protein", "lean"})));
    is.saveObjectToDatabase(new Ingredient("Lamb Chop", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"protein"})));
    is.saveObjectToDatabase(new Ingredient("Duck Breast", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"protein"})));
    is.saveObjectToDatabase(new Ingredient("Venison", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"protein", "lean"})));

    // Dry goods
    is.saveObjectToDatabase(new Ingredient("Rice", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"grain", "staple"})));
    is.saveObjectToDatabase(new Ingredient("Pasta", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"grain", "staple"})));
    is.saveObjectToDatabase(new Ingredient("Spaghetti", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"grain", "staple"})));
    is.saveObjectToDatabase(new Ingredient("Quinoa", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"grain"})));
    is.saveObjectToDatabase(new Ingredient("Oats", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"grain", "fiber"})));
    is.saveObjectToDatabase(new Ingredient("Couscous", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"grain"})));
    is.saveObjectToDatabase(new Ingredient("Lentils", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"legume", "protein"})));
    is.saveObjectToDatabase(new Ingredient("Beans", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"legume", "protein"})));
    is.saveObjectToDatabase(new Ingredient("Chickpeas", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"legume", "protein"})));
    is.saveObjectToDatabase(new Ingredient("Flour", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"baking", "staple"})));
    is.saveObjectToDatabase(new Ingredient("Breadcrumbs", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"baking"})));
    is.saveObjectToDatabase(new Ingredient("Sugar", 200, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));

    // Herbs
    is.saveObjectToDatabase(new Ingredient("Basil", 2, "leaves",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Parsley", 2, "leaves",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Cilantro", 2, "leaves",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));

    // spices
    is.saveObjectToDatabase(new Ingredient("Salt", 5, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Black Pepper", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Garlic Powder", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Garlic", 1, "cloves",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Onion Powder", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Paprika", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Cumin", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Cinnamon", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Chili Powder", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Curry Powder", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Oregano", 2, "grams",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Lemon Juice", 20, "ml",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));
    is.saveObjectToDatabase(new Ingredient("Soy Sauce", 30, "ml",
        GenerateTagsListFromDB(ts, new String[]{"seasoning"})));

    // Dairy
    is.saveObjectToDatabase(new Ingredient("Milk", 250, "ml",
        GenerateTagsListFromDB(ts, new String[]{"dairy", "milk"})));
    is.saveObjectToDatabase(new Ingredient("Cheddar Cheese", 100, "grams",
        GenerateTagsListFromDB(ts, new String[]{"dairy", "cheese"})));
    is.saveObjectToDatabase(new Ingredient("Greek Yogurt", 150, "grams",
        GenerateTagsListFromDB(ts, new String[]{"dairy", "yogurt"})));
    is.saveObjectToDatabase(new Ingredient("Butter", 50, "grams",
        GenerateTagsListFromDB(ts, new String[]{"dairy", "butter"})));
    is.saveObjectToDatabase(new Ingredient("Cream", 100, "ml",
        GenerateTagsListFromDB(ts, new String[]{"dairy"})));

    // Oils
    is.saveObjectToDatabase(new Ingredient("Olive Oil", 50, "ml",
        GenerateTagsListFromDB(ts, new String[]{"oil", "cooking oil", "olive oil"})));
    is.saveObjectToDatabase(new Ingredient("Vegetable Oil", 50, "ml",
        GenerateTagsListFromDB(ts, new String[]{"oil", "cooking oil", "vegetable oil"})));
    is.saveObjectToDatabase(new Ingredient("Coconut Oil", 50, "ml",
        GenerateTagsListFromDB(ts, new String[]{"oil", "cooking oil", "coconut oil"})));
    is.saveObjectToDatabase(new Ingredient("Sesame Oil", 50, "ml",
        GenerateTagsListFromDB(ts, new String[]{"oil", "cooking oil"})));
    is.saveObjectToDatabase(new Ingredient("Canola Oil", 50, "ml",
        GenerateTagsListFromDB(ts, new String[]{"oil", "cooking oil"})));
  }

  private static void FillDatabaseWithRecipes(TagService ts, RecipeService rs) {
    rs.saveObjectToDatabase(new Recipe("Spaghetti Carbonara", 4.0f,
        GenerateTagsListFromDB(ts, new String[]{"quick", "budget-friendly", "easy"}),
        new ArrayList<>(){{
          add(new RecipeIngredientElement("Spaghetti", 200));
          add(new RecipeIngredientElement("Olive Oil", 50));
          add(new RecipeIngredientElement("Tomato", 4));
          add(new RecipeIngredientElement("Salt", 5));
          add(new RecipeIngredientElement("Black Pepper", 2));
          add(new RecipeIngredientElement("Garlic", 2));
        }}, "1. Add spaghetti to boiling water and cook for 10 minutes.\n" +
        "2. Heat olive oil in a pan and add chopped garlic.\n" +
        "3. Add chopped tomatoes and cook for 5 minutes.\n" +
        "4. Add cooked spaghetti to the pan and mix well.\n" +
        "5. Season with salt and pepper."));
    rs.saveObjectToDatabase(new Recipe("Grilled Chicken Salad", 2.0f,
        GenerateTagsListFromDB(ts, new String[]{"quick", "healthy", "easy"}), // Tags
        new ArrayList<>(){{
          add(new RecipeIngredientElement("Chicken Breast", 200)); // Ingredients
          add(new RecipeIngredientElement("Lettuce", 100));
          add(new RecipeIngredientElement("Tomato", 1));
          add(new RecipeIngredientElement("Cucumber", 1));
          add(new RecipeIngredientElement("Red Onion", 0.5f));
          add(new RecipeIngredientElement("Olive Oil", 30));
          add(new RecipeIngredientElement("Lemon Juice", 20));
          add(new RecipeIngredientElement("Salt", 3));
          add(new RecipeIngredientElement("Black Pepper", 1));
        }},
        "1. Season chicken breast with salt and pepper, then grill until cooked.\n" + // Preparation steps
            "2. Chop lettuce, tomato, cucumber, and red onion.\n" +
            "3. Slice grilled chicken breast.\n" +
            "4. Mix all ingredients in a bowl.\n" +
            "5. Drizzle olive oil and lemon juice over the salad, toss to combine."));
    rs.saveObjectToDatabase(new Recipe("Vegetable Stir-Fry", 4.0f,
        GenerateTagsListFromDB(ts, new String[]{"quick", "vegetarian", "easy"}), // Tags
        new ArrayList<>(){{
          add(new RecipeIngredientElement("Broccoli", 200)); // Ingredients
          add(new RecipeIngredientElement("Carrot", 100));
          add(new RecipeIngredientElement("Bell Pepper", 1));
          add(new RecipeIngredientElement("Onion", 1));
          add(new RecipeIngredientElement("Garlic", 2));
          add(new RecipeIngredientElement("Ginger", 1));
          add(new RecipeIngredientElement("Soy Sauce", 30));
          add(new RecipeIngredientElement("Sesame Oil", 10));
          add(new RecipeIngredientElement("Rice", 100));
        }},
        "1. Cook rice according to package instructions.\n" + // Preparation steps
            "2. Heat sesame oil in a large skillet or wok over medium-high heat.\n" +
            "3. Add minced garlic and ginger, stir for 30 seconds.\n" +
            "4. Add chopped vegetables (broccoli, carrot, bell pepper, onion) and stir-fry for 5-7 minutes.\n" +
            "5. Add soy sauce and stir to combine.\n" +
            "6. Serve stir-fried vegetables over cooked rice."));
    rs.saveObjectToDatabase(new Recipe("Tomato Basil Pasta", 4.0f,
        GenerateTagsListFromDB(ts, new String[]{"quick", "vegetarian", "easy"}), // Tags
        new ArrayList<>(){{
          add(new RecipeIngredientElement("Pasta", 200)); // Ingredients
          add(new RecipeIngredientElement("Tomato", 2));
          add(new RecipeIngredientElement("Garlic", 2));
          add(new RecipeIngredientElement("Olive Oil", 30));
          add(new RecipeIngredientElement("Basil", 20));
          add(new RecipeIngredientElement("Salt", 5));
          add(new RecipeIngredientElement("Black Pepper", 2));
        }},
        "1. Cook pasta according to package instructions.\n" + // Preparation steps
            "2. Heat olive oil in a pan over medium heat.\n" +
            "3. Add minced garlic and sauté for 1-2 minutes.\n" +
            "4. Add chopped tomatoes and cook for 5 minutes.\n" +
            "5. Season with salt and pepper.\n" +
            "6. Add cooked pasta to the pan and toss to combine.\n" +
            "7. Garnish with chopped fresh basil before serving."));
  }

  /**
   * Fills the database with fridge elements
   *
   * @param fs FridgeService
   */
  private static void FillDatabaseWithFridgeElements(FridgeService fs) {
    fs.saveFridgeElement(new FridgeElement("Carrot", 100.0f));
    fs.saveFridgeElement(new FridgeElement("Broccoli", 400.0f));
    fs.saveFridgeElement(new FridgeElement("Olive Oil", 100.0f));
  }
}