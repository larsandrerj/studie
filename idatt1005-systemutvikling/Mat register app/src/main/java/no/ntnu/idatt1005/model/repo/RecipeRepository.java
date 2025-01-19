package no.ntnu.idatt1005.model.repo;

import java.util.Optional;
import no.ntnu.idatt1005.model.data.entities.Recipe;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Interface for RecipeRepository
 * Defines methods for defining custom CRUD operations on Recipe objects.
 * The interface extends CrudRepository which provides basic CRUD operations.
 * Any custom operations can be defined here.
 */

@Repository
public interface RecipeRepository extends CrudRepository<Recipe, Long> {

    Optional<Recipe> findByName(String recipeName);
}
