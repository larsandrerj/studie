package edu.ntnu.stud.model.engine;

import edu.ntnu.stud.controller.ChaosGameFileHandler;
import edu.ntnu.stud.model.linalg.Complex;
import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import org.junit.jupiter.api.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;

import static org.junit.jupiter.api.Assertions.*;

class ChaosGameFileHandlerTest {

  ChaosGameFileHandler gameFileHandler;

  @BeforeEach
  void setUp() {
    gameFileHandler = new ChaosGameFileHandler();
  }

    @Test
    @DisplayName("Test if helper method doubleArrayToString works")
    void doubleArrayToStringTest() {
      String returnedString = gameFileHandler.doubleArrayToString(new double[]{1.33, 2, 3, 4});
      String expectedString = "1.33, 2.0, 3.0, 4.0";

      assertEquals(expectedString, returnedString);
    }

    @Test
    @DisplayName("Test if helper method doubleArrayToString returns an empty string if the input array is empty")
    void doubleArrayToStringTestEmptyString(){
    double[] emptyArray = new double[0];
    String returnedString = gameFileHandler.doubleArrayToString(emptyArray);
    assertEquals(returnedString, "");
    }

    @Nested
    class createFileTests {
      @BeforeEach
      void setUpFileTester() {
        try {
          Files.createDirectories(Path.of("src/main/resources/createFileTests"));
        } catch (Exception e) {
          System.err.println("Failed to create directory!" + e.getMessage());
        }
      }

      @AfterEach
      void tearDown() {
        try {
          Files.walk(Path.of("src/main/resources/createFileTests"))
              .sorted(Comparator.reverseOrder())
              .forEach(file -> {
                try {
                  Files.delete(file);
                } catch (IOException e) {
                  System.err.println("Failed to delete " + file + ": " + e.getMessage());
                }
              });
        } catch (Exception e) {
          System.err.println("Failed to delete directory" + e.getMessage());
        }
      }

      @Test
      @DisplayName("Test if the path of a file text exist is used as a parameter the function returns false")
      void createFileExistingPath() {
        String existingPath = "src/main/resources/FileHandlerTestMaterial/AffineTransformationTest.txt";

        String typeOfTransformation = "Julia";
        double[][] values = new double[][]{{1, 1}, {1, 1}, {1, 1}};

        assertFalse(gameFileHandler.createFile(existingPath, values, typeOfTransformation));
      }

      @Test
      @DisplayName("Test if the createFile method can create a JuliaFile")
      void createFileJulia() {

        String path = "src/main/resources/createFileTests/JuliaFile";

        String typeOfTransformation = "Julia";
        double[][] values = new double[][]{{1, 1}, {1, 1}, {1, 1}};

        assertTrue(gameFileHandler.createFile(path, values, typeOfTransformation));

        File file = new File(path);
        assertTrue(file.exists());
      }

      @Test
      @DisplayName("Test if the createFile method can create a AffineFile")
      void createFileAffine() {

        String path = "src/main/resources/createFileTests/AffineFile";

        String typeOfTransformation = "Affine";
        double[][] values = new double[][]{{1, 1}, {1, 1}, {1, 1, 1, 1, 1, 1}};

        assertTrue(gameFileHandler.createFile(path, values, typeOfTransformation));

        File file = new File(path);
        assertTrue(file.exists());
      }

      @Test
      @DisplayName("Test if the method returns false if the type of Transformation is not allowed")
      void createFileIncorrectTransformationType() {
        String path = "src/main/resources/createFileTests/AffineFile";

        //non supported transformation
        String typeOfTransformation = "Affine3D";
        double[][] values = new double[][]{{1, 1}, {1, 1}, {1, 1, 1, 1, 1, 1}};

        assertFalse(gameFileHandler.createFile(path, values, typeOfTransformation));
      }
    }


    @Test
    @DisplayName("Positive test to check id a String gets converted to doubles")
    public void StringToDoublesArrayTestsPositive() {
      String stringOfDoubles = " 0.3, 0.4,0.5 ";
      double[] doubles = gameFileHandler.stringToDoublesArray(stringOfDoubles);

      double[] expectedDoubles = {0.3, 0.4, 0.5};

      for (int i = 0; i < doubles.length; i++) {
        assertEquals(doubles[i], expectedDoubles[i]);
      }
    }

    @Test
    @DisplayName("Test if method returns an empty array when there are no double elements to parse")
    public void StringToDoublesArrayEmptyArray() {
      String stringWithNoDoubles = "String with no doubles";

      double[] doubles = gameFileHandler.stringToDoublesArray(stringWithNoDoubles);

      double[] expectedArray = {};

      assertEquals(doubles.length, expectedArray.length);
    }

