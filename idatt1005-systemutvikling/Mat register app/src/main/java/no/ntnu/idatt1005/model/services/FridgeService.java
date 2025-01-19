package no.ntnu.idatt1005.model.services;

import static no.ntnu.idatt1005.model.exceptions.ErrorCode.DUPLICATE_OBJECT_PASSED_TO_SERVICE;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_ARGUMENTS;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_OBJECT_ID;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_UPDATE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.OBJECT_NOT_FOUND;

import jakarta.transaction.Transactional;
import java.util.Optional;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.data.entities.FridgeElement;
import no.ntnu.idatt1005.model.repo.FridgeRepository;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.stereotype.Service;

/**
 * <p>Class for handling business logic for FridgeElement objects.</p>
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
 * The fridgeRepository is autowired into the class to handle the CRUD operations.
 * <p>Any exceptions that occur during the CRUD operations will be caught and rethrown as a ServiceException
 * with a corresponding error code.</p>
 *
 * @see FridgeRepository
 * @see FridgeElement
 * @see no.ntnu.idatt1005.model.exceptions.ErrorCode
 */
@Service
public class FridgeService {
    FridgeRepository fridgeRepository;
    public FridgeService(FridgeRepository fridgeRepository) {
        this.fridgeRepository = fridgeRepository;
    }

    /**
     * Method for finding a FridgeElement object by id
     * If id is less than or equal to 0, a ServiceException is thrown.
     *
     * @param id
     * @return an Optional of FridgeElement object
     */
    @Transactional
    public Optional<FridgeElement> findFridgeElementById(Long id) {
        if (id <= 0) {
            throw new ServiceException(INVALID_OBJECT_ID, id);
        }
        return fridgeRepository.findById(id);
    }

    /**
     * Method for finding a FridgeElement object by name
     *
     * @param entity the FridgeElement object to find
     * @return an Optional of FridgeElement object
     */
    @Transactional
    public Optional<FridgeElement> findFridgeElementByEntity(FridgeElement entity) {
        return fridgeRepository.findByName(entity.getName());
    }

    /**
     * Method for finding a FridgeElement object by name
     *
     * @param name the name of the FridgeElement object to find
     * @return an Optional of FridgeElement object
     */
    @Transactional
    public Optional<FridgeElement> findFridgeElementByName(String name) {
        return fridgeRepository.findByName(name);
    }

    /**
     * Method for returning all FridgeElement objects
     *
     * @return an Iterable of FridgeElement objects
     */
    @Transactional
    public Iterable<FridgeElement> findAllFridgeElements() {
        return fridgeRepository.findAll();
    }

    /**
     * Method for saving a FridgeElement object
     * If the FridgeElement object already exists in the database, a ServiceException is thrown.
     *
     * @param entity the FridgeElement object to save
     */
    @Transactional
    public void saveFridgeElement(FridgeElement entity) {
        Iterable<FridgeElement> fridgeElements = fridgeRepository.findAll();
        for (FridgeElement fridgeElement : fridgeElements) {
            if (fridgeElement.getName().equals(entity.getName())) {
                throw new ServiceException(DUPLICATE_OBJECT_PASSED_TO_SERVICE, entity.getName());
            }
        }
        fridgeRepository.save(entity);
    }

    /**
     * Method for updating a FridgeElement object
     * If the FridgeElement object does not exist in the database,
     * a ServiceException is thrown.
     * <p></p>
     * - The method can throw an InvalidDataAccessApiUsageException if the arguments are invalid,
     * this will be caught and rethrown as a ServiceException along with the original exception.
     *
     * @param entity the FridgeElement object to update
     * @return the updated FridgeElement object
     */
    @Transactional
    public FridgeElement updateFridgeElement(FridgeElement entity) {
        try {
            Optional<FridgeElement> fridgeElement = fridgeRepository.findByName(entity.getName());
            if (fridgeElement.isPresent() && fridgeElement.get().getName().equals(entity.getName())) {
                fridgeElement.get().setAmount(entity.getAmount());
                return fridgeRepository.save(fridgeElement.get());
            } else {
                throw new ServiceException(FAILED_TO_UPDATE_OBJECT, entity.getName());
            }
        } catch (InvalidDataAccessApiUsageException e) {
            throw new ServiceException(INVALID_ARGUMENTS, entity.getName(), e);
        }
    }

    /**
     * Method for deleting a FridgeElement object by id
     * If id is less than or equal to 0, a ServiceException is thrown.
     * If the FridgeElement object does not exist in the database, a ServiceException is thrown.
     *
     * @param id the id of the FridgeElement object to delete
     */
    @Transactional
    public void deleteFridgeElementById(Long id) {
        if (id <= 0) {
            throw new ServiceException(INVALID_OBJECT_ID, id);
        }
        if (fridgeRepository.findById(id).isPresent()) {
            fridgeRepository.deleteById(id);
        } else {
            throw new ServiceException(OBJECT_NOT_FOUND, id);
        }
    }

    /**
     * Method for deleting a FridgeElement object
     * If the FridgeElement object does not exist in the database, a ServiceException is thrown.
     *
     * @param entity the FridgeElement object to delete
     */
    @Transactional
    public void deleteFridgeElement(FridgeElement entity) {
        if (fridgeRepository.findByName(entity.getName()).isPresent()) {
            fridgeRepository.delete(entity);
        } else {
            throw new ServiceException(OBJECT_NOT_FOUND, entity.getName());
        }
    }
}
