package no.ntnu.idatt1005.data.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.util.Arrays;
import java.util.List;

import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.data.entities.Recipe;
import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import no.ntnu.idatt1005.model.data.entities.Tag;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

/**
 * Test class for Recipe.
 */
public class RecipeTest {
    @Nested
    class PositiveTests {
        @Test
        void testCreateRecipe() {
            List<RecipeIngredientElement> ingredients = Arrays.asList(
                new RecipeIngredientElement("banana", 2.0f),
                new RecipeIngredientElement("apple", 3.0f),
                new RecipeIngredientElement("orange", 4.0f)
            );
            Tag tag = new Tag("Healthy", "Health");
            Recipe recipe = new Recipe("Test Recipe", 2, List.of(tag), ingredients, "Test Instructions");

            assertNotNull(recipe);
            assertEquals("Test Recipe", recipe.getName());
            assertEquals(ingredients, recipe.getIngredients());
            assertEquals("Test Instructions", recipe.getInstructions());
            assertEquals(2, recipe.getDefaultAmount());
        }

        @Test
        void testSetRecipeName() {
            Recipe recipe = new Recipe();
            recipe.setRecipeName("New Recipe Name");

            assertEquals("New Recipe Name", recipe.getName());
        }

        @Test
        void testSetIngredients() {
            Recipe recipe = new Recipe();
            List<RecipeIngredientElement> ingredients = Arrays.asList(
                new RecipeIngredientElement("banana", 2.0f),
                new RecipeIngredientElement("apple", 3.0f),
                new RecipeIngredientElement("orange", 4.0f)
            );
            recipe.setIngredients(ingredients);

            assertEquals(ingredients, recipe.getIngredients());
        }

        @Test
        void testSetInstructions() {
            Recipe recipe = new Recipe();
            recipe.setInstructions("New Instructions");

            assertEquals("New Instructions", recipe.getInstructions());
        }

        @Test
        void testSetDefaultAmount() {
            Recipe recipe = new Recipe();
            recipe.setDefaultAmount(3);

            assertEquals(3, recipe.getDefaultAmount());
        }

        @Test
        void testEquals() {
            List<RecipeIngredientElement> ingredients = Arrays.asList(
                new RecipeIngredientElement("banana", 2.0f),
                new RecipeIngredientElement("apple", 3.0f),
                new RecipeIngredientElement("orange", 4.0f)
            );
            Tag tag = new Tag("Healthy", "Health");
            Recipe recipe1 = new Recipe("Test Recipe", 2, List.of(tag), ingredients, "Test Instructions");
            Recipe recipe2 = new Recipe("Test Recipe", 2, List.of(tag), ingredients, "Test Instructions");

            assertEquals(recipe1, recipe2);
        }

        @Test
        void testHashCode() {
            List<RecipeIngredientElement> ingredients = Arrays.asList(
                new RecipeIngredientElement("banana", 2.0f),
                new RecipeIngredientElement("apple", 3.0f),
                new RecipeIngredientElement("orange", 4.0f)
            );
            Tag tag = new Tag("Healthy", "Health");
            Recipe recipe1 = new Recipe("Test Recipe", 2, List.of(tag), ingredients, "Test Instructions");
            Recipe recipe2 = new Recipe("Test Recipe", 2, List.of(tag), ingredients, "Test Instructions");

            assertEquals(recipe1.hashCode(), recipe2.hashCode());
        }
    }
    @Nested
    class negativeTests {
        @Test
        void createRecipeWithNullName() {
            List<RecipeIngredientElement> ingredients = Arrays.asList(
                new RecipeIngredientElement("banana", 2.0f),
                new RecipeIngredientElement("apple", 3.0f),
                new RecipeIngredientElement("orange", 4.0f)
            );
            assertThrows(NullPointerException.class, () -> new Recipe(null, 2, List.of(), ingredients, "Test Instructions"));
        }

        @Test
        void createRecipeWithNullIngredients() {
            assertThrows(NullPointerException.class, () -> new Recipe(null, 2, List.of(), null, "Test Instructions"));
        }

        @Test
        void createRecipeWithNullInstructions() {
            List<Ingredient> ingredients = Arrays.asList(new Ingredient(), new Ingredient());
            assertThrows(NullPointerException.class, () -> new Recipe(null, 2, List.of(), null, "Test Instructions"));
        }

        @Test
        void setRecipeNameToNull() {
            Recipe recipe = new Recipe();
            assertThrows(NullPointerException.class, () -> recipe.setRecipeName(null));
        }
    }
}