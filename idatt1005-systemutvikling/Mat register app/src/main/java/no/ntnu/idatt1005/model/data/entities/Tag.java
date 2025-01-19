package no.ntnu.idatt1005.model.data.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Objects;

/**
 * Class for tags
 */
@Entity
@Table(name = "tag")
public class Tag {
  /**
   * Fields
   */
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  @Column(
    name = "name",
    nullable = false,
    columnDefinition = "TEXT"
  )
  private String name;
    @Column(
        name = "category",
        nullable = false,
        columnDefinition = "TEXT"
    )
  private String category;

  /**
   * Constructor
   *
   * @param name name of tag
   * @param category category of tag
   */
  public Tag(String name, String category) {
    if (name.isEmpty() || category.isEmpty()) {
      throw new IllegalArgumentException("Name and category cannot be empty");
    }
    this.name = name;
    this.category = category;
  }

  /**
   * Copy constructor
   */
  public Tag(Tag tag) {
    this.id = tag.id;
    this.name = tag.name;
    this.category = tag.category;
  }

  public Tag() {
  }

  public Long getId() {
    return id;
  }
  /**
   * Gets name of tag
   *
   * @return name of tag
   */
  public String getName() {
        return name;
    }

  /**
   * Gets category of tag
   *
   * @return category of tag
   */
  public String getCategory() {
        return category;
    }

  public void setCategory(String category) {
    this.category = category;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || this.getClass() != o.getClass()) {
      return false;
    }
    Tag ingredient = (Tag) o;
    return this.name.equals(ingredient.getName());
  }

  @Override
  public int hashCode() {
    return Objects.hash(name, category);
  }
}