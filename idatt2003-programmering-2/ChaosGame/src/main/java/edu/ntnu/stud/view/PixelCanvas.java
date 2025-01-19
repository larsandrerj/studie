package edu.ntnu.stud.view;

import javafx.scene.Group;
import javafx.scene.image.ImageView;
import javafx.scene.image.PixelReader;
import javafx.scene.image.PixelWriter;
import javafx.scene.image.WritableImage;
import javafx.scene.paint.Color;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <h1>PixelCanvas</h1>
 * <p>
 * Class responsible for handling an WritableImage instance and displaying it.
 * </p>
 */
public class PixelCanvas {
  /**
   * <h3> Logger for class </h3>
   * */
  private static final Logger logger = LoggerFactory.getLogger(PixelCanvas.class);

  /**
   * <h2>pixelCanvasGroup</h2>
   * <p>
   * Group-object containing the ImageView-object.
   * </p>
   */
  private final Group pixelCanvasGroup;

  /**
   * <h2>imageView</h2>
   * <p>
   * ImageView-object that contains the WritableImage object that will be drawn on.|
   * </p>
   */
  private final ImageView imageView;

  /**
   * <h2>writableImage</h2>
   * <p>
   * WritableImage-object that will be drawn on by a PixelWriter-object.
   * </p>
   */
  private WritableImage writableImage;

  /**
   * <h2>pw</h2>
   * <p>
   * PixelWriter-object which draws on an the writableImage instance.
   * </p>
   */
  private PixelWriter pw;

  /**
   * <h2>pr</h2>
   * <p>
   * PixelReader-object which reads pixels on the writableImage instance.
   * </p>
   */
  private PixelReader pr;

  /**
   * <h2>Constructor</h2>
   * <p>
   * Creates an ImageView-object and wraps it in a Group-object.
   * Calls to setNewImage with width and height = 1.
   * </p>
   */
  public PixelCanvas() {
    this.imageView = new ImageView();
    this.pixelCanvasGroup = new Group(imageView);

    setNewImage(1, 1);
  }

  /**
   * <h2>getPixelCanvasGroup</h2>
   * <p>
   * Returns the Group instance containing the ImageView instance.
   * </p>
   *
   * @return <p>Group instance containing the ImageView instance</p>
   */
  public Group getPixelCanvasGroup() {
    return pixelCanvasGroup;
  }

  /**
   * <h2>setNewImage</h2>
   * <p>
   * Method which replaces the writableImage with a new one.
   * Asserts if the width and height arguments are not equal to, or less than 0.
   * Replaces the writableImage with a new WritableImage-object with given width and height.
   * Creates new PixelWriter from the new writableImage, and sets the writableImage as the new
   * image in imageView.
   * </p>
   *
   * @param width  <p>width of the new writableImage.</p>
   * @param height <p>height of the writableImage.</p>
   * @throws IllegalArgumentException <p>if width and height are less than or equal to 0.</p>
   */
  public void setNewImage(int width, int height) throws IllegalArgumentException {
    if (width <= 0 || height <= 0) {
      String error = "Width or height cannot be less than or equal to 0";
      logger.error(error);
      throw new IllegalArgumentException(error);
    }

    writableImage = new WritableImage(width, height);
    pw = writableImage.getPixelWriter();
    pr = writableImage.getPixelReader();
    imageView.setImage(writableImage);
  }

  /**
   * <h2>fillImage</h2>
   * <p>
   * Method which fills the entire writableImage with a single color.
   * </p>
   *
   * @param rgb <p>array with rgb-color values.</p>
   */
  public void fillImage(int[] rgb) {
    Color color = getRGBColorFromArray(rgb);

    for (int i = 0; i < writableImage.getWidth(); i++) {
      for (int j = 0; j < writableImage.getHeight(); j++) {
        pw.setColor(i, j, color);
      }
    }
  }

  /**
   * <h2>setPixel</h2>
   * <p>
   * Method which places a pixel with a given color at given coordinates.
   * </p>
   *
   * @param x   <p>x-coordinate.</p>
   * @param y   <p>y-coordinate.</p>
   * @param rgb <p>array with rgb-color values.</p>
   * @throws IllegalArgumentException <p>if coordinates are out of scope for the
   *                                  writableImage.</p>
   */
  public void setPixel(int x, int y, int[] rgb) throws IllegalArgumentException {
    if (x < 0 || x > writableImage.getWidth() || y < 0 || y > writableImage.getHeight()) {
      String error = "Pixel out of scope for current image";
      logger.error(error);
      throw new IllegalArgumentException(error);
    }

    Color color = getRGBColorFromArray(rgb);

    pw.setColor(x, y, color);

  }

  /**
   * <h2>getPixelRGB</h2>
   * <p>
   * Method which returns the rgb-color values of a pixel at given coordinates.
   * </p>
   *
   * @param x <p>x-coordinate.</p>
   * @param y <p>y-coordinate.</p>
   * @return <p>array with rgb-color values.</p>
   */
  public int[] getPixelRGB(int x, int y) {
    Color color = pr.getColor(x, y);

    int r = (int) (color.getRed() * 255);
    int g = (int) (color.getGreen() * 255);
    int b = (int) (color.getBlue() * 255);

    return new int[]{r, g, b};
  }

  /**
   * <h2>getRGBColorFromArray</h2>
   * <p>
   * Method which returns Color-object from an array of rgb-color values.
   * </p>
   *
   * @param rgb <p>array with rgb-color values.</p>
   * @return <p>Color-object with rgb-color values.</p>
   */
  private Color getRGBColorFromArray(int[] rgb) {
    assertRGBFormat(rgb);
    return Color.rgb(rgb[0], rgb[1], rgb[2]);
  }

  /**
   * <h2>assertRGBFormat</h2>
   * <p>
   * Method which asserts that an array of rgb-color values are of the correct format.
   * </p>
   *
   * @param rgb <p>array with rgb-color values.</p>
   * @throws IllegalArgumentException <p>if rgb is not of correct length or its values are less
   *                                  than or greater than 255.</p>
   */
  private void assertRGBFormat(int[] rgb) throws IllegalArgumentException {
    if (rgb.length != 3) {
      String error = "Color is not of RGB format";
      logger.error(error);
      throw new IllegalArgumentException(error);
    }

    for (int color : rgb) {
      if (color < 0 || color > 255) {
        String error = "Color-component out of scope";
        logger.error(error);
        throw new IllegalArgumentException(error);
      }
    }

  }

}