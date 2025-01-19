package no.ntnu.idatt1005.model.data;

import jakarta.persistence.FetchType;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.MappedSuperclass;
import java.util.List;
import no.ntnu.idatt1005.model.data.entities.Tag;
import no.ntnu.idatt1005.model.utils.InputValidator;

/**
 * Class for items
 */
@MappedSuperclass
public abstract class Item {
  /**
   * Fields, protected so that subclasses can access them
   */
  protected String name;
  // Default amount of unit, for example default portions for a recipe or default amount for an ingredient
  protected float defaultAmount;
  @ManyToMany(fetch = FetchType.EAGER)
  protected List<Tag> tags;

  /**
   * Constructor
   *
   * @param name name of item
   * @param defaultAmount default amount of item
   * @param tags tags of item
   */
  public Item(String name, float defaultAmount, List<Tag> tags) {
    this.name = InputValidator.validateString(name);
    this.defaultAmount = defaultAmount;
    this.tags = tags;
  }

  /**
   * Copy constructor
   */
  public Item(Item item) {
    this.name = item.name;
    this.defaultAmount = item.defaultAmount;
    this.tags = item.tags;
  }

  public Item(){
  }

  /**
   * Sets the name of the item.
   * The name is validated for correctness using the
   * EntityValidator's validateName method before being set.
   *
   * @param name The name to set for the item.
   */

  public void setName(String name) {
    InputValidator.validateString(name);
    this.name = name;
  }

  /**
   * Sets the default amount for the item.
   * The amount is validated for correctness using the EntityValidator's
   * validateDefaultAmount method before being set.
   *
   * @param defaultAmount The amount to set as the default for the item.
   */

  public void setDefaultAmount(float defaultAmount) {
    this.defaultAmount = defaultAmount;

  }

  /**
   * Assigns a list of tags to the item.
   * No validation is performed on the tags themselves,
   * it's assumed they are pre-validated or do not require validation.
   *
   * @param tags The list of Tag objects to associate with this item.
   */

  public void setTags(List<Tag> tags) {
    this.tags = tags;
  }

  /**
   * Gets name of item
   *
   * @return name of item
   */
  public String getName() {
        return name;
    }

  /**
   * Gets default amount of item
   *
   * @return default amount of item
   */
  public float getDefaultAmount() {
        return defaultAmount;
    }

  /**
   * Gets tags of item
   *
   * @return tags of item
   */

  public List<Tag> getTags() {
        return tags;
    }

  /**
   * toString override
   *
   * @return string representation of item
   */
  @Override
  public String toString() {
    StringBuilder output;
    output = new StringBuilder("Name: " + name + "\n");
    output.append("Default amount: ").append(defaultAmount).append("\n");
    for (Tag tag : tags) {
      output.append("Tag: ").append(tag.getName()).append(" Category: ").append(tag.getCategory()).append("\n");
    }
    return output.toString();
  }
}