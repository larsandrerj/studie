package no.ntnu.idatt1005.model.utils;

/**
 * <h1>Input Validator.</h1>
 * <p>This class represents all in input validators. <br>
 * The class contains methods to validate input of type int, double, string, and name</p>
 */

public class InputValidator {

  /**
   * Validates an integer input.
   *
   * @param input the input to be validated
   * @return the input if it is a valid integer, -1 if it is not
   */
  public static int validateInt(String input) {
    try {
      return Integer.parseInt(input);
    } catch (NumberFormatException e) {
      return -1;
    }
  }

  /**
   * Validates a double input.
   *
   * @param input the input to be validated
   * @return the input if it is a valid double, -1 if it is not
   */
  public static double validateDouble(String input) {
    try {
      return Double.parseDouble(input);
    } catch (NumberFormatException e) {
      return -1;
    }
  }

  /**
   * Validates a string input.
   *
   * @param input the input to be validated
   * @return the input if it is a valid string, null if it is not
   */
  public static String validateString(String input) {
      if (!input.isBlank()) {
        return input;
      } else {
        throw new IllegalArgumentException("Invalid input");
      }
  }

  /**
   * Validates a name input.
   *
   * @param input the input to be validated
   * @return the input if it is a valid name consisting of only letters, null if it is not
   */
  public static String validateName(String input) {
    if (input.matches("[a-zA-Z ]+")) {
      return input;
    } else {
      throw new IllegalArgumentException("Invalid name");
    }
  }
}