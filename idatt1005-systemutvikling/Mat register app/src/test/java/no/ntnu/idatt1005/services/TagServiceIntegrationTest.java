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
import no.ntnu.idatt1005.model.repo.TagRepository;
import no.ntnu.idatt1005.model.services.TagService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;

/**
 * Integration test class for TagService.
 * This class tests the TagService class by performing CRUD operations on the Tag entities.
 */
@SpringBootTest
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public class TagServiceIntegrationTest {

    @Autowired
    private TagService tagService;

    private List<Tag> tags = new ArrayList<>();

    /**
     * Sets up the test environment before each test.
     * It creates and saves several Tag entities to the test database.
     */
    @BeforeEach
    public void setUp() {
        this.tags.add(new Tag("Healthy", "Health"));
        this.tags.add(new Tag("Dinner", "Meal"));
        this.tags.add(new Tag("Breakfast", "Meal"));
        this.tags.add(new Tag("Lunch", "Meal"));
        this.tags.add(new Tag("Snack", "Meal"));
        tagService.saveObjectToDatabase(this.tags.get(0));
        tagService.saveObjectToDatabase(this.tags.get(1));
        tagService.saveObjectToDatabase(this.tags.get(2));
        tagService.saveObjectToDatabase(this.tags.get(3));
        tagService.saveObjectToDatabase(this.tags.get(4));
    }

    /**
     * Class for positive testing of the TagService class.
     * The class contains tests for the valid CRUD operations in the TagService class.
     */
    @Nested
    class PositiveTests {
        /**
         * Test for finding a Tag object by a valid id.
         */
        @Test
        void findEntityByValidId() {
            Optional<Tag> foundEntity = tagService.getObjectFromDatabase(1L);
            if (foundEntity.isPresent()) {
                assertEquals(tags.get(0), foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Test for finding a Tag object by a valid entity.
         */
        @Test
        void findValidEntity() {
            Tag tag = tags.get(0);
            Optional<Tag> foundEntity = tagService.getObjectFromDatabase(tag);
            if (foundEntity.isPresent()) {
                assertEquals(tag, foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Test for finding all Tag entities.
         */
        @Test
        void findAllEntities() {
            Iterable<Tag> foundEntities = tagService.getAllObjectsFromDatabase();
            assertEquals(foundEntities, tags);
        }

        /**
         * Test for saving a Tag object with valid data to the database.
         */
        @Test
        void saveEntityWithValidDataToDB() {
            Tag tag = new Tag("Fruit", "Category");
            tagService.saveObjectToDatabase(tag);
            Optional<Tag> savedEntity = tagService.getObjectFromDatabase(tag);
            if (savedEntity.isPresent()) {
                assertEquals(tag, savedEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Test for updating a Tag object with valid data.
         */
        @Test
        void updateEntityWithValidData() {
            Tag tag = tags.get(0);
            tag.setCategory("New Category");
            Tag updatedEntity = tagService.updateObjectInDatabase(tag);
            assertEquals(tag, updatedEntity);
        }

        /**
         * Test for deleting a Tag object by a valid id.
         */
        @Test
        void deleteEntityByValidId() {
            tagService.removeObjectFromDatabase(1L);
            Optional<Tag> deletedEntity = tagService.getObjectFromDatabase(1L);
            assertTrue(deletedEntity.isEmpty());
        }

        /**
         * Test for deleting a Tag object by a valid entity.
         */
        @Test
        void deleteObjectWithoutRetrievingItFromDatabaseFirst() {
            Tag tag = new Tag("Vegetable", "Category");
            tagService.saveObjectToDatabase(tag);
            tagService.removeObjectFromDatabase(tag);
            Optional<Tag> deletedEntity = tagService.getObjectFromDatabase(tag);
            assertTrue(deletedEntity.isEmpty());
        }
    }

    /**
     * Class for negative testing of the TagService class.
     * The class contains tests for the invalid CRUD operations in the TagService class.
     */
    @Nested
    class NegativeTests {
        /**
         * Test for finding a Tag object by an invalid id.
         * The test asserts that the Tag is not found in the database.
         */
        @Test
        void findEntityByInvalidId() {
            Optional<Tag> foundEntity = tagService.getObjectFromDatabase(100L);
            assertTrue(foundEntity.isEmpty());
        }

        /**
         * Test for finding a Tag object by an invalid entity.
         * The test asserts that the Tag is not found in the database.
         */
        @Test
        void findInvalidEntity() {
            Tag tag = new Tag("Non existing entity", "Category");
            Optional<Tag> foundEntity = tagService.getObjectFromDatabase(tag);
            assertTrue(foundEntity.isEmpty());
        }

        /**
         * Test for saving a duplicate Tag object to the database.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void saveDuplicateObjectToDB() {
            Tag tag = new Tag("Healthy", "Health");
            assertThrows(ServiceException.class, () -> tagService.saveObjectToDatabase(tag));
        }

        /**
         * Test for updating a non-existing Tag object.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void updateNonExistingEntity() {
            Tag nonExistingEntity = new Tag("Non existing entity", "Category");
            assertThrows(ServiceException.class, () -> tagService.updateObjectInDatabase(nonExistingEntity));
        }

        /**
         * Test for deleting a non-existing Tag object by id.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void deleteNonExistingEntityById() {
            assertThrows(ServiceException.class, () -> tagService.removeObjectFromDatabase(100L));
        }

        /**
         * Test for deleting a non-existing Tag object by entity.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void deleteNonExistingEntity() {
            Tag nonExistingEntity = new Tag("Non existing entity", "Category");
            assertThrows(ServiceException.class, () -> tagService.removeObjectFromDatabase(nonExistingEntity));
        }
    }
}
