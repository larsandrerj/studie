package no.ntnu.idatt1005.model.exceptions;

/**
 * Enumerates error codes for CRUD (Create, Read, Update, Delete) operations,
 * providing a standard set of errors that can be used throughout the application
 * to handle exceptions and inform users about the nature of the error.
 */
public enum ErrorCode {
    OBJECT_NOT_FOUND(100, "OBJECT_NOT_FOUND", "Object not found in database"),
    EMPTY_OBJECT_PASSED_TO_SERVICE(101, "EMPTY_OBJECT_PASSED_TO_SERVICE", "The object you are trying to save is empty"),
    FAILED_TO_SAVE_OBJECT(102, "FAILED_TO_SAVE_OBJECT", "Failed to save object to database"),
    DUPLICATE_OBJECT_PASSED_TO_SERVICE(103, "DUPLICATE_OBJECT_PASSED_TO_SERVICE", "The object you are trying to save already exists in the database"),
    INVALID_OBJECT_PASSED_TO_SERVICE(104,"INVALID_OBJECT_PASSED_TO_SERVICE", "The object you are trying to save contains invalid data"),
    INVALID_OBJECT_ID(105, "INVALID_OBJECT_ID", "The id you are trying to use is invalid"),
    FAILED_TO_RETRIEVE_OBJECT(106,"FAILED_TO_RETRIEVE_OBJECT",  "Failed to retrieve object from database"),
    FAILED_TO_UPDATE_OBJECT(107, "FAILED_TO_UPDATE_OBJECT", "The object you are trying to update does not exist in the database"),
    FAILED_TO_DELETE_OBJECT(108, "FAILED_TO_DELETE_OBJECT", "The object you are trying to delete does not exist in the database"),
    ENTITY_RELATIONSHIP_CONFLICT(109, "ENTITY_RELATIONSHIP_CONFLICT", "The object you are trying to save contains items that are not in the database(f.ex. ingredients in a recipe)"),
    INVALID_QUERY(110, "INVALID_QUERY", "The query you are trying to execute is invalid"),
    INVALID_ARGUMENTS(111, "INVALID_ARGUMENTS", "The arguments you are trying to pass are invalid"),
    RETRIEVAL_ERROR(112, "RETRIEVAL_ERROR", "An error occurred while retrieving data from the database"),
    SERVICE_ERROR(113, "SERVICE_ERROR", "An error occurred in the service");
    private final int id;
    private final String error;
    private final String userMessage;

    /**
     * Constructs an ErrorCode enum with an identifier, error key, and a user-friendly message.
     *
     * @param id The unique identifier for the error.
     * @param error The error key used for internal tracking and logging.
     * @param userMessage The message intended to inform users about the nature of the error.
     */


    ErrorCode(int id, String error, String userMessage) {
        this.id = id;
        this.error = error;
        this.userMessage = userMessage;
    }
    /**
     * Retrieves the identifier of the error.
     *
     * @return The identifier of the error.
     */

    public int getId() {
        return id;
    }

    /**
     * Retrieves the error key associated with this error code.
     *
     * @return The error key.
     */
    public String getError() {
        return error;
    }

    /**
     * Retrieves the user-friendly message associated with this error code.
     *
     * @return The user-friendly message.
     */
    public String getUserMessage() {
        return userMessage;
    }
}
