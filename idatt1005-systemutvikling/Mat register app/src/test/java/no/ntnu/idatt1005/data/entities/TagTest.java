package no.ntnu.idatt1005.data.entities;

import no.ntnu.idatt1005.model.data.entities.Tag;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class TagTest {
  @Nested
  public class PositiveTests {
    @Test
    public void testConstructor() {
      Tag tag = new Tag("name", "category");
    }

    @Test
    public void testCopyConstructor() {
      Tag tag = new Tag("name", "category");
      Tag copy = new Tag(tag);
      assertEquals(tag.getName(), copy.getName());
      assertEquals(tag.getCategory(), copy.getCategory());
    }

    @Test
    public void testGetName() {
      Tag tag = new Tag("name", "category");
      assertEquals(tag.getName(), "name");
    }

    @Test
    public void testGetCategory() {
      Tag tag = new Tag("name", "category");
      assertEquals(tag.getCategory(), "category");
    }
  }

  @Nested
  public class NegativeTests {
    @Test
    public void testConstructorEmptyName() {
      assertThrows(IllegalArgumentException.class, () -> {
        Tag tag = new Tag("", "category");
      });
    }

    @Test
    public void testConstructorEmptyCategory() {
      assertThrows(IllegalArgumentException.class, () -> {
        Tag tag = new Tag("name", "");
      });
    }

    @Test
    public void testConstructorNullName() {
      assertThrows(NullPointerException.class, () -> {
        Tag tag = new Tag(null, "category");
      });
    }

    @Test
    public void testConstructorNullCategory() {
      assertThrows(NullPointerException.class, () -> {
        Tag tag = new Tag("name", null);
      });
    }
  }
}