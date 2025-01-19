package no.ntnu.idatt1005.data.entities;


import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import no.ntnu.idatt1005.model.data.entities.FridgeElement;

public class FridgeTest {

  @Nested
  @DisplayName("Positive tests")
  public class PositiveTests {

    @Test
    @DisplayName("testConstructorAndGetters")
    void testConstructorAndGetters() {
      FridgeElement element = new FridgeElement("Milk", 5);
      assertEquals("Milk", element.getName());
      assertEquals(5, element.getAmount());
    }

    @Test
    @DisplayName("testSetter")
    void testSetter() {
      FridgeElement element = new FridgeElement("Milk", 5);
      element.setAmount(10);
      assertEquals(10, element.getAmount());
    }
  }

}


