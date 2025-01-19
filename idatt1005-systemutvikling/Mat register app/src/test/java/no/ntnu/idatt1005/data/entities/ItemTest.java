package no.ntnu.idatt1005.data.entities;

import java.util.List;
import no.ntnu.idatt1005.model.data.IDAmountStruct;
import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import no.ntnu.idatt1005.model.data.entities.Tag;
import org.junit.jupiter.api.Nested;
import no.ntnu.idatt1005.model.data.Item;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.data.entities.Recipe;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

public class ItemTest {
  @Nested
  public class PositiveTests {
    @Test
    public void testConstructor() {
      ArrayList<Tag> testTags = new ArrayList<Tag>();
      testTags.add(new Tag("Healthy", "Health"));
      ArrayList<Item> items = new ArrayList<Item>();
      Ingredient testIngredient = new Ingredient("Test", 1, "pcs", testTags);
      List<RecipeIngredientElement> testRecipeIngredients = new ArrayList<>();
      testRecipeIngredients.add(new RecipeIngredientElement("banana", 2.0f));
      Recipe testRecipe = new Recipe("Test", 2, testTags, testRecipeIngredients, "Step 1: Lorem ipsum");
      items.add(testIngredient);
      items.add(testRecipe);
    }

    public class ConcreteChild extends Item {
      public ConcreteChild(String name, int defaultAmount, ArrayList<Tag> tags) {
        super(name, defaultAmount, tags);
      }

      public ConcreteChild(ConcreteChild item) {
        super(item);
      }
    }

    @Test
    public void testCopyConstructor() {
      ArrayList<Tag> testTags = new ArrayList<Tag>();
      testTags.add(new Tag("Healthy", "Health"));
      ConcreteChild testItem = new ConcreteChild("Test", 1, testTags);
      ConcreteChild testItemCopy = new ConcreteChild(testItem);
    }

    @Test
    public void testGetName() {
      ArrayList<Tag> testTags = new ArrayList<Tag>();
      testTags.add(new Tag("Healthy", "Health"));
      ConcreteChild testItem = new ConcreteChild("Test", 1, testTags);
      assert (testItem.getName().equals("Test"));
    }

    @Test
    public void testGetDefaultAmount() {
      ArrayList<Tag> testTags = new ArrayList<Tag>();
      testTags.add(new Tag("Healthy", "Health"));
      ConcreteChild testItem = new ConcreteChild("Test", 1, testTags);
      assert (testItem.getDefaultAmount() == 1);
    }

    @Test
    public void testGetTags() {
      ArrayList<Tag> testTags = new ArrayList<Tag>();
      testTags.add(new Tag("Healthy", "Health"));
      ConcreteChild testItem = new ConcreteChild("Test", 1, testTags);
      assert (testItem.getTags().equals(testTags));
    }
  }
  // No negative tests required.
}