    @Test
    @DisplayName("Test if method works with int without a decimal point (example 1.0 = 0)")
    public void StringToDoublesArrayEmptyInt() {

      String stringWithInt = "1,2,3";
      double[] returnedDoubles = gameFileHandler.stringToDoublesArray(stringWithInt);

      double[] expectedDoubles = {1.0, 2.0, 3.0};

      for (int i = 0; i < expectedDoubles.length; i++) {
        assertEquals(returnedDoubles[i], expectedDoubles[i]);
      }
  }

  @Nested
  class doublesArrayToVectorTests {

    @Test
    @DisplayName("Test if method returns correct vector")
    public void doublesArrayToVectorPositive() {
      double[] doubles = {1, 1};
      Vector2D returnedVector = gameFileHandler.doublesArrayToVector(doubles);

      assertEquals(returnedVector.getX0(), doubles[0]);
      assertEquals(returnedVector.getX1(), doubles[1]);

    }

    @Test
    @DisplayName("Test if method throws a IllegalArgumentException when array input is incorrect length")
    public void doublesArrayToVectorException() {
      double[] tooBigArray = {1, 2, 3};

      assertThrows(
          IllegalArgumentException.class,
          () -> {
            Vector2D vector = gameFileHandler.doublesArrayToVector(tooBigArray);
          }
      );
    }
  }

  @Nested
  class doublesArrayToAffineTransformationTests {

    @Test
    @DisplayName("Test if method works")
    public void doublesArrayToAffineTransformationPositive() {
      double[] arrayToBeInputted = {1, 2, 3, 4, 5, 6};

      Matrix2x2 expectedMatrix = new Matrix2x2(1, 2, 3, 4);

      Vector2D expectedVector = new Vector2D(5, 6);

      Vector2D pointForTransformation = new Vector2D(7, 8);

      AffineTransform2D expectedAffineTransform = new AffineTransform2D(expectedMatrix, expectedVector);

      AffineTransform2D returnedAffineTransform = gameFileHandler.doublesArrayToAffineTransformation(arrayToBeInputted);

      Vector2D expectedTransformation = expectedAffineTransform.transform(pointForTransformation);

      Vector2D returnedTransformation = returnedAffineTransform.transform(pointForTransformation);

      assertEquals(expectedTransformation.getX0(), returnedTransformation.getX0());
      assertEquals(expectedTransformation.getX1(), returnedTransformation.getX1());

    }


    @Test
    @DisplayName("Test if method throws IllegalArgumentException when array input input is incorrect length")
    public void doublesArrayToAffineTransformationException() {
      double[] incorrectLengthArray = {1, 2, 3, 4, 5, 6, 7};

      assertThrows(
          IllegalArgumentException.class,
          () -> {
            AffineTransform2D affineTransform2D = gameFileHandler.doublesArrayToAffineTransformation(incorrectLengthArray);
          }
      );
    }
  }

  @Nested
  class doubleToJuliaTransformationTest {
    @Test
    @DisplayName("Test if method works")
    public void doubleToJuliaTransformationPositive() {
      double[] doublesToBeInputted = {1, 2};

      JuliaTransform2D returnedTransform = gameFileHandler.doubleToJuliaTransformation(doublesToBeInputted);


      Complex complexPoint = new Complex(3, 4);

      Vector2D expectedTransformation = new Vector2D(1.55, 0.64);

      Vector2D returnedTransformation = returnedTransform.transform(complexPoint);

      assertEquals(expectedTransformation.getX0(), Math.abs(returnedTransformation.getX0()), 0.01);
      assertEquals(expectedTransformation.getX1(), Math.abs(returnedTransformation.getX1()), 0.01);


    }

    @Test
    @DisplayName("Test if method throws IllegalArgumentException when array input input is incorrect length")
    public void doubleToJuliaTransformationException() {
      double[] incorrectLengthArray = {1, 2, 3};

      assertThrows(
          IllegalArgumentException.class,
          () -> {
            JuliaTransform2D juliaTransform2D = gameFileHandler.doubleToJuliaTransformation(incorrectLengthArray);
          }
      );

    }
  }

