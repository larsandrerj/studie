package no.ntnu.idatt1005.model.data.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import no.ntnu.idatt1005.model.data.IDAmountStruct;
import no.ntnu.idatt1005.model.utils.InputValidator;

/**
 * <h1>FridgeElement</h1>
 * <p>This class represents a single ingredient in the fridge. <br>
 * The class contains an ingredients name and the amount of the ingredient</p>
 * The amount can be increased or decreased.
 */
@Entity
@Table(name = "fridge")
public class FridgeElement extends IDAmountStruct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(
        name = "id",
        updatable = false
    )
    private Long id;

    /**
     * Constructor for FridgeElement
     * @param name name of the ingredient
     * @param amount amount of the ingredient
     */
    public FridgeElement(String name, float amount) {
        super(name, amount);
    }

    public FridgeElement(IDAmountStruct ingredient) {
        this.name = InputValidator.validateName(ingredient.name);
        this.amount = ingredient.amount;
    }

    public FridgeElement() {
    }

    public Long getId() {
        return id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || this.getClass() != o.getClass()) {
            return false;
        }
        FridgeElement fridgeElement = (FridgeElement) o;
        return this.name.equals(fridgeElement.name);
    }

    @Override
    public int hashCode() {
        return this.name.hashCode();
    }
}
