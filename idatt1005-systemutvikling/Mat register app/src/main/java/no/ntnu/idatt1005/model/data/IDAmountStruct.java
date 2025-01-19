package no.ntnu.idatt1005.model.data;

import jakarta.persistence.MappedSuperclass;
import no.ntnu.idatt1005.model.utils.InputValidator;

/**
 * Simple data class (struct)
 * Ties 2 strings together.
 * No need for tests.
 */
@MappedSuperclass
public class IDAmountStruct {
  public String name;
  public float amount;

  /**
   * Constructs a new IDAmountStruct with specified name and amount.
   * Both the name and the amount are validated upon creation.
   *
   * @param name The name associated with this struct.
   * @param amount The amount associated with the name.
   */
  public IDAmountStruct(String name, float amount) {
    this.name = InputValidator.validateString(name);
    this.amount = amount;
  }

  /**
   * Default constructor for IDAmountStruct.
   */
  public IDAmountStruct() {
  }

  /**
   * Gets the name associated with this IDAmountStruct.
   *
   * @return The name of the struct.
   */
  public String getName() {
    return name;
  }

  /**
   * Sets the name for this IDAmountStruct.
   * The name is validated using the EntityValidator.
   *
   * @param ingredientName The new name to be set.
   */
  public void setName(String ingredientName) {
    this.name = InputValidator.validateString(ingredientName);
  }

  /**
   * Gets the amount associated with this IDAmountStruct.
   *
   * @return The amount of the struct.
   */

  public float getAmount() {
    return amount;
  }

  /**
   * Sets the amount for this IDAmountStruct.
   * The amount is validated using the EntityValidator.
   *
   * @param amount The new amount to be set.
   */
  public void setAmount(float amount) {
    this.amount = amount;
  }
}
