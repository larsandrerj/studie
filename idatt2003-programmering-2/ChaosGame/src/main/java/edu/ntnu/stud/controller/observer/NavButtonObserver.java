package edu.ntnu.stud.controller.observer;

import edu.ntnu.stud.view.NavButton;
import edu.ntnu.stud.view.View;

public class NavButtonObserver implements Observer<NavButton> {
  private final View view;

  public NavButtonObserver(View view) {
    this.view = view;
  }

  @Override
  public void update(NavButton navButton) {
    view.setMainPaneContent(
        navButton.getDestinationPane()
    );
    System.out.println("bruh");
  }
}
