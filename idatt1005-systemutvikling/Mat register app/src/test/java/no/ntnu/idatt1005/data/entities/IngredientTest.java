package no.ntnu.idatt1005.data.entities;

import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.data.entities.Tag;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertThrows;

public class IngredientTest {
  @Nested
  public class PositiveTests {
    @Test
    public void testConstructor() {
      ArrayList<Tag> testTags = new ArrayList<Tag>();
      testTags.add(new Tag("Gluten", "Allergen"));
      Ingredient ingredient = new Ingredient("Test", 1, "Test", testTags);
    }

    @Test
    public void testCopyConstructor() {
      ArrayList<Tag> testTags = new ArrayList<Tag>();
      testTags.add(new Tag("Gluten", "Allergen"));
      Ingredient ingredient = new Ingredient("Test", 1, "Test", testTags);
      Ingredient ingredientCopy = new Ingredient(ingredient);
    }

    @Test
    public void testGetUnit() {
      ArrayList<Tag> testTags = new ArrayList<Tag>();
      testTags.add(new Tag("Gluten", "Allergen"));
      Ingredient ingredient = new Ingredient("Test", 1, "Kg", testTags);
      assert (ingredient.getUnit().equals("Kg"));
    }
  }

  @Nested
  public class NegativeTests {
    @Test
    public void testConstructorEmptyUnit() {
      assertThrows(IllegalArgumentException.class, () -> {
        ArrayList<Tag> testTags = new ArrayList<Tag>();
        testTags.add(new Tag("Gluten", "Allergen"));
        Ingredient ingredient = new Ingredient("Test", 1, "", testTags);
      });
    }
  }
}