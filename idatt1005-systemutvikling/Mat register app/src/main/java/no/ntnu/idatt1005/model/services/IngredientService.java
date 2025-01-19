package no.ntnu.idatt1005.model.services;

import static no.ntnu.idatt1005.model.exceptions.ErrorCode.DUPLICATE_OBJECT_PASSED_TO_SERVICE;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.EMPTY_OBJECT_PASSED_TO_SERVICE;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_DELETE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_SAVE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_UPDATE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_ARGUMENTS;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_OBJECT_ID;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.RETRIEVAL_ERROR;

import jakarta.transaction.Transactional;
import no.ntnu.idatt1005.model.data.entities.Ingredient;

import no.ntnu.idatt1005.model.repo.IngredientRepository;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.stereotype.Service;

import java.util.Optional;
/**
 * <p>Class for handling business logic for Ingredient objects.</p>
 * The class will handle the following CRUD operations:
 * <ul>
 *     <li>Find by id</li>
 *     <li>Find all</li>
 *     <li>Save</li>
 *     <li>Delete by id</li>
 *     <li>Delete</li>
 * </ul>
 * The ingredientRepository is autowired into the class to handle the CRUD operations.
 * <p>Any exceptions that occur during the CRUD operations will be caught and rethrown as a ServiceException.</p>
 */
@Service
public class IngredientService {
    private final IngredientRepository repository;

    /**
     * Constructor for IngredientService
     * The ingredientRepository is autowired into the class to handle the CRUD operations by Spring.
     * @param repository the repository for handling CRUD operations on Ingredient objects
     * @see IngredientRepository
     */
    @Autowired
    public IngredientService(IngredientRepository repository) {
        this.repository = repository;
    }

    /**
     * Method for finding an Ingredient object by id
     * The ingredient object is fetched from the database.
     *
     * @param id the id of the Ingredient object
     * @return an Optional of Ingredient object
     */
    public Optional<Ingredient> getObjectFromDatabase(Long id) {
        if (id <= 0) {
            throw new ServiceException(INVALID_OBJECT_ID, id);
        }
        return repository.findById(id);
    }

    public Optional<Ingredient> getObjectFromDatabase(String name) {
            return repository.findByName(name);
    }

    /**
     * Method for finding all Ingredient objects.
     * The ingredient objects are fetched from the database.
     *
     * @return an Iterable of Ingredient objects
     */
    @Transactional
    public Iterable<Ingredient> getAllObjectsFromDatabase() {
        try {
            return repository.findAll();
        } catch (RuntimeException e) {
            throw new ServiceException(RETRIEVAL_ERROR, 0L, e);
        }
    }

    /**
     * Method for saving an Ingredient object
     * The ingredient object is saved to the database. If any exceptions occur, they are caught and rethrown as a ServiceException.
     *
     * @param entity the Ingredient object to be saved
     * @return the saved Ingredient object
     */
    @Transactional
    public Ingredient saveObjectToDatabase(Ingredient entity) {
        try {
            /*
            repository.save(entity) wil update the entity if it already exists in the database,
            which is not the desired behavior. Therefore, we need to check if the entity already exists in the database.
            */
            Iterable<Ingredient> retrievedEntities = repository.findAll();
            for (Ingredient ingredient : retrievedEntities) {
                if (entity.equals(ingredient)) {
                    throw new ServiceException(DUPLICATE_OBJECT_PASSED_TO_SERVICE, entity.getName());
                }
            }
            return repository.save(entity); // If the entity does not exist in the database, it will be saved.
        } catch (Exception e) {
            if (e instanceof InvalidDataAccessApiUsageException) {
                throw new ServiceException(INVALID_ARGUMENTS, entity.getName(), e);
            }
            if (entity == null || entity.getName().isEmpty()) {
                throw new ServiceException(EMPTY_OBJECT_PASSED_TO_SERVICE, 0L, e);
            } else {
                throw new ServiceException(FAILED_TO_SAVE_OBJECT, entity.getName(), e);
            }
        }
    }

    /**
     * <p>Method for saving a list of Ingredient objects</p>
     * If any exceptions occur, they are caught and rethrown as a ServiceException.
     *
     * @param entities the Iterable of Ingredient objects to be saved
     */
    @Transactional
    public void saveListOfObjectsToDatabase(Iterable<Ingredient> entities) {
        try {
            Iterable<Ingredient> retrievedEntities = repository.findAll();
            for (Ingredient databaseEntity: retrievedEntities) {
                for (Ingredient ingredient : entities) {
                    if (databaseEntity.equals(ingredient)) {
                        throw new ServiceException(DUPLICATE_OBJECT_PASSED_TO_SERVICE, ingredient.getName());
                    }
                }
            }
            repository.saveAll(entities);
        } catch (RuntimeException e) {
            throw new ServiceException(FAILED_TO_SAVE_OBJECT, entities.iterator().next().getName(), e);
        }
    }

    /**
     * Method for updating an Ingredient object
     * <p></p>
     * - The method can throw an InvalidDataAccessApiUsageException if the arguments are invalid,
     * this will be caught and rethrown as a ServiceException along with the original exception.
     *
     * @param updatedEntity the updated Ingredient object
     */
    @Transactional
    public void updateObjectInDatabase(Ingredient updatedEntity) {
        try {
            Optional<Ingredient> retrievedIngredient = repository.findByName(updatedEntity.getName());
            if (retrievedIngredient.isPresent() && retrievedIngredient.get().equals(updatedEntity)) {
                Ingredient ingredient = retrievedIngredient.get();
                ingredient.setDefaultAmount(updatedEntity.getDefaultAmount());
                ingredient.setUnit(updatedEntity.getUnit());
                repository.save(ingredient);
            } else {
                throw new ServiceException(FAILED_TO_UPDATE_OBJECT, updatedEntity.getName());
            }
        } catch (InvalidDataAccessApiUsageException e) {
            throw new ServiceException(INVALID_ARGUMENTS, updatedEntity.getName(), e);
        }
    }

    /**
     * Method for deleting an Ingredient object by id
     * The ingredient object is deleted from the database.
     *
     * @param id the id of the Ingredient object to be deleted
     */
    @Transactional
    public void removeObjectFromDatabase(Long id) {
        if (repository.findById(id).isPresent()) {
            repository.deleteById(id);
        } else {
            throw new ServiceException(FAILED_TO_DELETE_OBJECT, id);
        }
    }

    /**
     * Method for deleting an Ingredient object
     * The ingredient object is deleted from the database.
     *
     * @param entity the Ingredient object to be deleted
     */
    @Transactional
    public void removeObjectFromDatabase(Ingredient entity) {
        if (repository.findByName(entity.getName()).isPresent()) {
            repository.delete(entity);
        } else {
            throw new ServiceException(FAILED_TO_DELETE_OBJECT, entity.getName());
        }
    }
}
