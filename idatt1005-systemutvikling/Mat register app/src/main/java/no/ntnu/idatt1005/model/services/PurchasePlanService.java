package no.ntnu.idatt1005.model.services;

import static no.ntnu.idatt1005.model.exceptions.ErrorCode.DUPLICATE_OBJECT_PASSED_TO_SERVICE;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_DELETE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_UPDATE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_ARGUMENTS;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_OBJECT_ID;

import jakarta.transaction.Transactional;
import java.util.Optional;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.data.entities.PurchasePlan;
import no.ntnu.idatt1005.model.repo.PurchasePlanRepository;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.stereotype.Service;

/**
 * <p>Class for handling business logic for PurchasePlan objects.</p>
 * The class will handle the following CRUD operations:
 * <ul>
 *     <li>Find by id</li>
 *     <li>Find by name</li>
 *     <li>Find all</li>
 *     <li>Save</li>
 *     <li>Update</li>
 *     <li>Delete by id</li>
 *     <li>Delete object</li>
 * </ul>
 *
 * The purchasePlanRepository is autowired into the class to handle the CRUD operations.
 * <p>Any exceptions that occur during the CRUD operations will be caught and rethrown as a ServiceException
 * with a corresponding error code.</p>
 * @see PurchasePlanRepository
 * @see PurchasePlan
 * @see no.ntnu.idatt1005.model.exceptions.ErrorCode
 **/
@Service
public class PurchasePlanService {
    PurchasePlanRepository purchasePlanRepository;

    /**
     * Constructor for PurchasePlanService
     * The purchasePlanRepository is autowired into the class to handle the CRUD operations by Spring.
     * @param purchasePlanRepository the repository for handling CRUD operations on PurchasePlan objects
     * @see PurchasePlanRepository
     */
    public PurchasePlanService(PurchasePlanRepository purchasePlanRepository) {
        this.purchasePlanRepository = purchasePlanRepository;
    }

    /**
     * Method for finding a PurchasePlan object by id
     * If id is less than or equal to 0, a ServiceException is thrown.
     *
     * @param id
     * @return an Optional of PurchasePlan object
     */
    @Transactional
    public Optional<PurchasePlan> findPurchasePlanById(Long id) {
        if (id <= 0) {
            throw new IllegalArgumentException("Id cannot be less than or equal to 0");
        }
        return purchasePlanRepository.findById(id);
    }

    /**
     * Method for finding a PurchasePlan object by name
     *
     * @param name the name of the PurchasePlan object to find
     * @return an Optional of PurchasePlan object
     */
    @Transactional
    public Optional<PurchasePlan> findPurchasePlanByName(String name) {
        return purchasePlanRepository.findByName(name);
    }

    /**
     * Method for returning all PurchasePlan objects
     *
     * @return an Iterable of PurchasePlan objects
     */
    @Transactional
    public Iterable<PurchasePlan> findAllPurchasePlans() {
        return purchasePlanRepository.findAll();
    }

    /**
     * Method for saving a PurchasePlan object
     * The PurchasePlan object is saved to the database. If any duplicates are passed
     * to the method, a ServiceException is thrown.
     *
     * @param entity the PurchasePlan object to be saved
     */
    @Transactional
    public void savePurchasePlan(PurchasePlan entity) {
        Iterable<PurchasePlan> purchasePlans = purchasePlanRepository.findAll();
        for (PurchasePlan purchasePlan : purchasePlans) {
            if (purchasePlan.getName().equals(entity.getName())) {
                throw new ServiceException(DUPLICATE_OBJECT_PASSED_TO_SERVICE, entity.getName());
            }
        }
        purchasePlanRepository.save(entity);
    }

    /**
     * Method for updating a PurchasePlan object
     * The PurchasePlan object is updated in the database. If the object does not exist in the database,
     * a ServiceException is thrown.
     * <p></p>
     * The method can throw an InvalidDataAccessApiUsageException if the arguments are invalid,
     * which is caught and rethrown as a ServiceException.
     *
     * @param entity the PurchasePlan object to be updated
     * @return the updated PurchasePlan object
     */
    @Transactional
    public PurchasePlan updatePurchasePlan(PurchasePlan entity) {
        try {
            Optional<PurchasePlan> purchasePlan = purchasePlanRepository.findById(entity.getId());
            if (purchasePlan.isPresent() && purchasePlan.get().getName().equals(entity.getName())) {
                purchasePlan.get().setAmount(entity.getAmount());
                return purchasePlanRepository.save(purchasePlan.get());
            } else {
                throw new ServiceException(FAILED_TO_UPDATE_OBJECT, entity.getName());
            }
        } catch (InvalidDataAccessApiUsageException e) {
            throw new ServiceException(INVALID_ARGUMENTS, entity.getName(), e);
        }
    }

    /**
     * Method for deleting a PurchasePlan object by id
     *
     * @param id the id of the PurchasePlan object to be deleted
     */
    @Transactional
    public void deletePurchasePlanById(Long id) {
        if (id <= 0) {
            throw new ServiceException(INVALID_OBJECT_ID, id);
        }
        if (purchasePlanRepository.findById(id).isPresent()) {
            purchasePlanRepository.deleteById(id);
        } else {
            throw new ServiceException(FAILED_TO_DELETE_OBJECT, id);
        }
    }

    /**
     * Method for deleting a PurchasePlan object
     *
     * @param entity the PurchasePlan object to be deleted
     */
    @Transactional
    public void deletePurchasePlan(PurchasePlan entity) {
        if (purchasePlanRepository.findByName(entity.getName()).isPresent()) {
            purchasePlanRepository.delete(entity);
        } else {
            throw new ServiceException(FAILED_TO_DELETE_OBJECT, entity.getName());
        }
    }
}