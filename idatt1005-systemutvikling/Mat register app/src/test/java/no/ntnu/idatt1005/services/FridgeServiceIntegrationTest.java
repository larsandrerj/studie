package no.ntnu.idatt1005.services;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import no.ntnu.idatt1005.model.data.entities.FridgeElement;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.repo.FridgeRepository;
import no.ntnu.idatt1005.model.services.FridgeService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;

/**
 * This class is used to perform integration tests on the FridgeService class.
 * It tests all the CRUD operations provided by the FridgeService.
 * The tests are divided into two categories: PositiveTests and NegativeTests.
 *
 * <p>PositiveTests: These tests check the successful execution of the operations.
 * For example, finding a FridgeElement by a valid id, saving a valid FridgeElement to the database, etc.
 *
 * <p>NegativeTests: These tests check the failure scenarios of the operations.
 * For example, finding a FridgeElement by an invalid id, saving a duplicate FridgeElement to the database, etc.
 *
 * <p>Before each test, a set of FridgeElement objects are saved to the database for testing purposes.
 *
 * <p>The tests are run in a Spring Boot context, and the database is cleaned after each test method.
 * This is achieved by using the @DirtiesContext annotation with the classMode set to AFTER_EACH_TEST_METHOD.
 *
 * <p>The FridgeService and FridgeRepository instances are autowired into this test class.
 */
