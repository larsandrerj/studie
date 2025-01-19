package no.ntnu.idatt1005.model.services;

import static no.ntnu.idatt1005.model.exceptions.ErrorCode.DUPLICATE_OBJECT_PASSED_TO_SERVICE;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_DELETE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_SAVE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_ARGUMENTS;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_OBJECT_ID;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.RETRIEVAL_ERROR;

import jakarta.transaction.Transactional;
import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.repo.RecipeIngredientElementRepository;
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
public class RecipeIngredientElementService {
  private final RecipeIngredientElementRepository repository;

  /**
   * Constructor for IngredientService
   * The ingredientRepository is autowired into the class to handle the CRUD operations by Spring.
   * @param repository the repository for handling CRUD operations on Ingredient objects
   * @see RecipeIngredientElementRepository
   */
  @Autowired
  public RecipeIngredientElementService(RecipeIngredientElementRepository repository) {
    this.repository = repository;
  }

  /**
   * Method for finding an Ingredient object by id
   * The ingredient object is fetched from the database.
   *
   * @param id the id of the Ingredient object
   * @return an Optional of Ingredient object
   */
  @Transactional
  public Optional<RecipeIngredientElement> getObjectFromDatabase(Long id) {
    if (id <= 0) {
      throw new ServiceException(INVALID_OBJECT_ID, id);
    }
    return repository.findById(id);
  }

  @Transactional
  public Optional<RecipeIngredientElement> getObjectFromDatabase(String name) {
    return repository.findByName(name);
  }

  /**
   * Method for finding all Ingredient objects.
   * The ingredient objects are fetched from the database.
   *
   * @return an Iterable of Ingredient objects
   */
  @Transactional
  public Iterable<RecipeIngredientElement> getAllObjectsFromDatabase() {
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
  public RecipeIngredientElement saveObjectToDatabase(RecipeIngredientElement entity) {
    try {
            /*
            repository.save(entity) wil update the entity if it already exists in the database,
            which is not the desired behavior. Therefore, we need to check if the entity already exists in the database.
            */
      Iterable<RecipeIngredientElement> retrievedEntities = repository.findAll();
      for (RecipeIngredientElement ingredient : retrievedEntities) {
        if (entity.equals(ingredient)) {
          throw new ServiceException(DUPLICATE_OBJECT_PASSED_TO_SERVICE, entity.getName());
        }
      }
      return repository.save(entity); // If the entity does not exist in the database, it will be saved.
    } catch (Exception e) {
      if (e instanceof InvalidDataAccessApiUsageException) {
        throw new ServiceException(INVALID_ARGUMENTS, entity.name, e);
      }
      throw new ServiceException(FAILED_TO_SAVE_OBJECT, entity.name, e);
    }
  }

  @Transactional
  public void saveListOfObjectsToDatabase(Iterable<RecipeIngredientElement> entities) {
    try {
      Iterable<RecipeIngredientElement> retrievedEntities = repository.findAll();
      for (RecipeIngredientElement databaseEntity: retrievedEntities) {
        for (RecipeIngredientElement ingredient : entities) {
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

  @Transactional
  public void updateObjectInDatabase(RecipeIngredientElement updatedEntity) {
    try {
      // TODO: Necessary?
    } catch (InvalidDataAccessApiUsageException e) {
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
  public void removeObjectFromDatabase(RecipeIngredientElement entity) {
    if (repository.findByName(entity.getName()).isPresent()) {
      repository.delete(entity);
    } else {
      throw new ServiceException(FAILED_TO_DELETE_OBJECT, entity.getName());
    }
  }
}