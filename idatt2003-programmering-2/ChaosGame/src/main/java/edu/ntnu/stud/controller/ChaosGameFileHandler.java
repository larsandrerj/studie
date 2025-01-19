package edu.ntnu.stud.controller;

import edu.ntnu.stud.model.engine.ChaosGameDescription;
import edu.ntnu.stud.model.linalg.Complex;
import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import edu.ntnu.stud.model.transform.AffineTransform2D;
import edu.ntnu.stud.model.transform.JuliaTransform2D;
import edu.ntnu.stud.model.transform.Transform2D;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * <h1> ChaosGameFileHandler </h1>
 * <p> This class is in charge of creating and reading files </p>
 */
public class ChaosGameFileHandler {
  /**
   * <h3> Logger for class </h3>
   */
  private static final Logger logger = LoggerFactory.getLogger(ChaosGameFileHandler.class);

  /**
   * <h2> Write to File </h2>
   * <p> This method creates a file that can be used to save a transformation locally.</p>
   *
   * @param path                 <p> The path in a string form to where you want to save the file </p>
   * @param values               <p> The values in a game description </p>
   * @param typeOfTransformation <p> The type of transformation you would like to safe </p>
   * @return <p>boolean that gives the program feedback whether the file save was successful or not </p>
   */
  public boolean createFile(String path, double[][] values, String typeOfTransformation) {

    File file = new File(path);
    if (file.exists()) {
      return false;
    }

    try (FileWriter fileWriter = new FileWriter(file);
         BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
         PrintWriter printWriter = new PrintWriter(bufferedWriter)) {

      StringBuilder stringBuilder = new StringBuilder();

      if (typeOfTransformation.equals("Julia")) {
        stringBuilder.append("Julia\n");
      } else if (typeOfTransformation.equals("Affine")) {
        stringBuilder.append("Affine2D\n");
      } else {
        return false;
      }

      Arrays.stream(values).forEach(i -> stringBuilder.append(doubleArrayToString(i)).append(System.lineSeparator()));

      printWriter.write(stringBuilder.toString());
      return true;

    } catch (IOException e) {
      logger.error(e.getMessage());
      return false;
    }
  }

  /**
   * <h2> readFromFile </h2>
   * <p> Created to make readFromFile able to tale in a string path as an argument as well as a file argument  </p>
   *
   * @param path <p> path in string form </p>
   * @return <p> ChaosGameDescription read from txt file </p>
   * @throws FileNotFoundException <p> Throws if filepath does not correlate to a file </p>
   */
  public ChaosGameDescription readFromFile(String path) throws FileNotFoundException {
    return readFromFile(new File(path));
  }

  /**
   * <h2> readFromFile </h2>
   * <p> Method that reads a chaos game description from a file </p>
   *
   * @param file <p> File to read </p>
   * @return <p> GameDescription </p>
   * @throws FileNotFoundException <p> Throws if file argument is not found </p>
   */
  public ChaosGameDescription readFromFile(File file) throws FileNotFoundException {

    if (!Files.exists(file.toPath())) {
      String warning = "File not found at path: " + file.toPath();
      logger.warn(warning);
      throw new FileNotFoundException(warning);
    }

    try (BufferedReader bufferedReader = new BufferedReader(Files.newBufferedReader(file.toPath()))) {
      String line;
      ArrayList<String> fileContentArrayList = new ArrayList<>();
      while ((line = bufferedReader.readLine()) != null) {
        if (line.contains("#")) {
          line = line.substring(0, line.indexOf("#")).trim();
        }
        if (!line.isEmpty()) {
          fileContentArrayList.add(line);
        }
      }
      Vector2D min = doublesArrayToVector(stringToDoublesArray(fileContentArrayList.get(1)));
      Vector2D max = doublesArrayToVector(stringToDoublesArray(fileContentArrayList.get(2)));
      String typeOfTransform = fileContentArrayList.get(0);

      if (typeOfTransform.equals("Affine2D")) {
        List<Transform2D> affineTransformations = new ArrayList<>();
        for (int i = 3; i < fileContentArrayList.size(); i++) {
          affineTransformations.add(doublesArrayToAffineTransformation(stringToDoublesArray(fileContentArrayList.get(i))));
        }
        return new ChaosGameDescription(min, max, affineTransformations);
      }

      if (typeOfTransform.equals("Julia")) {
        List<Transform2D> JuliaTransformations = new ArrayList<>();
        for (int i = 3; i < fileContentArrayList.size(); i++) {
          JuliaTransformations.add(doubleToJuliaTransformation(stringToDoublesArray(fileContentArrayList.get(i))));
        }
        return new ChaosGameDescription(min, max, JuliaTransformations);
      }

      String warning = "The file structure of the inputted path is not compatible!";
      logger.warn(warning);
      throw new FileNotFoundException(warning);
    } catch (IOException e) {
      logger.error(e.getMessage());
      throw new RuntimeException(e);
    }
  }

