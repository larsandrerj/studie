package no.ntnu.idatt1005.services;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import no.ntnu.idatt1005.model.data.IDAmountStruct;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.data.entities.Recipe;
import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import no.ntnu.idatt1005.model.data.entities.Tag;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.repo.IngredientRepository;
import no.ntnu.idatt1005.model.repo.RecipeRepository;
import no.ntnu.idatt1005.model.services.IngredientService;
import no.ntnu.idatt1005.model.services.RecipeIngredientElementService;
import no.ntnu.idatt1005.model.services.RecipeService;
import no.ntnu.idatt1005.model.services.TagService;
import org.junit.Ignore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.yaml.snakeyaml.events.Event;

@SpringBootTest
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD) //SKUMMEL
public class RecipeServiceIntegrationTest {

    @Autowired
    private RecipeService recipeService;
    @Autowired
    private RecipeRepository recipeRepository;
    @Autowired
    private IngredientService ingredientService;
    @Autowired
    private TagService tagService;
    @Autowired
    private RecipeIngredientElementService recipeIngredientElementService;
    private IngredientRepository ingredientRepository;

    private List<Ingredient> ingredients = new ArrayList<>();
    private List<RecipeIngredientElement> ingredientsSimple = new ArrayList<>();
    private List<Recipe> recipes;
    private Tag healthy;
    @BeforeEach
    public void setUp() throws InterruptedException {
        healthy = new Tag("Healthy", "Health");
        tagService.saveObjectToDatabase(healthy);
        this.ingredients.add(new Ingredient("Carrot", 1, "grams", List.of(healthy)));
        this.ingredients.add(new Ingredient("Apple", 1, "grams", List.of(healthy)));
        this.ingredients.add(new Ingredient("Banana", 1, "grams", List.of(healthy)));
        this.ingredients.add(new Ingredient("Orange", 1, "grams", List.of(healthy)));
        this.ingredients.add(new Ingredient("Pineapple", 1, "grams", List.of(healthy)));
        ingredientService.saveListOfObjectsToDatabase(this.ingredients);

        for (Ingredient ingredient : ingredients) {
            RecipeIngredientElement recipeIngredient = new RecipeIngredientElement(ingredient.getName(), 1.0f);
            //recipeIngredientElementService.saveObjectToDatabase(recipeIngredient);
            ingredientsSimple.add(recipeIngredient);
        }

        this.recipes = new ArrayList<>();
        this.recipes.add(new Recipe("recipe1", 1, List.of(healthy), ingredientsSimple.subList(0, 2), "instructions"));
        this.recipes.add(new Recipe("recipe2", 1, List.of(healthy), ingredientsSimple.subList(2, 4), "instructions"));
        this.recipes.add(new Recipe("recipe3", 1, List.of(healthy), ingredientsSimple.subList(4,5),"instructions"));
        recipeIngredientElementService.getAllObjectsFromDatabase().forEach(System.out::println);
        recipeService.saveObjectToDatabase(this.recipes.get(0)); // Får samme feil som når jeg brukte CascadeType.ALL
        recipeService.saveObjectToDatabase(this.recipes.get(1));
        recipeService.saveObjectToDatabase(this.recipes.get(2));
    }
    @Nested
    class PositiveTests {
        /**
         * Method for finding a Recipe object by id
         * The recipe object is fetched from the database.
         * the method checks if the recipe is fetched from the database
         * by comparing the fetched recipe with the persisted recipe in the database
         */
        @Test
        void findEntityByValidId() {
            Optional<Recipe> foundEntity = recipeService.getObjectFromDatabase(1L);
            if (foundEntity.isPresent()) {
                assertEquals(recipes.get(0), foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for finding a Recipe object by id
         * The recipe object is fetched from the database.
         * the method checks if the recipe is fetched from the database
         * by comparing the fetched recipe with the persisted recipe in the database
         */
        @Test
        void findValidEntity() {
            Recipe recipe = recipes.get(0);
            Optional<Recipe> foundEntity = recipeService.getObjectFromDatabase(recipe);
            if (foundEntity.isPresent()) {
                assertEquals(recipe, foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for finding all Recipe objects.
         * the method checks if the recipes are fetched from the database
         * by comparing the fetched recipes with the persisted recipes in the database
         */
        @Test
        void findAllEntities() {
            Iterable<Recipe> foundEntities = recipeService.getAllObjectsFromDatabase();
            assertEquals(foundEntities, recipes);
        }

        /**
         * Method for saving a Recipe object.
         * the method checks if the recipe is saved in the database, then deleted and saved again
         * by comparing the saved recipe with the persisted recipe in the database
         */
        @Test
        void objectCanBeRetrievedAfterRePersistingIt() {
            Recipe recipe = new Recipe("recipe", 1, List.of(healthy), new ArrayList<>(){{
                add(new RecipeIngredientElement(ingredientsSimple.get(0)));
                add(new RecipeIngredientElement(ingredientsSimple.get(1)));
            }}, "instructions");
            recipeService.saveObjectToDatabase(recipe);
            recipeService.removeObjectFromDatabase(recipe);
            // persist the object again, and check if it can still be retrieved
            recipeService.saveObjectToDatabase(recipe);
            Optional<Recipe> savedEntity = recipeService.getObjectFromDatabase(recipe);
            if (savedEntity.isPresent()) {
                System.out.println(recipe.getName());
                System.out.println(savedEntity.get().getName());
                assertEquals(recipe.getName(), savedEntity.get().getName());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for saving a Recipe object.
         * the method checks if the recipe is saved in the database
         * by comparing the saved recipe with the persisted recipe in the database
         */
        @Test
        void saveEntityWithValidDataToDB() {
            Recipe r1 = new Recipe(
                "Vegetable Stir-Fry", 4.0f,
                List.of(healthy), // Tags
                new ArrayList<>(){{
                    add(new RecipeIngredientElement(ingredientsSimple.get(0)));
                    add(new RecipeIngredientElement(ingredientsSimple.get(1)));
                }}
                /*elements*/,
                "Instructions");
            recipeService.saveObjectToDatabase(r1);
            Optional<Recipe> savedEntity = recipeService.getObjectFromDatabase("Vegetable Stir-Fry");
            if (savedEntity.isPresent()) {
                assertEquals(r1, savedEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for updating a Recipe object.
         * The recipe object should be updated in the database.
         * the method checks if the recipe is updated in the database
         * by comparing the updated recipe with the persisted recipe in the database
         */
        @Test
        void updateEntityWithValidData() {
            Recipe recipe = recipes.get(0);
            recipe.setIngredients(ingredientsSimple.subList(0, 2));
            recipe.setInstructions("instructions");
            recipeService.updateObjectInDatabase(recipe);
            Optional<Recipe> updatedEntity = recipeService.getObjectFromDatabase(recipe.getId());
            if (updatedEntity.isPresent()) {
                assertEquals(recipe, updatedEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for deleting a Recipe object by id
         * The recipe object should be deleted from the database.
         * the method checks if the recipe is deleted from the database
         * by counting the number of recipes in the database
         */
        @Test
        void deleteEntityByValidId() {
            recipeService.removeObjectFromDatabase(1L);
            Optional<Recipe> deletedEntity = recipeService.getObjectFromDatabase(1L);
            if (deletedEntity.isEmpty()) {
                assertEquals(2, recipeRepository.count());
            } else {
                fail("Entity not deleted");
            }
        }
        /**
         * Method for deleting a Recipe object
         * The recipe object should be deleted from the database.
         * the method checks if the recipe is deleted from the database
         * by counting the number of recipes in the database
         */
        @Test
        // @Disabled - Dette bør brukes når man vil skippe tester, da logges det at de blir ignorert.
        void deleteObjectWithoutRetrievingItFromDatabaseFirst() {
            Recipe recipe = new Recipe("recipe", 1, List.of(healthy), new ArrayList<>(){{
                add(new RecipeIngredientElement(ingredientsSimple.get(0)));
                add(new RecipeIngredientElement(ingredientsSimple.get(1)));
            }}, "instructions");
            recipeService.saveObjectToDatabase(recipe);
            recipeService.removeObjectFromDatabase(recipe);
            Optional<Recipe> deletedEntity = recipeService.getObjectFromDatabase(recipe.getId());
            if (deletedEntity.isEmpty()) {
                assertEquals(3, recipeRepository.count());
            } else {
                fail("Entity not deleted");
            }
        }

        /**
         * Method for deleting an existing Recipe object
         * Checks if the recipe is deleted from the database by
         * comparing the number of recipes in the database before and after the deletion.
         */
        @Test
        void deleteRetrievedEntityFromDatabase() {
            Recipe recipe = recipeService.getObjectFromDatabase(1L).orElse(null);
            recipeService.removeObjectFromDatabase(recipe);
            Optional<Recipe> deletedEntity = recipeService.getObjectFromDatabase(recipe.getId());
            if (deletedEntity.isEmpty()) {
                assertEquals(2, recipeRepository.count());
            } else {
                fail("Entity not deleted");
            }
        }
    }
    @Nested
    class negativeTests {
        @Test
        void findEntityByInvalidId() {
            Optional<Recipe> foundEntity = recipeService.getObjectFromDatabase(100L);
            if (foundEntity.isEmpty()) {
                assertEquals(3, recipeRepository.count());
            } else {
                fail("Entity found");
            }
        }

        @Test
        void findInvalidEntity() {
            Recipe recipe = new Recipe("recipe", 1, List.of(healthy), ingredientsSimple.subList(0, 2), "instructions");
            Optional<Recipe> foundEntity = recipeService.getObjectFromDatabase(recipe);
            if (foundEntity.isEmpty()) {
                assertEquals(3, recipeRepository.count());
            } else {
                fail("Entity found");
            }
        }

        @Test
        void saveDuplicateObjectToDB() {
            Recipe recipe = new Recipe("recipe1", 1, List.of(healthy), ingredientsSimple.subList(0, 2), "instructions");
            assertThrows(ServiceException.class, () -> recipeService.saveObjectToDatabase(recipe));
        }

        /**
         * Method for testing if an exception is thrown when saving an entity with the same name but different attributes.
         */
        @Test
        void saveEntityWithSameNameAndDifferentAttributes() {
            Tag unhealthy = new Tag("Unhealthy", "Health");
            Recipe recipe = new Recipe("recipe1", 1, List.of(unhealthy), ingredientsSimple.subList(2, 4), "more instructions");
            assertThrows(ServiceException.class, () -> recipeService.saveObjectToDatabase(recipe));
        }

        /**
         * Method for testing if an exception is thrown when saving an entity with duplicate ingredients.
         * The method creates an object with duplicate ingredients and tries to persist it in the database.
         */
        @Test
        void saveEntityWithDuplicateIngredients() {
            List<Ingredient> newIngredients = new ArrayList<>();
            List<RecipeIngredientElement> newIngredientsSimple = new ArrayList<>();
            newIngredientsSimple.add(new RecipeIngredientElement("Carrot", 1.0f));
            newIngredientsSimple.add(new RecipeIngredientElement("Carrot", 1.0f));
            Recipe recipe = new Recipe("recipe", 1, List.of(healthy), newIngredientsSimple.subList(0,2), "instructions");
            System.out.println(recipe.getIngredients());
            assertThrows(ServiceException.class, () -> recipeService.saveObjectToDatabase(recipe));
        }

        /**
         * Method for testing if an exception is thrown when updating a non-existing entity.
         */
        @Test
        void updateNonExistingEntity() {
            Recipe nonExistingEntity = new Recipe("Non existing entity", 1, List.of(healthy), ingredientsSimple.subList(0, 2), "instructions");
            assertThrows(ServiceException.class, () -> recipeService.updateObjectInDatabase(nonExistingEntity));
        }

        /**
         * Method for testing if an exception is thrown when updating an existing entity to be equal to another entity.
         * The method creates an object and persists it in the database, then creates another object with the same name.
         * The Service should throw an exception when trying to persist the second object as it is not persistent even though
         * it has the same name as the first object.
         */
        /*@Ignore
        @Test
        void updateNonPersistentEntityWithSameName() {
            Recipe recipe = new Recipe("recipe4", 1, List.of(healthy), new ArrayList<>(){{
                add(new RecipeIngredientElement(ingredientsSimple.get(0)));
                add(new RecipeIngredientElement(ingredientsSimple.get(1)));
            }}, "instructions");
            recipeService.saveObjectToDatabase(recipe);
            Recipe recipeDuplicate = new Recipe("recipe4", 1, List.of(healthy), ingredientsSimple.subList(2, 4), "instructions");
            assertThrows(ServiceException.class, () -> recipeService.updateObjectInDatabase(recipeDuplicate));
        }*/

        /**
         * Method for testing if an exception is thrown when updating an existing entity to be equal to another entity.
         * The method reads an entity from the database, updates it to be equal to another entity and then tries
         * to update it in the database.
         */
        @Test
        void createDuplicateByUpdatingEntity() {
            Optional<Recipe> recipe = recipeService.getObjectFromDatabase(2L);
            if (recipe.isPresent())  {
                Recipe recipeEntity = recipe.get();
                recipeEntity.setRecipeName("NonExistantRecipe");
                assertThrows(Exception.class, () -> recipeService.updateObjectInDatabase(recipeEntity));
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for testing if an exception is thrown when trying to delete a non-existing entity
         */
        @Test
        void deleteNonExistingEntity() {
            Long entityCount = recipeRepository.count();
            Recipe nonExistingEntity = new Recipe("Non existing entity", 1, List.of(healthy), ingredientsSimple.subList(0, 2), "instructions");
            recipeService.removeObjectFromDatabase(nonExistingEntity);
            assertEquals(entityCount, recipeRepository.count());
        }

        /**
         * Method for testing if an exception is thrown when trying to delete a non-existing entity by id
         */
        @Test
        void deleteNonExistingEntityById() {
            Long entityCount = recipeRepository.count();
            recipeService.removeObjectFromDatabase(100L);
            assertEquals(entityCount, recipeRepository.count());
        }

    }
}
