package edu.ntnu.stud.controller.observer;

/**
 * <h1>Observer</h1>
 * <p>
 * Generic interface used as a base for creating an observer which observers an Observable
 * of the same generic.
 * </p>
 *
 * @param <T> <p>Type of observable that will be observed.</p>
 */
public interface Observer<T> {

  /**
   * <h2>Update</h2>
   * <p>
   * Method signature used by an observable to call to an observer
   * </p>
   *
   * @param t <p>Type of observable object that has been updated.</p>
   */
  void update(T t);
}
