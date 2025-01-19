package edu.ntnu.stud.view;

import javafx.stage.FileChooser;
import javafx.stage.Stage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

/**
 * <h1>FileExplorer</h1>
 * <p>
 * Class responsible for creating a file explorer window in which a user may choose a file or
 * choose a file directory to save a file.
 * </p>
 */
public class FileExplorer {

  /**
   * <h3> Logger for class </h3>
   * */
  private static final Logger logger = LoggerFactory.getLogger(FileExplorer.class);

  /**
   * <h2>Constructor</h2>
   * <p>
   * Initializes the file chooser object with the extension filters for the file types that can be
   * chosen.
   * </p>
   */
  public FileExplorer() {
    this.fileChooser = new FileChooser();
    this.fileChooser.getExtensionFilters().addAll(
        new FileChooser.ExtensionFilter("All Files", "*.*"),
        new FileChooser.ExtensionFilter("Text Files", ".txt")
    );
  }

  /**
   * <h2>fileChooser</h2>
   * <p>
   * File chooser object that selects a file or directory.
   * </p>
   */
  private final FileChooser fileChooser;


  /**
   * <h2>getFile</h2>
   * <p>
   * Opens a file explorer window and returns the chosen file.
   * </p>
   *
   * @param stage <p>The stage to open the file explorer window on.</p>
   * @return <p>The chosen file.</p>
   */
  public File getFile(Stage stage) {
    return fileChooser.showOpenDialog(stage);
  }

  /**
   * <h2>getSavePath</h2>
   * <p>
   * Opens a file explorer window and returns the chosen file path.
   * </p>
   *
   * @param stage <p>The stage to open the file explorer window on.</p>
   * @return <p>The chosen file path.</p>
   */
  public String getSavePath(Stage stage) {
    File file = fileChooser.showSaveDialog(stage);
    if (file != null) {
      return file.toPath().toString();
    }
    logger.warn("No path returned from FileChooser");
    return " ";
  }
}