  /**
   * <h2> stringToDoublesArray </h2>
   * <p> takes a string and turns it into an array of doubles </p>
   *
   * @param string <p> String to be parsed </p>
   * @return <p> double[] array </p>
   */
  public double[] stringToDoublesArray(String string) {
    try {
      return Arrays.stream(string.split(","))
          .mapToDouble(Double::parseDouble)
          .toArray();
    } catch (NumberFormatException e) {
      logger.error(e.getMessage());
      return new double[0];
    }
  }

  /**
   * <h2> doublesArrayToVector </h2>
   * <p> Takes in a double[] and parses it to a Vector2D object </p>
   *
   * @param doubles <p> double[] array to be parsed </p>
   * @return <p> Vector from array </p>
   */
  public Vector2D doublesArrayToVector(double[] doubles) {
    if (doubles.length != 2) {
      String error = "The input array must contain 2 elements";
      logger.error(error);
      throw new IllegalArgumentException(error);
    }
    return new Vector2D(doubles[0], doubles[1]);
  }

  /**
   * <h2> doublesArrayToAffineTransformation </h2>
   * <p> Takes in a double[] and parses it to a AffineTransform2D object </p>
   *
   * @param doubles <p> doubles to be parsed </p>
   * @return <p> Affine transformation from array </p>
   */
  public AffineTransform2D doublesArrayToAffineTransformation(double[] doubles) {
    if (doubles.length != 6) {
      String error = "The input array must contain 6 elements ";
      logger.error(error);
      throw new IllegalArgumentException(error);
    }
    return new AffineTransform2D(new Matrix2x2(doubles[0], doubles[1], doubles[2], doubles[3]), new Vector2D(doubles[4], doubles[5]));
  }

  /**
   * <h2> doubleToJuliaTransformation </h2>
   * <p> Takes in a double[] and parses it to a JuliaTransformation </p>
   *
   * @param doubles <p> doubles to be parsed </p>
   * @return <p> Julia transformation from array </p>
   */
  public JuliaTransform2D doubleToJuliaTransformation(double[] doubles) {
    if (doubles.length != 2) {
      String error = "The input array must contain 2 elements";
      logger.error(error);
      throw new IllegalArgumentException(error);
    }
    return new JuliaTransform2D(new Complex(doubles[0], doubles[1]));
  }

  /**
   * <h2> doubleArrayToString </h2>
   * <p> Takes in a double[] array and turns it into a String. Includes , for later reading </p>
   *
   * @param array <p> array to be parsed </p>
   * @return <p> String from array </p>
   */
  public String doubleArrayToString(double[] array) {
    if (array == null || array.length == 0) {
      logger.error("The array is either null or empty");
      return "";
    }

    StringBuilder stringBuilder = new StringBuilder();
    for (double i : array) {
      stringBuilder.append(i).append(", ");
    }
    stringBuilder.setLength(stringBuilder.length() - 2);
    return stringBuilder.toString();
  }
}
