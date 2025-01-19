package no.ntnu.idatt1005.model.data.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.util.List;
import java.util.Objects;
import no.ntnu.idatt1005.model.data.Item;

/**
 * Class for ingredients
 */
@Entity
public class Ingredient extends Item {
  /**
   * Fields
   */
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;
  @Column(
    name = "unit",
    nullable = false,
    columnDefinition = "TEXT"
  )
  private String unit;

  /**
   * Constructor
   *
   * @param name name of ingredient
   * @param defaultAmount default amount of ingredient
   * @param unit unit of ingredient
   * @param tags tags of ingredient
   */
  public Ingredient(String name, float defaultAmount, String unit, List<Tag> tags) {
    super(name, defaultAmount, tags);
    if (unit.isEmpty()) {
      throw new IllegalArgumentException("Unit cannot be empty");
    }
    this.unit = unit;
  }

  /**
   * Copy constructor
   */
  public Ingredient(Ingredient ingredient) {
    super(ingredient);
    this.unit = ingredient.unit;
  }

  public Ingredient() {
    super();
  }

  public void setUnit(String unit) {
    this.unit = unit;
  }

  public Long getId() {
    return id;
  }
  /**
   * Gets unit of ingredient
   *
   * @return unit of ingredient
   */
  public String getUnit() {
    return unit;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || this.getClass() != o.getClass()) {
      return false;
    }
        Ingredient ingredient = (Ingredient) o;
    return this.name.equals(ingredient.getName());
  }

  @Override
  public int hashCode() {
    return Objects.hash(name, unit, defaultAmount);
  }
}