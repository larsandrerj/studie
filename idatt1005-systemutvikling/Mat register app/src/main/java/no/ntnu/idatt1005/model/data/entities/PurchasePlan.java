package no.ntnu.idatt1005.model.data.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import no.ntnu.idatt1005.model.data.IDAmountStruct;

@Entity
@Table(name = "purchase_plan")
public class PurchasePlan extends IDAmountStruct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public PurchasePlan(String name, float amount) {
        super(name, amount);
    }
    public PurchasePlan() {
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
        PurchasePlan fridgeElement = (PurchasePlan) o;
        return this.name.equals(fridgeElement.getName());
    }

    @Override
    public int hashCode() {
        return this.name.hashCode();
    }
}
