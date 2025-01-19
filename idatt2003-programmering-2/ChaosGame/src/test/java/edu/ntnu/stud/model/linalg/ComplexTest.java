package edu.ntnu.stud.model.linalg;

import edu.ntnu.stud.model.linalg.Complex;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ComplexTest {

    Complex test1;
    Complex test2;
    Complex test3;

    @BeforeEach
    void setUp() {
        test1 = new Complex(0,0);
        test2 = new Complex(-1,-1);
        test3 = new Complex(4,5);
    }

    @Test
    void sqrt() {
        assertEquals(test1.sqrt().getX0(), 0);
        assertEquals(test1.sqrt().getX1(), 0);

        assertEquals(
                (double) Math.round(test2.sqrt().getX0() * 1000) / 1000, 0.455
        );
        assertEquals(
                (double) Math.round(test2.sqrt().getX1() * 1000) / 1000, -1.099
        );

        assertEquals(
                (double) Math.round(test3.sqrt().getX0() * 1000) / 1000, 2.281
        );
        assertEquals(
                (double) Math.round(test3.sqrt().getX1() * 1000) / 1000, 1.096
        );
    }
}