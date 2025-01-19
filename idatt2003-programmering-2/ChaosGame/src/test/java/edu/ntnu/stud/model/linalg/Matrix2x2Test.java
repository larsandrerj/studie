package edu.ntnu.stud.model.linalg;

import edu.ntnu.stud.model.linalg.Matrix2x2;
import edu.ntnu.stud.model.linalg.Vector2D;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class Matrix2x2Test {

    Matrix2x2 testMatrix1;
    Matrix2x2 testMatrix2;
    Matrix2x2 testMatrix3;

    Vector2D testVector1;
    Vector2D testVector2;

    @BeforeEach
    void setUp() {
        testMatrix1 = new Matrix2x2(
                0, 0,
                0, 0
        );
        testMatrix2 = new Matrix2x2(
                1, 1,
                1, 1
        );
        testMatrix3 = new Matrix2x2(
                2, 3,
                4, 5
        );

        testVector1 = new Vector2D(
                0, 0
        );
        testVector2 = new Vector2D(
                2, -3
        );
    }

    @Test
    void multiply() {
        assertEquals(0, testMatrix1.multiply(testVector1).getX0());
        assertEquals(0, testMatrix1.multiply(testVector1).getX1());

        assertEquals(-1, testMatrix2.multiply(testVector2).getX0());
        assertEquals(-1, testMatrix2.multiply(testVector2).getX1());

        assertEquals(-5, testMatrix3.multiply(testVector2).getX0());
        assertEquals(-7, testMatrix3.multiply(testVector2).getX1());
    }

    @Test
    void getMatrixAsArrayTest(){
        double[] values = testMatrix3.getMatrixAsArray();

        assertEquals(2, values[0]);
        assertEquals(3, values[1]);
        assertEquals(4, values[2]);
        assertEquals(5, values[3]);

    }
}