  @Nested
  class readTest {
    @Test
    @DisplayName("Check if readFromFile can produce a chaosGameDescription with subsequent affine transformations list")
    public void readFromFileAffine() throws FileNotFoundException {
      Vector2D expectedMinVector = new Vector2D(0, 0);
      Vector2D expectedMaxVector = new Vector2D(1, 1);

      int expectedLengthOfList = 3;

      // file created just for testing purposes in resources
      ChaosGameDescription returnedChaosGameDescription = gameFileHandler.readFromFile(
          "src/main/resources/FileHandlerTestMaterial/AffineTransformationTest.txt");

      assertEquals(expectedMinVector.getX0(), returnedChaosGameDescription.minCords().getX0());
      assertEquals(expectedMinVector.getX1(), returnedChaosGameDescription.minCords().getX1());

      assertEquals(expectedMaxVector.getX0(), returnedChaosGameDescription.maxCords().getX0());
      assertEquals(expectedMaxVector.getX1(), returnedChaosGameDescription.maxCords().getX1());

      assertEquals(expectedLengthOfList, returnedChaosGameDescription.transforms().size());

    }

    @Test
    @DisplayName("Check if readFromFile can produce a chaosGameDescription with subsequent Julia transformations list")
    public void readFromFileJulia() throws FileNotFoundException {
      Vector2D expectedMinVector = new Vector2D(-1.6, -1);
      Vector2D expectedMaxVector = new Vector2D(1.6, 1);

      int expectedLengthOfList = 1;

      // file created just for testing purposes in resources
      ChaosGameDescription returnedChaosGameDescription = gameFileHandler.readFromFile(
          "src/main/resources/FileHandlerTestMaterial/JuliaTransformationTest.txt");

      assertEquals(expectedMinVector.getX0(), returnedChaosGameDescription.minCords().getX0());
      assertEquals(expectedMinVector.getX1(), returnedChaosGameDescription.minCords().getX1());

      assertEquals(expectedMaxVector.getX0(), returnedChaosGameDescription.maxCords().getX0());
      assertEquals(expectedMaxVector.getX1(), returnedChaosGameDescription.maxCords().getX1());

      assertEquals(expectedLengthOfList, returnedChaosGameDescription.transforms().size());

    }

    @Test
    @DisplayName("Test if the method ignores comments for julia transformation")
    public void commentTestJuliaPositive() throws FileNotFoundException {
      Vector2D expectedMinVector = new Vector2D(-1.6, -1);
      Vector2D expectedMaxVector = new Vector2D(1.6, 1);

      int expectedLengthOfList = 1;

      // file created just for testing purposes in resources
      ChaosGameDescription returnedChaosGameDescription = gameFileHandler.readFromFile(
          "src/main/resources/FileHandlerTestMaterial/JuliaTransformationTestWithComments.txt");

      assertEquals(expectedMinVector.getX0(), returnedChaosGameDescription.minCords().getX0());
      assertEquals(expectedMinVector.getX1(), returnedChaosGameDescription.minCords().getX1());

      assertEquals(expectedMaxVector.getX0(), returnedChaosGameDescription.maxCords().getX0());
      assertEquals(expectedMaxVector.getX1(), returnedChaosGameDescription.maxCords().getX1());

      assertEquals(expectedLengthOfList, returnedChaosGameDescription.transforms().size());

    }

    @Test
    @DisplayName("Test if the method ignores comments for Affine Transformations")
    public void commentTestAffinePositive() throws FileNotFoundException {
      Vector2D expectedMinVector = new Vector2D(0, 0);
      Vector2D expectedMaxVector = new Vector2D(1, 1);

      int expectedLengthOfList = 3;

      // file created just for testing purposes in resources
      ChaosGameDescription returnedChaosGameDescription = gameFileHandler.readFromFile(
          "src/main/resources/FileHandlerTestMaterial/AffineTransformationTestWithComments.txt");

      assertEquals(expectedMinVector.getX0(), returnedChaosGameDescription.minCords().getX0());
      assertEquals(expectedMinVector.getX1(), returnedChaosGameDescription.minCords().getX1());

      assertEquals(expectedMaxVector.getX0(), returnedChaosGameDescription.maxCords().getX0());
      assertEquals(expectedMaxVector.getX1(), returnedChaosGameDescription.maxCords().getX1());

      assertEquals(expectedLengthOfList, returnedChaosGameDescription.transforms().size());
    }


    @Test
    @DisplayName("Test if method throws exception when path is incorrect")
    public void readFromFileFileNotFound() {
      String incorrectPath = "nonExistentFile.txt";

      assertThrows(
          FileNotFoundException.class,
          () -> gameFileHandler.readFromFile(incorrectPath)
      );
    }


    @Test
    @DisplayName("Test if method throws exception when file structure is incorrect")
    public void readFromFileException() {
      String incorrectPath = "FileHandlerTestMaterial/UnstructuredFileTest.txt";

      assertThrows(
          FileNotFoundException.class,
          () -> gameFileHandler.readFromFile(incorrectPath)
      );
    }
  }


}