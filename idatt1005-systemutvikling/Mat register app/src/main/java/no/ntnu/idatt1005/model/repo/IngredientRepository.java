package no.ntnu.idatt1005.model.repo;

import java.util.Optional;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Interface for IngredientRepository
 * Defines methods for defining custom CRUD operations on Ingredient objects.
 * The interface extends CrudRepository which provides basic CRUD operations.
 * Any custom operations can be defined here.
 */
@Repository
public interface IngredientRepository extends JpaRepository<Ingredient, Long> {
    Optional<Ingredient> findByName(String ingredientName);
}
