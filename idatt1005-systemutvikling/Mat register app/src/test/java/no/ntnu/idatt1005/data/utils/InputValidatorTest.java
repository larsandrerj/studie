package no.ntnu.idatt1005.data.utils;

import static org.junit.Assert.assertThrows;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;


import no.ntnu.idatt1005.model.utils.InputValidator;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;


public class InputValidatorTest {

    private static String inputOfLetters;
    private static String inputOfLettersWithSpace;
    private static String inputOfNumbers;
    private static String inputOfDouble;
    private static String inputOfSpecialCharacters;
    private static String inputOfLettersAndNumbers;
    private static String inputOfLettersAndSpecialCharacters;

    @BeforeEach
    public void setUp() {
        inputOfLetters = "abc";
        inputOfLettersWithSpace = "abc def";
        inputOfNumbers = "123";
        inputOfDouble = "123.0";
        inputOfSpecialCharacters = "!@#";
        inputOfLettersAndNumbers = "abc and 1";
        inputOfLettersAndSpecialCharacters = "abc!@#";
    }

    @Nested
    @DisplayName("Positive tests")
    public class positiveTests {

      @Test
      @DisplayName("validateInt")
      public void validateInt() {
        assertEquals(123, InputValidator.validateInt(inputOfNumbers));
      }

      @Test
      @DisplayName("validateDouble")
      public void validateDouble() {
        assertEquals(123.0, InputValidator.validateDouble("123.0"));
      }

      @Test
      @DisplayName("validateString")
      public void validateString() {
        assertEquals("abc and 1", InputValidator.validateString(inputOfLettersAndNumbers));
      }

      @Test
      @DisplayName("validateName")
      public void validateName() {
        assertEquals("abc", InputValidator.validateName(inputOfLetters));
        assertEquals("abc def", InputValidator.validateName(inputOfLettersWithSpace));
      }

    }
    @Nested
    @DisplayName("Negative tests")
    public class negativeTests {

      @Test
      @DisplayName("validateInt")
      public void validateInt() {
        assertEquals(-1, InputValidator.validateInt(inputOfLetters));
        assertEquals(-1, InputValidator.validateInt(inputOfDouble));
        assertEquals(-1, InputValidator.validateInt(inputOfSpecialCharacters));
      }

      @Test
      @DisplayName("validateDouble")
      public void validateDouble() {
        assertEquals(-1, InputValidator.validateDouble(inputOfLetters));
        assertEquals(-1, InputValidator.validateDouble(inputOfSpecialCharacters));
        assertEquals(-1, InputValidator.validateDouble(inputOfLettersAndSpecialCharacters));
      }

      @Test
      @DisplayName("validateString")
      public void validateString() {
        Assertions.assertThrows(IllegalArgumentException.class, () -> InputValidator.validateString(""));
      }
    }
}
