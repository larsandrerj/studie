package no.ntnu.idatt1005.model.services;

import static no.ntnu.idatt1005.model.exceptions.ErrorCode.DUPLICATE_OBJECT_PASSED_TO_SERVICE;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.ENTITY_RELATIONSHIP_CONFLICT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_DELETE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_RETRIEVE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_UPDATE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_ARGUMENTS;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.RETRIEVAL_ERROR;

import jakarta.transaction.Transactional;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.data.entities.Recipe;
import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import no.ntnu.idatt1005.model.repo.RecipeRepository;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
/*
    TODO:
    - write exception handling for passing empty or invalid tags to recipe and ingredient
 */
/**
 * <p>Class for handling business logic for Recipe objects.</p>
 * The class will handle the following CRUD operations:
 * <ul>
 *     <li>Find by id</li>
 *     <li>Find all</li>
 *     <li>Save</li>
 *     <li>Delete by id</li>
 * </ul>
 * The recipeRepository is autowired into the class to handle the CRUD operations.
 * <p>Any exceptions that occur during the CRUD operations will be caught and rethrown as a ServiceException.</p>
 */
@Service
public class RecipeService {

    /**
     * The repository for handling CRUD operations on Recipe objects
     */
    private final RecipeRepository repository;
    private final IngredientService ingredientService;

    /**
     * Constructor for RecipeService
     * The recipeRepository is autowired into the class to handle the CRUD operations by Spring.
     * @param repository the repository for handling CRUD operations on Recipe objects
     * @see RecipeRepository
     */
    @Autowired
    public RecipeService(RecipeRepository repository, IngredientService ingredientService) {
        this.repository = repository;
        this.ingredientService = ingredientService;
    }


    /**
     * Method for finding a Recipe object by id
     *
     * @param id the id of the Recipe object
     * @return an Optional of Recipe object
     */
    public Optional<Recipe> getObjectFromDatabase(Long id) {
        try {
            return repository.findById(id);
        } catch (DataAccessException e) {
            throw new ServiceException(FAILED_TO_RETRIEVE_OBJECT, id, e);
        }
    }

    /**
     * Method for finding a Recipe object by name
     *
     * @param entity the Recipe object to find
     * @return an Optional of Recipe object
     */
    public Optional<Recipe> getObjectFromDatabase(Recipe entity) {
        try {
            return repository.findByName(entity.getName());
        } catch (DataAccessException e) {
            throw new ServiceException(FAILED_TO_RETRIEVE_OBJECT, entity.getName(), e);
        }
    }

    /**
     * Method for finding a Recipe object by name
     *
     * @param name the name of the Recipe object to find
     * @return an Optional of Recipe object
     */
    public Optional<Recipe> getObjectFromDatabase(String name) {
        try {
            return repository.findByName(name);
        } catch (DataAccessException e) {
            throw new ServiceException(FAILED_TO_RETRIEVE_OBJECT, name, e);
        }
    }

    /**
     * Method for finding all Recipe objects.
     * The recipe objects are fetched from the database.
     *
     * @return an Iterable of Recipe objects
     */
    @Transactional
    public Iterable<Recipe> getAllObjectsFromDatabase() {
        try {
            return repository.findAll();
        } catch (DataAccessException e) {
            throw new ServiceException(RETRIEVAL_ERROR, 0L, e);
        }
    }


    /**
     * Method for saving a Recipe object
     * The recipe object is saved to the database. If the recipe object contains ingredients that does not exist in the
     * ingredient database, the ingredients are saved to the database before the recipe is saved.
     * Exceptions are caught and rethrown as a ServiceException.
     *
     * PS Litt overkill å lagre ingredienser som ikke eksisterer i databasen, siden man ikke har noen funksjonalitet for å
     * legge til nye ingredienser mens man lager en oppskrift, men mulig å implementere i fremtiden + det tok dritlang tid
     * å få til å funke så jeg nekter å fjerne det.
     *
     * @param entity the Recipe object to be saved
     */

    /* ERROR:
       Du må lagre faktiske ingredienser her selv om recipen bare inneholder navnene på ingrediensene. det hjelper ikke å lagre RecipeIngredientElement-objekter.
     */
    @Transactional
    public Recipe saveObjectToDatabase(Recipe entity) {
        try {
            // Throw exception if the recipe already exists.
            if (repository.findByName(entity.getName()).isPresent()) {
                throw new ServiceException(DUPLICATE_OBJECT_PASSED_TO_SERVICE, entity.getName());
            }
            // Retrieve a list of all known ingredients.
            Iterable<Ingredient> retrievedIngredients = ingredientService.getAllObjectsFromDatabase();
            List<RecipeIngredientElement> persistedIngredients = new ArrayList<>();
            boolean ingredientExists;
            // For every ingredient in the recipe passed to the method, check if it exists in the database.
            for (RecipeIngredientElement recipeIngredientElement : entity.getIngredients()) {
                ingredientExists = false;
                for (Ingredient retrieved : retrievedIngredients) {
                    if (retrieved.getName().equals(recipeIngredientElement.name)) {
                        if (persistedIngredients.contains(recipeIngredientElement)) {
                            throw new ServiceException(DUPLICATE_OBJECT_PASSED_TO_SERVICE, retrieved.getName());
                        }
                        persistedIngredients.add(recipeIngredientElement);
                        ingredientExists = true;
                        break;
                    }
                }
                if (!ingredientExists) {
                    throw new ServiceException(ENTITY_RELATIONSHIP_CONFLICT, recipeIngredientElement.name);
                }
            }
            entity.setIngredients(persistedIngredients);
            return repository.save(entity);

        } catch (RuntimeException e) {
                throw new ServiceException(FAILED_TO_RETRIEVE_OBJECT, entity.getName(), e);
            }
    }

    @Transactional
    public Recipe updateObjectInDatabase(Recipe entity) {
        try {
            Optional<Recipe> retrievedRecipe = repository.findByName(entity.getName());
            if (retrievedRecipe.isPresent() &&
                retrievedRecipe.get().getName().equals(entity.getName())) {
                Recipe recipe = retrievedRecipe.get();
                recipe.setIngredients(entity.getIngredients());
                recipe.setInstructions(entity.getInstructions());
                return repository.save(recipe);
            } else {
                throw new ServiceException(FAILED_TO_UPDATE_OBJECT, entity.getName());
            }
        } catch (InvalidDataAccessApiUsageException e) {
            throw new ServiceException(INVALID_ARGUMENTS, entity.getName(), e);
        }
    }

    /**
     * Method for deleting a Recipe object by id
     * The recipe object is deleted from the database.
     *
     * @param id the id of the Recipe object to be deleted
     */
    @Transactional
    public void removeObjectFromDatabase(Long id) {
        try {
            repository.deleteById(id);
        } catch (DataAccessException e) {
            throw new ServiceException(FAILED_TO_DELETE_OBJECT, id, e);
        }
    }

    /**
     * Method for deleting a Recipe object
     * The recipe object is deleted from the database.
     *
     * @param entity the Recipe object to be deleted
     */
    @Transactional
    public void removeObjectFromDatabase(Recipe entity) {
        try {
            repository.delete(entity);
        } catch (DataAccessException e) {
            throw new ServiceException(FAILED_TO_RETRIEVE_OBJECT, entity.getName(), e);
        }
    }
}