package edu.ntnu.stud.view.settingboxes.components;

import javafx.application.Platform;
import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

class VectorBoxTest {
  @BeforeEach
  void setUp(){
    vectorBox = new VectorBox("Test Description", 1.0, 1.0);
  }

  VectorBox vectorBox;

  @Test
  @DisplayName("Test that getVectorValues returns correct values")
  void getVectorValuesTest(){
    assertArrayEquals(new double[]{1.0,1.0}, vectorBox.getVectorValues());
  }

}