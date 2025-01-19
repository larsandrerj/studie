package edu.ntnu.stud.view;

import edu.ntnu.stud.controller.observer.Observable;
import javafx.scene.control.Button;
import javafx.scene.layout.Pane;

/**
 * <h1>NavButton</h1>
 * <p>                
 *   This class is responsible for creating a button that will direct to another pane
 * </p>
 */
public class NavButton extends Observable<NavButton> {
  /**
   * <h2>destinationPane</h2>
   * <p>
   *   The pane that the button will direct to.
   * </p>
   */
  private final Pane destinationPane;

  /**
   * <h2>button</h2>
   * <p>
   *   The button that will direct to the destinationPane.
   * </p>
   */
  private final Button button;

  /**
   * <h2>Constructor</h2>
   * <p>
   *   Creates a button with a given text. Button updates observers when clicked.
   * </p>
   *
   * @param destinationPane <p>The pane that the button will direct to.</p>
   * @param buttonText <p>The text that will be displayed on the button.</p>
   */
  public NavButton(Pane destinationPane, String buttonText) {
    this.destinationPane = destinationPane;
    this.button = new Button(buttonText);

    button.setOnAction(
        e -> {
          updateObservers(this);
        }
    );
  }

  /**
   * <h2>getDestinationPane</h2>
   * <p>
   *   Returns the destinationPane.
   * </p>
   *
   * @return <p>destinationPane</p>
   */
  public Pane getDestinationPane() {
    return destinationPane;
  }

  /**
   * <h2>getButton</h2>
   * <p>
   *   Returns the button.
   * </p>
   *
   * @return <p>button</p>
   */
  public Button getButton() {
    return button;
  }
}
