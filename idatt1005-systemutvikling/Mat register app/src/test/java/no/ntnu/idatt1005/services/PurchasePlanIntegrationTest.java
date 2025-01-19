package no.ntnu.idatt1005.services;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import no.ntnu.idatt1005.model.data.entities.PurchasePlan;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.services.PurchasePlanService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;

/**
 * Integration test class for PurchasePlanService.
 * This class tests the PurchasePlanService class by performing CRUD operations on the PurchasePlan entities.
 */
@SpringBootTest
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public class PurchasePlanIntegrationTest {

    @Autowired
    private PurchasePlanService purchasePlanService;

    private List<PurchasePlan> purchasePlans = new ArrayList<>();

    /**
     * Sets up the test environment before each test.
     * It creates and saves several PurchasePlan entities to the test database.
     */
    @BeforeEach
    public void setUp() {
        this.purchasePlans.add(new PurchasePlan("Plan1", 1));
        this.purchasePlans.add(new PurchasePlan("Plan2", 2));
        this.purchasePlans.add(new PurchasePlan("Plan3", 3));
        this.purchasePlans.add(new PurchasePlan("Plan4", 4));
        this.purchasePlans.add(new PurchasePlan("Plan5", 5));
        purchasePlanService.savePurchasePlan(this.purchasePlans.get(0));
        purchasePlanService.savePurchasePlan(this.purchasePlans.get(1));
        purchasePlanService.savePurchasePlan(this.purchasePlans.get(2));
        purchasePlanService.savePurchasePlan(this.purchasePlans.get(3));
        purchasePlanService.savePurchasePlan(this.purchasePlans.get(4));
    }

    /**
     * Class for positive testing of the PurchasePlanService class.
     * The class contains tests for the CRUD operations in the PurchasePlanService class.
     */
    @Nested
    class PositiveTests {
        /**
         * Test for finding a PurchasePlan object by a valid id.
         * The test asserts that the found PurchasePlan is present and
         * equal to the expected PurchasePlan. if the entity is not found, the test fails.
         */
        @Test
        void findEntityByValidId() {
            Optional<PurchasePlan> foundEntity = purchasePlanService.findPurchasePlanById(1L);
            if (foundEntity.isPresent()) {
                assertEquals(purchasePlans.get(0), foundEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Test for finding a PurchasePlan object by a valid name.
         * The test asserts that the found PurchasePlan is present
         * and equal to the expected PurchasePlan.
         */
        @Test
        void findAllEntities() {
            Iterable<PurchasePlan> foundEntities = purchasePlanService.findAllPurchasePlans();
            assertEquals(foundEntities, purchasePlans);
        }

        /**
         * Test for saving a PurchasePlan object with valid data to the database.
         * The test asserts that the saved PurchasePlan is equal to the expected PurchasePlan.
         * If the entity is not found, the test fails.
         */
        @Test
        void saveEntityWithValidDataToDB() {
            PurchasePlan purchasePlan = new PurchasePlan("Plan6", 6);
            purchasePlanService.savePurchasePlan(purchasePlan);
            Optional<PurchasePlan> savedEntity = purchasePlanService.findPurchasePlanById(purchasePlan.getId());
            if (savedEntity.isPresent()) {
                assertEquals(purchasePlan, savedEntity.get());
            } else {
                fail("Entity not found");
            }
        }

        /**
         * Test for updating a PurchasePlan object with valid data.
         * The test asserts that the updated PurchasePlan is equal to the expected PurchasePlan.
         */
        @Test
        void updateEntityWithValidData() {
            PurchasePlan purchasePlan = purchasePlans.get(0);
            purchasePlan.setAmount(2);
            PurchasePlan updatedEntity = purchasePlanService.updatePurchasePlan(purchasePlan);
            assertEquals(purchasePlan, updatedEntity);
        }

        /**
         * Test for deleting a PurchasePlan object by a valid id.
         * The test asserts that the deleted PurchasePlan is not found in the database.
         */
        @Test
        void deleteEntityByValidId() {
            purchasePlanService.deletePurchasePlanById(1L);
            Optional<PurchasePlan> deletedEntity = purchasePlanService.findPurchasePlanById(1L);
            assertTrue(deletedEntity.isEmpty());
        }
    }

    /**
     * Class for negative testing of the PurchasePlanService class.
     * The class contains tests for the CRUD operations in the PurchasePlanService class.
     */
    @Nested
    class NegativeTests {
        /**
         * Test for finding a PurchasePlan object by an invalid id.
         * The test asserts that the PurchasePlan is not found in the database.
         */
        @Test
        void findEntityByInvalidId() {
            Optional<PurchasePlan> foundEntity = purchasePlanService.findPurchasePlanById(100L);
            assertTrue(foundEntity.isEmpty());
        }

        /**
         * Test for saving a duplicate PurchasePlan object to the database.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void saveDuplicateObjectToDB() {
            PurchasePlan purchasePlan = new PurchasePlan("Plan1", 1);
            assertThrows(ServiceException.class, () -> purchasePlanService.savePurchasePlan(purchasePlan));
        }

        /**
         * Test for saving a duplicate PurchasePlan object to the database by updating.
         * The test saves a valid PurchasePlan object to the database but then updates it to have the same
         * name as an existing PurchasePlan object. The test asserts that a ServiceException is thrown in this case.
         */
        @Test
        void createDuplicateObjectByUpdating() {
            PurchasePlan purchasePlan = new PurchasePlan("Plan7", 1);
            purchasePlanService.savePurchasePlan(purchasePlan);
            purchasePlan.setName("Plan1");
            assertThrows(ServiceException.class, () -> purchasePlanService.savePurchasePlan(purchasePlan));
        }

        /**
         * Test for updating a non-existing PurchasePlan object.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void updateNonExistingEntity() {
            PurchasePlan nonExistingEntity = new PurchasePlan("Non existing entity", 1);
            assertThrows(ServiceException.class, () -> purchasePlanService.updatePurchasePlan(nonExistingEntity));
        }

        /**
         * Test for deleting a non-existing PurchasePlan object by id.
         * The test asserts that a ServiceException is thrown.
         */
        @Test
        void deleteNonExistingEntityById() {
            assertThrows(ServiceException.class, () -> purchasePlanService.deletePurchasePlanById(100L));
        }
    }
}