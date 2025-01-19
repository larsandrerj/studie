package edu.ntnu.stud.controller.observer;

import java.util.ArrayList;
import java.util.List;

/**
 * <h1>Observable</h1>
 * <p>
 * Generic abstract class used as a foundation for creating other Observable classes.
 * </p>
 *
 * @param <T> <p>Type of class that will be observed.</p>
 */
public abstract class Observable<T> {
  /**
   * <h2>Observers</h2>
   * <p>
   * List of observers that will be notified of an update.
   * </p>
   */
  private final List<Observer<T>> observers;

  /**
   * <h2>Constructor</h2>
   * <p>
   * Initializes an empty list of Observer.
   * </p>
   */
  protected Observable() {
    this.observers = new ArrayList<>();
  }

  /**
   * <h2>Update observers</h2>
   * <p>
   * Method which calls the update method of each Observer in observers.
   * </p>
   *
   * @param t <p>Type of class that has been updated.</p>
   */
  protected void updateObservers(T t) {
    observers.forEach(e -> e.update(t));
  }

  /**
   * <h2>Add observer</h2>
   * <p>
   * Method to add an Observer to observers
   * </p>
   *
   * @param observer <p>Observer that will be added to the list of observers.</p>
   */
  public void addObserver(Observer<T> observer) {
    observers.add(observer);
  }
}
