package edu.ntnu.stud.model.linalg;

import edu.ntnu.stud.model.linalg.Vector2D;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class Vector2DTest {
    private Vector2D test1;
    private Vector2D test2;
    private Vector2D test3;
    private Vector2D test4;
    @BeforeEach
    void setUp() {
        this.test1 = new Vector2D(0, 0);
        this.test2 = new Vector2D(1, -1.7);
        this.test3 = new Vector2D(1.5, 2);
        this.test4 = new Vector2D(1, -2);
    }

    @Test
    void getX0X1() {
        assertEquals(test1.getX0(), 0);
        assertEquals(test1.getX1(), 0);

        assertEquals(test2.getX0(), 1);
        assertEquals(test2.getX1(), -1.7);

        assertEquals(test3.getX0(), 1.5);
        assertEquals(test3.getX1(), 2);

        assertEquals(test4.getX0(), 1);
        assertEquals(test4.getX1(), -2);
    }

    @Test
    void add() {
        assertEquals(test1.add(test1).getX0(), new Vector2D(0, 0).getX0());
        assertEquals(test1.add(test1).getX1(), new Vector2D(0, 0).getX1());

        assertEquals(test1.add(test2).getX0(), new Vector2D(1, -1.7).getX0());
        assertEquals(test1.add(test2).getX1(), new Vector2D(1, -1.7).getX1());
        assertEquals(test2.add(test1).getX0(), new Vector2D(1, -1.7).getX0());
        assertEquals(test2.add(test1).getX1(), new Vector2D(1, -1.7).getX1());
    }

    @Test
    void subtract() {
        assertEquals(test1.subtract(test1).getX0(), new Vector2D(0, 0).getX0());
        assertEquals(test1.subtract(test1).getX1(), new Vector2D(0, 0).getX1());

        assertEquals(test1.subtract(test2).getX0(), new Vector2D(-1, 1.7).getX0());
        assertEquals(test1.subtract(test2).getX1(), new Vector2D(-1, 1.7).getX1());

        assertEquals(test2.subtract(test1).getX0(), new Vector2D(1, -1.7).getX0());
        assertEquals(test2.subtract(test1).getX1(), new Vector2D(1, -1.7).getX1());
    }

    @Test
    void getVectorAsArrayTest(){
        double[] values = test3.getVectorAsArray();

        assertEquals(1.5, values[0]);
        assertEquals(2, values[1]);
    }
}