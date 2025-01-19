package no.ntnu.idatt1005.model.repo;

import java.util.Optional;
import no.ntnu.idatt1005.model.data.entities.PurchasePlan;
import no.ntnu.idatt1005.model.data.entities.RecipeIngredientElement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repository interface for accessing and managing {@link RecipeIngredientElement}
 * entities in the database.
 * It extends the {@link JpaRepository} interface,
 * which provides standard CRUD operations and the framework for custom repository methods.
 */
@Repository
public interface RecipeIngredientElementRepository
    extends JpaRepository<RecipeIngredientElement, Long> {
    Optional<RecipeIngredientElement> findByName(String name);
}