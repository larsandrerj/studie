package edu.ntnu.stud.view.settingboxes.components;

import javafx.application.Platform;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class JuliaSliderTest {

  @BeforeEach
  void setUp(){
    slider = new JuliaSlider(1,2,0,"Test Name");
  }
  JuliaSlider slider;

  @Test
  @DisplayName("Test that getCurrentValue returns correct value")
  void getCurrentValue() {
    assertEquals(1, slider.getCurrentValue());
  }
}