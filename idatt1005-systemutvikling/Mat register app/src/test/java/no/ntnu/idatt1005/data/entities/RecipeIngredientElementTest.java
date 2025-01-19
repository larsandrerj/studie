package no.ntnu.idatt1005.data.entities;

import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import no.ntnu.idatt1005.model.data.entities.Recipe;
import no.ntnu.idatt1005.model.data.entities.Tag;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class RecipeIngredientElementTest {
  @Nested
  class PositiveTests {
    @Test
    void testConstructor() {
      ArrayList<Tag> testTags = new ArrayList<>();
      testTags.add(new Tag("Healthy", "Health"));
      testTags.add(new Tag("Dinner", "Meal"));
      List<RecipeIngredientElement> testRecipeIngredients = Arrays.asList(
          new RecipeIngredientElement("banana", 2.0f),
          new RecipeIngredientElement("apple", 3.0f),
          new RecipeIngredientElement("orange", 4.0f)
      );
      Recipe testRecipe = new Recipe("Test", 2, testTags, testRecipeIngredients, "Step 1: Lorem ipsum");
      assert (testRecipe.getName().equals("Test"));
    }

    @Test
    void testCopyConstructor() {
      ArrayList<Tag> testTags = new ArrayList<>();
      testTags.add(new Tag("Healthy", "Health"));
      testTags.add(new Tag("Dinner", "Meal"));
      List<RecipeIngredientElement> testRecipeIngredients = Arrays.asList(
          new RecipeIngredientElement("banana", 2.0f),
          new RecipeIngredientElement("apple", 3.0f),
          new RecipeIngredientElement("orange", 4.0f)
      );
      Recipe testRecipe = new Recipe("Test", 2, testTags, testRecipeIngredients, "Step 1: Lorem ipsum");
      Recipe testRecipeCopy = new Recipe(testRecipe);
      assert(testRecipe.getName().equals(testRecipeCopy.getName()));
    }

    @Test
    void testGetIngredients() {
      ArrayList<Tag> testTags = new ArrayList<>();
      testTags.add(new Tag("Healthy", "Health"));
      testTags.add(new Tag("Dinner", "Meal"));
      List<RecipeIngredientElement> testRecipeIngredients = Arrays.asList(
          new RecipeIngredientElement("banana", 2.0f),
          new RecipeIngredientElement("apple", 3.0f),
          new RecipeIngredientElement("orange", 4.0f)
      );
      Recipe testRecipe = new Recipe("Test", 2, testTags, testRecipeIngredients, "Step 1: Lorem ipsum");
      assert (testRecipe.getIngredients().equals(testRecipeIngredients));
    }

    @Test
    void testGetInstructions() {
      ArrayList<Tag> testTags = new ArrayList<>();
      testTags.add(new Tag("Healthy", "Health"));
      testTags.add(new Tag("Dinner", "Meal"));
      List<RecipeIngredientElement> testRecipeIngredients = Arrays.asList(
          new RecipeIngredientElement("banana", 2.0f),
          new RecipeIngredientElement("apple", 3.0f),
          new RecipeIngredientElement("orange", 4.0f)
      );
      Recipe testRecipe = new Recipe("Test", 2, testTags, testRecipeIngredients, "Step 1: Lorem ipsum");
      assert (testRecipe.getInstructions().equals("Step 1: Lorem ipsum"));
    }

    @Test
    void testGetUnit() {
      ArrayList<Tag> testTags = new ArrayList<>();
      testTags.add(new Tag("Healthy", "Health"));
      testTags.add(new Tag("Dinner", "Meal"));
      List<RecipeIngredientElement> testRecipeIngredients = Arrays.asList(
          new RecipeIngredientElement("banana", 2.0f),
          new RecipeIngredientElement("apple", 3.0f),
          new RecipeIngredientElement("orange", 4.0f)
      );
      Recipe testRecipe = new Recipe("Test", 2, testTags, testRecipeIngredients, "Step 1: Lorem ipsum");
      assert (testRecipe.getUnit().equals("portions"));
    }
  }

  @Nested
  class NegativeTests {
    @Test
    public void testConstructorEmptyIngredients() {
      assertThrows(IllegalArgumentException.class, () -> {
        ArrayList<Tag> testTags = new ArrayList<>();
        testTags.add(new Tag("Healthy", "Health"));
        testTags.add(new Tag("Dinner", "Meal"));
        List<RecipeIngredientElement> testRecipeIngredients = new ArrayList<>();
        Recipe testRecipe = new Recipe("Test", 2, testTags, testRecipeIngredients, "Step 1: Lorem ipsum");
      });
    }

    @Test
    void testConstructorEmptyInstructions() {
      assertThrows(IllegalArgumentException.class, () -> {
        ArrayList<Tag> testTags = new ArrayList<>();
        testTags.add(new Tag("Healthy", "Health"));
        testTags.add(new Tag("Dinner", "Meal"));
        List<RecipeIngredientElement> testRecipeIngredients = Arrays.asList(
            new RecipeIngredientElement("banana", 2.0f),
            new RecipeIngredientElement("apple", 3.0f),
            new RecipeIngredientElement("orange", 4.0f)
        );
        Recipe testRecipe = new Recipe("Test", 2, testTags, testRecipeIngredients, "");
      });
    }
  }
}