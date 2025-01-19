package no.ntnu.idatt1005.model.repo;

import no.ntnu.idatt1005.model.data.entities.PurchasePlan;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import org.springframework.stereotype.Repository;
/**
 * Repository interface for accessing and managing {@link PurchasePlan} entities in the database.
 * Extends {@link JpaRepository} to provide standard CRUD operations and the ability
 * to extend with custom methods.
 */
@Repository
public interface PurchasePlanRepository extends JpaRepository<PurchasePlan, Long> {
    Optional<PurchasePlan> findByName(String name);
}
