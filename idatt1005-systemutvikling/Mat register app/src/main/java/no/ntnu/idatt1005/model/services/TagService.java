package no.ntnu.idatt1005.model.services;

import static no.ntnu.idatt1005.model.exceptions.ErrorCode.DUPLICATE_OBJECT_PASSED_TO_SERVICE;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_DELETE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.FAILED_TO_UPDATE_OBJECT;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_ARGUMENTS;
import static no.ntnu.idatt1005.model.exceptions.ErrorCode.INVALID_OBJECT_ID;

import jakarta.transaction.Transactional;
import java.util.Optional;
import no.ntnu.idatt1005.model.exceptions.ServiceException;
import no.ntnu.idatt1005.model.data.entities.Tag;
import no.ntnu.idatt1005.model.repo.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.stereotype.Service;

/**
 * <p>Class for handling business logic for Tag objects.</p>
 * The class will handle the following CRUD operations:
 * <ul>
 *     <li>Find by id</li>
 *     <li>Find by object</li>
 *     <li>Find all</li>
 *     <li>Save</li>
 *     <li>Update</li>
 *     <li>Delete by id</li>
 *     <li>Delete object</li>
 * </ul>
 *
 * The tagRepository is autowired into the class to handle the CRUD operations.
 * <p>Any exceptions that occur during the CRUD operations will be caught and rethrown as a ServiceException
 * with a corresponding error code.</p>
 * @see TagRepository
 * @see Tag
 * @see no.ntnu.idatt1005.model.exceptions.ErrorCode
 **/
@Service
public class TagService {
    TagRepository tagRepository;

    /**
     * Constructor for TagService
     * The tagRepository is autowired into the class to handle the CRUD operations by Spring.
     * @param tagRepository the repository for handling CRUD operations on Tag objects
     * @see TagRepository
     */
    @Autowired
    public TagService(TagRepository tagRepository) {
        this.tagRepository = tagRepository;
    }

    /**
     * Method for finding a Tag object by id
     * If id is less than or equal to 0, a ServiceException is thrown.
     *
     * @param id
     * @return an Optional of Tag object
     */
    @Transactional
    public Optional<Tag> getObjectFromDatabase(Long id) {
        if (id <= 0) {
            throw new ServiceException(INVALID_OBJECT_ID, id);
        }
        return tagRepository.findById(id);
    }

    @Transactional
    public Optional<Tag> getObjectFromDatabase(String name) {
        return tagRepository.findByName(name);
    }

  /**
   * Method for finding a Tag object by name
   *
   * @param entity the Tag object to find
   * @return an Optional of Tag object
   */
    @Transactional
    public Optional<Tag> getObjectFromDatabase(Tag entity) {
        return tagRepository.findByName(entity.getName());
    }

    /**
     * Method for returning all Tag objects
     *
     * @return an Iterable of Tag objects
     */
    @Transactional
    public Iterable<Tag> getAllObjectsFromDatabase() {
        return tagRepository.findAll();
    }

    /**
     * Method for saving a Tag object
     * The tag object is saved to the database. If a duplicate tag is passed,
     * a ServiceException gets thrown.
     *
     * @param entity the Tag object to be saved
     */
    @Transactional
    public void saveObjectToDatabase(Tag entity) {
        Iterable<Tag> tags = tagRepository.findAll();
        for (Tag tag : tags) {
            if (tag.getName().equals(entity.getName())) {
                throw new ServiceException(DUPLICATE_OBJECT_PASSED_TO_SERVICE, entity.getName());
            }
        }
        tagRepository.save(entity);
    }

    /**
     * Method for updating a Tag object
     * The tag object is updated in the database. If the tag object does not exist in the database,
     * a ServiceException is thrown.
     * <p></p>
     * The method can throw an InvalidDataAccessApiUsageException
     * if the arguments are invalid. The exception is caught and
     * rethrown as a ServiceException.
     *
     * @param entity the Tag object to be updated
     * @return the updated Tag object
     */
    @Transactional
    public Tag updateObjectInDatabase(Tag entity) {
        try {
            Optional<Tag> tag = tagRepository.findById(entity.getId());
            if (tag.isPresent() && tag.get().getName().equals(entity.getName())) {
                tag.get().setCategory(entity.getCategory());
                return tagRepository.save(tag.get());
            } else {
                throw new ServiceException(FAILED_TO_UPDATE_OBJECT, entity.getName());
            }
        } catch (InvalidDataAccessApiUsageException e) {
            throw new ServiceException(INVALID_ARGUMENTS, entity.getName(), e);
        }
    }

    /**
     * Method for deleting a Tag object by id
     * The tag object is deleted from the database.
     * If id is less than or equal to 0, a ServiceException is thrown.
     * If the tag object does not exist in the database, a ServiceException is thrown.
     *
     * @param id the id of the Tag object to be deleted
     */
    @Transactional
    public void removeObjectFromDatabase(Long id) {
        if (id <= 0) {
            throw new ServiceException(INVALID_OBJECT_ID, id);
        }
        if (tagRepository.findById(id).isPresent()) {
            tagRepository.deleteById(id);
        } else {
            throw new ServiceException(FAILED_TO_DELETE_OBJECT, id);
        }
    }

    /**
     * Method for deleting a Tag object
     * The tag object is deleted from the database.
     * If the tag object does not exist in the database, a ServiceException is thrown.
     *
     * @param entity the Tag object to be deleted
     */
    @Transactional
    public void removeObjectFromDatabase(Tag entity) {
        if (tagRepository.findByName(entity.getName()).isPresent()) {
            tagRepository.delete(entity);
        } else {
            throw new ServiceException(FAILED_TO_DELETE_OBJECT, entity.getName());
        }
    }
}
