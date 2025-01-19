package no.ntnu.idatt1005.model.repo;

import java.util.Optional;
import no.ntnu.idatt1005.model.data.entities.FridgeElement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repository interface for accessing and managing {@link FridgeElement} entities in the database.
 * This interface extends {@link JpaRepository}, leveraging Spring Data JPA to
 * provide default database operations.
 * Custom repository operations for FridgeElement entities can be defined here.
 */

@Repository
public interface FridgeRepository extends JpaRepository<FridgeElement, Long> {

    /**
     * Finds a {@link FridgeElement} by its name.
     * This method provides a convenient way to retrieve a fridge element based on its unique name.
     * The result is wrapped in an {@link Optional} to handle the possibility that no
     * entity may be found with the given name.
     *
     * @param ingredientName The name of the fridge element to find.
     * @return An {@link Optional} containing the found {@link FridgeElement},
     * or an empty {@link Optional} if no element is found.
     */
    Optional<FridgeElement> findByName(String ingredientName);
}
