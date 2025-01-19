package no.ntnu.idatt1005.services;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import no.ntnu.idatt1005.model.data.entities.Tag;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.repo.IngredientRepository;
import no.ntnu.idatt1005.model.services.IngredientService;
import no.ntnu.idatt1005.model.services.TagService;
import org.junit.Ignore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
/*
   TODO:
    - create test for checking if you can save an ingredient, delete it and then save it again
    and then check if the the original ingredient object is equal to the saved ingredient object
 */
/**
 * Class for testing the IngredientService class
 * The class contains tests for the CRUD operations in the IngredientService class
 */
@SpringBootTest
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD) //SKUMMEL
class IngredientServiceIntegrationTest {
    @Autowired
    protected IngredientService ingredientService;
    @Autowired
    protected IngredientRepository ingredientRepository;
    @Autowired
    protected TagService tagService;
    protected List<Ingredient> ingredients = new ArrayList<>();
    protected Tag healthy;

    /**
     * Method for setting up the test environment
     * The method adds ingredients to the list of ingredients
     * and saves the ingredients in the database
     */
    @BeforeEach
    public void setUp() {
        healthy = new Tag("Healthy", "Health");
        tagService.saveObjectToDatabase(healthy);
        this.ingredients.add(new Ingredient("Carrot", 1, "grams", List.of(healthy)));
        this.ingredients.add(new Ingredient("Apple", 1, "grams", List.of(healthy)));
        this.ingredients.add(new Ingredient("Banana", 1, "grams", List.of(healthy)));
        this.ingredients.add(new Ingredient("Orange", 1, "grams", List.of(healthy)));
        this.ingredients.add(new Ingredient("Pineapple", 1, "grams", List.of(healthy)));
        ingredientService.saveListOfObjectsToDatabase(this.ingredients);
    }

