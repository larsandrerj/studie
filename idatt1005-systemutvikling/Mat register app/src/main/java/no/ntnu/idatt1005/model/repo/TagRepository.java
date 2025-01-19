package no.ntnu.idatt1005.model.repo;

import no.ntnu.idatt1005.model.data.entities.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import org.springframework.stereotype.Repository;
/**
 * Repository interface for accessing and managing {@link Tag} entities in the database.
 * It extends {@link JpaRepository}, providing standard
 * CRUD operations along with the capability to implement custom query methods.
 */
@Repository
public interface TagRepository extends JpaRepository<Tag, Long> {

    Optional<Tag> findByName(String name);
}