@SpringBootTest
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public class FridgeServiceIntegrationTest {

    @Autowired
    private FridgeService fridgeService;
    @Autowired
    private FridgeRepository fridgeRepository;

    private List<FridgeElement> fridgeElements = new ArrayList<>();

    @BeforeEach
    public void setUp() {
        this.fridgeElements.add(new FridgeElement("Carrot", 1));
        this.fridgeElements.add(new FridgeElement("Apple", 1));
        this.fridgeElements.add(new FridgeElement("Banana", 1));
        this.fridgeElements.add(new FridgeElement("Orange", 1));
        this.fridgeElements.add(new FridgeElement("Pineapple", 1));
        fridgeService.saveFridgeElement(this.fridgeElements.get(0));
        fridgeService.saveFridgeElement(this.fridgeElements.get(1));
        fridgeService.saveFridgeElement(this.fridgeElements.get(2));
        fridgeService.saveFridgeElement(this.fridgeElements.get(3));
        fridgeService.saveFridgeElement(this.fridgeElements.get(4));
    }

    /**
     * Tests valid CRUD operations provided by the FridgeService.
     */
    @Nested
    class PositiveTests {
        /**
         * Tests the scenario where a FridgeElement is found by a valid id.
         * The test asserts that the found FridgeElement is equal to the original FridgeElement.
         */
        @Test
        void findEntityByValidId() {
            Optional<FridgeElement> foundEntity = fridgeService.findFridgeElementById(1L);
            if (foundEntity.isPresent()) {
                assertEquals(fridgeElements.get(0), foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Tests the scenario where a FridgeElement is found by passing a valid name.
         * The test asserts that the found FridgeElement is equal to the original FridgeElement.
         */
        @Test
        void findValidEntity() {
            FridgeElement fridgeElement = fridgeElements.get(0);
            Optional<FridgeElement> foundEntity = fridgeService.findFridgeElementByEntity(fridgeElement);
            if (foundEntity.isPresent()) {
                assertEquals(fridgeElement, foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Tests the scenario where all FridgeElements are found.
         * The test asserts that the found FridgeElements are equal to the original FridgeElements.
         */
        @Test
        void findAllEntities() {
            Iterable<FridgeElement> foundEntities = fridgeService.findAllFridgeElements();
            assertEquals(foundEntities, fridgeElements);
        }

        /**
         * Tests the scenario where a FridgeElement is saved with valid data to the database.
         * The test asserts that the saved FridgeElement is equal to the original FridgeElement.
         */
        @Test
        void saveEntityWithValidDataToDB() {
            FridgeElement fridgeElement = new FridgeElement("Mango", 1);
            fridgeService.saveFridgeElement(fridgeElement);
            Optional<FridgeElement> savedEntity = fridgeService.findFridgeElementByEntity(fridgeElement);
            if (savedEntity.isPresent()) {
                assertEquals(fridgeElement, savedEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Tests the scenario where a FridgeElement is updated with valid data.
         * The test asserts that the updated FridgeElement is equal to the original FridgeElement.
         */
        @Test
        void updateEntityWithValidData() {
            FridgeElement fridgeElement = fridgeElements.get(0);
            fridgeElement.setAmount(2);
            FridgeElement updatedEntity = fridgeService.updateFridgeElement(fridgeElement);
            assertEquals(fridgeElement, updatedEntity);
        }

        /**
         * Tests the scenario where a FridgeElement is deleted by a valid id.
         * The test asserts that the deleted FridgeElement cannot be found in the database.
         */
        @Test
        void deleteEntityByValidId() {
            fridgeService.deleteFridgeElementById(1L);
            Optional<FridgeElement> deletedEntity = fridgeService.findFridgeElementById(1L);
            assertTrue(deletedEntity.isEmpty());
        }

        /**
         * Tests the scenario where a FridgeElement is deleted without retrieving it from the database first.
         * The test asserts that the deleted FridgeElement cannot be found in the database.
         */
        @Test
        void deleteObjectWithoutRetrievingItFromDatabaseFirst() {
            FridgeElement fridgeElement = new FridgeElement("Mango", 1);
            fridgeService.saveFridgeElement(fridgeElement);
            fridgeService.deleteFridgeElement(fridgeElement);
            Optional<FridgeElement> deletedEntity = fridgeService.findFridgeElementByEntity(fridgeElement);
            assertTrue(deletedEntity.isEmpty());
        }
    }

    /**
     * Tests the invalid CRUD operations provided by the FridgeService.
     */
    @Nested
    class NegativeTests {
        /**
         * Tests the scenario where a FridgeElement is not found by an invalid id.
         * The test asserts that no FridgeElement is found.
         */
        @Test
        void findEntityByInvalidId() {
            Optional<FridgeElement> foundEntity = fridgeService.findFridgeElementById(100L);
            assertTrue(foundEntity.isEmpty());
        }

        /**
         * Tests the scenario where a FridgeElement is not found by passing an invalid name.
         * The test asserts that no FridgeElement is found.
         */
        @Test
        void findInvalidEntity() {
            FridgeElement fridgeElement = new FridgeElement("Non existing entity", 1);
            Optional<FridgeElement> foundEntity = fridgeService.findFridgeElementByEntity(fridgeElement);
            assertTrue(foundEntity.isEmpty());
        }

        /**
         * Tests the scenario where a duplicate FridgeElement is saved to the database.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void saveDuplicateObjectToDB() {
            FridgeElement fridgeElement = new FridgeElement("Carrot", 1);
            assertThrows(ServiceException.class, () -> fridgeService.saveFridgeElement(fridgeElement));
        }

        /**
         * Tests the scenario where a non-existing FridgeElement is updated.
         * The test asserts that an IllegalArgumentException is thrown.
         */
        @Test
        void updateNonExistingEntity() {
            FridgeElement nonExistingEntity = new FridgeElement("Non existing entity", 1);
            assertThrows(ServiceException.class, () -> fridgeService.updateFridgeElement(nonExistingEntity));
        }

        /**
         * Tests the scenario where a FridgeElement is deleted by an invalid id.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void deleteNonExistingEntityById() {
            assertThrows(ServiceException.class, () -> fridgeService.deleteFridgeElementById(100L));
        }

        /**
         * Tests the scenario where a non-existing FridgeElement is deleted.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void deleteNonExistingEntity() {
            FridgeElement nonExistingEntity = new FridgeElement("Non existing entity", 1);
            assertThrows(ServiceException.class, () -> fridgeService.deleteFridgeElement(nonExistingEntity));
        }
    }
}