    /**
     * Class for positive testing of the IngredientService class
     * The class contains tests for the CRUD operations in the IngredientService class
     */
    @Nested
    class PositiveTests {
        /**
         * Method for finding an Ingredient object by id
         * The ingredient object is fetched from the database.
         * the method checks if the ingredient is fetched from the database
         * by comparing the fetched ingredient with the persisted ingredient in the database
         */
        @Test
        void findEntityByValidId() {
            Optional<Ingredient> foundEntity = ingredientService.getObjectFromDatabase(1L);
            if (foundEntity.isPresent()) {
                assertEquals(ingredients.get(0), foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for finding an Ingredient object by id
         * The ingredient object is fetched from the database.
         * the method checks if the ingredient is fetched from the database
         * by comparing the fetched ingredient with the persisted ingredient in the database
         */
        @Test
        void findValidEntity() {
            Ingredient carrot = ingredients.get(0);
            Optional<Ingredient> foundEntity = ingredientService.getObjectFromDatabase(carrot.getName());
            if (foundEntity.isPresent()) {
                assertEquals(carrot, foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for finding all Ingredient objects.
         * the method checks if the ingredients are fetched from the database
         * by comparing the fetched ingredients with the persisted ingredients in the database
         */
        @Test
        void findAllEntities() {
            Iterable<Ingredient> foundEntities = ingredientService.getAllObjectsFromDatabase();
            assertEquals(foundEntities, ingredients);
        }

        @Test
        void objectCanBeRetrievedAfterRePersistingIt() {
            Ingredient mango = new Ingredient("Mango", 1, "grams", List.of(healthy));
            ingredientService.saveObjectToDatabase(mango);
            ingredientService.removeObjectFromDatabase(mango);
            // persist the object again, and check if it can still be retrieved
            ingredientService.saveObjectToDatabase(mango);
            Optional<Ingredient> savedEntity = ingredientService.getObjectFromDatabase(mango.getName());
            if (savedEntity.isPresent()) {
                assertEquals(mango, savedEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for saving an Ingredient object.
         * the method checks if the ingredient is saved in the database
         * by comparing the saved ingredient with the persisted ingredient in the database
         */
        @Test
        void saveEntityWithValidDataToDB() {
            Ingredient passionFruit = new Ingredient("Passion fruit", 1, "grams", List.of(healthy));
            ingredientService.saveObjectToDatabase(passionFruit);
            Optional<Ingredient> savedEntity = ingredientService.getObjectFromDatabase(passionFruit.getId());
            if (savedEntity.isPresent()) {
                assertEquals(passionFruit, savedEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for saving a list of Ingredient objects.
         * the method checks if the ingredients are saved in the database
         * by comparing the saved ingredients with the persisted ingredients in the database
         */
        @Test
        void saveValidListOfEntitiesToDB() {
            List<Ingredient> newIngredients = new ArrayList<>();
            newIngredients.add(new Ingredient("Mango", 1, "grams", List.of(healthy)));
            newIngredients.add(new Ingredient("Papaya", 1, "grams", List.of(healthy)));
            newIngredients.add(new Ingredient("Kiwi", 1, "grams", List.of(healthy)));
            ingredientService.saveListOfObjectsToDatabase(newIngredients);
            ingredients.addAll(newIngredients);
            Iterable<Ingredient> foundEntities = ingredientService.getAllObjectsFromDatabase();
            assertEquals(foundEntities, ingredients);
        }

        /**
         * Method for updating an Ingredient object.
         * The ingredient object should be updated in the database.
         * the method checks if the ingredient is updated in the database
         * by comparing the updated ingredient with the persisted ingredient in the database
         */
        @Test
        void updateEntityWithValidData() {
            Ingredient carrot = ingredients.get(0);
            carrot.setDefaultAmount(2);
            carrot.setUnit("grams");
            ingredientService.updateObjectInDatabase(carrot);
            Optional<Ingredient> updatedEntity = ingredientService.getObjectFromDatabase(carrot.getId());
            if (updatedEntity.isPresent()) {
                assertEquals(carrot, updatedEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for deleting an Ingredient object by id
         * The ingredient object should be deleted from the database.
         * the method checks if the ingredient is deleted from the database
         * by counting the number of ingredients in the database
         */
        @Test
        void deleteEntityByValidId() {
            ingredientService.removeObjectFromDatabase(1L);
            Optional<Ingredient> deletedEntity = ingredientService.getObjectFromDatabase(1L);
            if (deletedEntity.isEmpty()) {
                assertEquals(4, ingredientRepository.count());
            } else {
                fail("Entity not deleted");
            }
        }
        /**
         * Method for deleting an Ingredient object
         * The ingredient object should be deleted from the database.
         * the method checks if the ingredient is deleted from the database
         * by counting the number of ingredients in the database
         */
        @Test
        void deleteObjectWithoutRetrievingItFromDatabaseFirst() {
            Ingredient mango = new Ingredient("Mango", 1, "grams", List.of(healthy));
            ingredientService.saveObjectToDatabase(mango);
            ingredientService.removeObjectFromDatabase(mango);
            Optional<Ingredient> deletedEntity = ingredientService.getObjectFromDatabase(mango.getId());
            if (deletedEntity.isEmpty()) {
                assertEquals(5, ingredientRepository.count());
            } else {
                fail("Entity not deleted");
            }
        }

        /**
         * Method for deleting an existing Ingredient object
         * Checks if the ingredient is deleted from the database by
         * comparing the number of ingredients in the database before and after the deletion.
         */
        @Test
        void deleteRetrievedEntityFromDatabase() {
            Ingredient carrot = ingredientService.getObjectFromDatabase(1L).orElse(null);
            ingredientService.removeObjectFromDatabase(carrot);
            Optional<Ingredient> deletedEntity = ingredientService.getObjectFromDatabase(carrot.getId());
            if (deletedEntity.isEmpty()) {
                assertEquals(4, ingredientRepository.count());
            } else {
                fail("Entity not deleted");
            }
        }
    }
    @Nested
    class negativeTests {
        /**
         * Method for testing if an exception is thrown when trying to read an entity by an invalid id.
         */
        @Test
        void readAnNonExistingEntity() {
            Ingredient nonExistingEntity = new Ingredient("Non existing entity", 1, "grams", List.of(healthy));
            assertTrue(ingredientService.getObjectFromDatabase(nonExistingEntity.getName()).isEmpty());
        }

        /**
         * Method for testing if an exception is thrown when trying to read an entity by an invalid id.
         */
        @Test
        void readANonExistingEntityById() {
            assertTrue(ingredientService.getObjectFromDatabase(100L).isEmpty());
        }

        /**
         * Method for testing if an exception is thrown when saving an object with the same name as an existing entity.
         */
        @Test
        void saveDuplicateEntity() {
            Ingredient carrot = new Ingredient("Carrot", 1, "grams", List.of(healthy));
            assertThrows(ServiceException.class, () -> ingredientService.saveObjectToDatabase(carrot));
        }

        /**
         * Method for testing if an exception is thrown when saving an entity with the same name but different attributes.
         */
        @Test
        void saveEntityWithSameNameAndDifferentAttributes() {
            Ingredient carrot = new Ingredient("Carrot", 4, "Liters", List.of(healthy));
            assertThrows(ServiceException.class, () -> ingredientService.saveObjectToDatabase(carrot));
        }

        @Test
        void saveEntityWithInvalidArguments() {
            assertThrows(ServiceException.class, () -> ingredientService.saveObjectToDatabase(null));
        }

        /**
         * Method for testing if an exception is thrown when saving a list of entities with the same name
         * The method creates a list of objects which contains an object with the same name
         * and tries to persist them in the database, the Service should throw an exception.
         */
        @Test
        void saveListOfEntitiesWithSameName() {
            List<Ingredient> newIngredients = new ArrayList<>();
            newIngredients.add(new Ingredient("Carrot", 1, "grams", List.of(healthy)));
            newIngredients.add(new Ingredient("Apple", 1, "grams", List.of(healthy)));
            newIngredients.add(new Ingredient("Banana", 1, "grams", List.of(healthy)));
            newIngredients.add(new Ingredient("Orange", 1, "grams", List.of(healthy)));
            newIngredients.add(new Ingredient("Pineapple", 1, "grams", List.of(healthy)));
            assertThrows(ServiceException.class, () -> ingredientService.saveListOfObjectsToDatabase(newIngredients));
        }

        /**
         * Method for testing if an exception is thrown when updating a non-existing entity.
         */
        @Test
        void updateNonExistingEntity() {
            Ingredient nonExistingEntity = new Ingredient("Non existing entity", 1, "grams", List.of(healthy));
            assertThrows(ServiceException.class, () -> ingredientService.updateObjectInDatabase(nonExistingEntity));
        }

        /**
         * Method for testing if an exception is thrown when updating an existing entity to be equal to another entity.
         * The method creates an object and persists it in the database, then creates another object with the same name.
         * The Service should throw an exception when trying to persist the second object as it is not persistent even though
         * it has the same name as the first object.
         */
        /*@Ignore //Code hsa been refactored to test for database object existence by name rather than by ID, making  this test invalid.
        @Test
        void updateNonPersistentEntityWithSameName() {
            Ingredient mango = new Ingredient("Mango", 1, "grams", List.of(healthy));
            ingredientService.saveObjectToDatabase(mango);
            Ingredient mangoDuplicate = new Ingredient("Mango", 1, "grams", List.of(healthy));
            assertThrows(ServiceException.class, () -> ingredientService.updateObjectInDatabase(mangoDuplicate));
        }*/

        /**
         * Method for testing if an exception is thrown when updating an existing entity to be equal to another entity.
         * The method reads an entity from the database, updates it to be equal to another entity and then tries
         * to update it in the database.
         */
        @Test
        void createDuplicateByUpdatingEntity() {
            Optional<Ingredient> apple = ingredientService.getObjectFromDatabase(2L);
            if (apple.isPresent())  {
                Ingredient appleEntity = apple.get();
                appleEntity.setName("NonExistantEntity");
                assertThrows(Exception.class, () -> ingredientService.updateObjectInDatabase(appleEntity));
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Method for testing if an exception is thrown when trying to delete a non-existing entity
         */
        @Test
        void deleteNonExistingEntity() {
            Ingredient nonExistingEntity = new Ingredient("Non existing entity", 1, "grams", List.of(healthy));
            assertThrows(ServiceException.class, () -> ingredientService.removeObjectFromDatabase(nonExistingEntity));
        }

        /**
         * Method for testing if an exception is thrown when trying to delete a non-existing entity by id
         */
        @Test
        void deleteNonExistingEntityById() {
            assertThrows(ServiceException.class, () -> ingredientService.removeObjectFromDatabase(100L));
        }
    }
}

