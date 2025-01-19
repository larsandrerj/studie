package edu.ntnu.stud.view.settingboxes;

import edu.ntnu.stud.view.settingboxes.components.MatrixAndVectorVBox;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

/**
 * <h1> AffineSettingsBox </h1>
 * <p> This class inherits from base settings and allows the creation of multiple Vector and matrices to show the user
 * the transformations that can happen </p>
 */
public class AffineSettingBox extends BaseSettingsBox {

  List<MatrixAndVectorVBox> matrixAndVectorBoxes;
  VBox transformationsBox;

  /**
   * <h2> Creates an Affine Setting box </h2>
   *
   * @param vectorsAndMatricesValues <p>The vectors and matrices in form of an array [a00, a01, a10, a11, b0, b1] </p>
   * @param iterations               <p> Amount of iterations the user wants to perform </p>
   * @return <p> Returns a vbox used in the final view class </p>
   */
  public VBox createAffineSettingBox(double[][] vectorsAndMatricesValues, long iterations) {
    super.SettingBox(vectorsAndMatricesValues[0], vectorsAndMatricesValues[1], iterations);

    VBox affineSettingBox = super.createBaseSettingsBox();

    VBox heading = new VBox(new Text("Matrices and vectors used in the transformation"));
    heading.setAlignment(Pos.CENTER);
    affineSettingBox.getChildren().add(heading);

    double[][] transformationValues = Arrays.copyOfRange(vectorsAndMatricesValues, 2, vectorsAndMatricesValues.length);

    matrixAndVectorBoxes = new ArrayList<>();
    Arrays.stream(transformationValues)
        .map(values -> new MatrixAndVectorVBox("Matrix A", "Vector B", values, this))
        .forEach(this::addMatrixAndVectorVBox);

    transformationsBox = new VBox();
    transformationsBox.setAlignment(Pos.CENTER);
    transformationsBox.setSpacing(10);

    List<HBox> hBoxes = matrixAndVectorBoxes.stream()
        .map(box -> box.getMatrixAndVectorBox(transformationsBox))
        .toList();
    transformationsBox.getChildren().addAll(hBoxes);

    ScrollPane scrollPane = new ScrollPane(transformationsBox);
    scrollPane.setFitToWidth(true);
    scrollPane.setPrefHeight(300);

    affineSettingBox.getChildren().add(scrollPane);
    affineSettingBox.getChildren().add(createAddTransformationButton());

    super.setHeading("Settings for Affine Transformations");
    HBox runAndSaveButtons = new HBox();
    runAndSaveButtons.getChildren().addAll(super.createSaveButton(), super.createRunButton());
    runAndSaveButtons.setAlignment(Pos.CENTER);
    settingBox.getChildren().add(runAndSaveButtons);

    return affineSettingBox;
  }

  /**
   * <h2> addMatrixAndVectorVBox </h2>
   * <p> this method adds a matrixAndVectorVBox to the matrixAndVectorBoxes collection </p>
   * @param matrixAndVectorVBox <p> matrixAndVectorVBox to be added </p>
   */
  private void addMatrixAndVectorVBox(MatrixAndVectorVBox matrixAndVectorVBox) {
    matrixAndVectorBoxes.add(matrixAndVectorVBox);
  }

  /**
   * <h2> removeMatrixAndVectorVBox </h2>
   * <p> This removes a MatrixAndVectorVBox from the collection </p>
   * @param matrixAndVectorVBox <p> MatrixAndVectorVBox to be removed </p>
   */
  public void removeMatrixAndVectorVBox(MatrixAndVectorVBox matrixAndVectorVBox) {
    matrixAndVectorBoxes.remove(matrixAndVectorVBox);
  }

  /**
   * <h2> getVectorsAndMatricesValues  </h2>
   * <p> Used to return the vectors and matrices in a double[][] form </p>
   *
   * @return <p> Returns a double[][] containing all transformations </p>
   */
  public double[][] getVectorsAndMatricesValues() {
    double[][] minAndMaxValues = super.getMinAndMaxVectors();
    double[][] transformationValues = matrixAndVectorBoxes.stream()
        .map(MatrixAndVectorVBox::getValues)
        .toArray(double[][]::new);

    return Stream.concat(Arrays.stream(minAndMaxValues), Arrays.stream(transformationValues))
        .toArray(double[][]::new);
  }

  /**
   * <h2> createAddTransformationButton </h2>
   * <p> This method adds a button that allows a user to add more transformations to an affine settings box </p>
   *
   * @return <p> HBox containing the button </p>
   */
  private HBox createAddTransformationButton() {
    Button newTransformationButton = new Button("New Transformation");
    newTransformationButton.setPrefSize(150, 30);
    newTransformationButton.setStyle("-fx-background-color: #afacac;" +
                                     " -fx-border-color: #000000;" +
                                     " -fx-border-radius: 15;" +
                                     " -fx-background-radius: 15;" +
                                     " -fx-text-fill: #FFFFFF;" +
                                     " -fx-cursor: hand;");

    HBox addTransformationBox = new HBox(newTransformationButton);
    addTransformationBox.setAlignment(Pos.CENTER);

    VBox spacer = new VBox();
    spacer.setPrefHeight(20);
    settingBox.getChildren().add(spacer);

    newTransformationButton.setOnAction(event -> {
      MatrixAndVectorVBox newMatrixAndVectorVBox = new MatrixAndVectorVBox("Matrix A",
          "Vector B",
          new double[]{0, 0, 0, 0, 0, 0}, this);
      addMatrixAndVectorVBox(newMatrixAndVectorVBox);
      HBox newHBox = newMatrixAndVectorVBox.getMatrixAndVectorBox(transformationsBox);
      transformationsBox.getChildren().add(newHBox);
    });

    return addTransformationBox;
  }
}
