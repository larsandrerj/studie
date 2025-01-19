package no.ntnu.idatt1005.model.data.entities;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import no.ntnu.idatt1005.model.data.IDAmountStruct;
import no.ntnu.idatt1005.model.data.Item;

import no.ntnu.idatt1005.model.utils.InputValidator;

/**
 * Class for recipes
 */
@Entity
@Table(name = "recipe")
public class Recipe extends Item {
  /**
   * Fields
   */
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(
      name = "id",
      updatable = false
  )
  private Long id;
  @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER) // CascadeType.ALL kan brukes, men da kan man ikke lagre sub-objekter først
  @JoinColumn(name = "recipe_id")
  private List<RecipeIngredientElement> ingredients;
  @Column(
      name = "instructions",
      nullable = false,
      columnDefinition = "TEXT"
  )
  private String instructions;
  @Column(
      name = "portions",
      nullable = false
  )
  private static final String unit = "portions";

  /**
   * Constructor
   *
   * @param name name of recipe
   * @param defaultAmount default amount of recipe
   * @param tags tags of recipe
   * @param ingredients ingredients of recipe
   * @param instructions instructions of recipe
   */
  public Recipe(String name, float defaultAmount, List<Tag> tags, List<RecipeIngredientElement> ingredients, String instructions) {
    super(name, defaultAmount, tags);
    if (ingredients.isEmpty() || instructions.isEmpty()) {
      throw new IllegalArgumentException("Invalid constructor parameters");
    }
    this.ingredients = ingredients;
    this.instructions = instructions;
  }

  /**
   * Copy constructor
   */
  public Recipe(Recipe recipe) {
    super(recipe);
    this.ingredients = recipe.ingredients;
    this.instructions = recipe.instructions;
  }

  public Recipe() {
      super();
  }

  public Long getId() {
    return id;
  }

  /**
   * Gets ingredients of recipe
   *
   * @return ingredients of recipe
   */
  public List<RecipeIngredientElement> getIngredients() {
    return ingredients;
  }

  /**
   * Gets instructions of recipe
   *
   * @return instructions of recipe
   */
  public String getInstructions() {
    return instructions;
  }

  /**
   * Gets unit of recipe
   *
   * @return unit of recipe
   */
  public static String getUnit() {
    return unit;
  }


  public void setRecipeName(String name) {
    this.name = InputValidator.validateString(name);
  }

  public void setIngredients(List<RecipeIngredientElement> ingredients) {
    this.ingredients = ingredients;
  }

  public void setInstructions(String instructions) {
    this.instructions = InputValidator.validateString(instructions);
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || this.getClass() != o.getClass()) {
      return false;
    }
    Recipe recipe = (Recipe) o;
    return this.name.equals(recipe.name);
  }

  @Override
  public int hashCode() {
    return Objects.hash(name);
  }

  @Override
  public String toString() {
    String ingredientsStr = ingredients.stream()
        .map(RecipeIngredientElement::toString)
        .collect(Collectors.joining(", "));
    return "Recipe{" +
        "id='" + id + '\'' +
        ", recipeName='" + name + '\'' +
        ", ingredients=[" + ingredientsStr + "]" +
        ", instructions='" + instructions + '\'' +
        ", portions=" + defaultAmount +
        '}';
  }
}