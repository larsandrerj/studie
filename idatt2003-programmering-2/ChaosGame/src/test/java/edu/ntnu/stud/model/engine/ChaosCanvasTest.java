package edu.ntnu.stud.model.engine;

import edu.ntnu.stud.model.linalg.Vector2D;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ChaosCanvasTest {

    private ChaosCanvas canvas;

    @BeforeEach
    void setUp() {
        canvas = new ChaosCanvas(100, 100, new Vector2D(0,0), new Vector2D(100,100));
    }

    @Test
    void constructor() {

        assertDoesNotThrow(
                () -> {
                    int width = 10;
                    int height = 10;
                    Vector2D minCoords = new Vector2D(0, 0);
                    Vector2D maxCoords = new Vector2D(10, 10);

                    new ChaosCanvas(width, height, minCoords, maxCoords);
                }
        );

        // Throws if either width or height are negative
        assertThrows(
                IllegalArgumentException.class,
                () -> {
                    int width = -10;
                    int height = -10;
                    Vector2D minCoords = new Vector2D(0, 0);
                    Vector2D maxCoords = new Vector2D(10, 10);

                    new ChaosCanvas(width, height, minCoords, maxCoords);
                }
        );

        // Throws if maxCoords are less than minCoords
        assertThrows(
                IllegalArgumentException.class,
                () -> {
                    int width = 10;
                    int height = 10;
                    Vector2D minCoords = new Vector2D(10, 10);
                    Vector2D maxCoords = new Vector2D(0, 0);

                    new ChaosCanvas(width, height, minCoords, maxCoords);
                }
        );
    }

    @Test
    void getPixel() {
        canvas.putPixel(
                new Vector2D(100, 100)
        );

        assertEquals(
                1,
                canvas.getPixel(
                        new Vector2D(100, 100)
                )
        );

        assertDoesNotThrow(
                () -> {
                    canvas.putPixel(
                            new Vector2D(200, 200)
                    );
                }
        );

        assertEquals(
                -1,
                canvas.getPixel(
                        new Vector2D(200, 200)
                )
        );



    }

    @Test
    void putPixel() {
        canvas.putPixel(
                new Vector2D(100, 100)
        );

        assertEquals(
                1,
                canvas.getCanvasArray()[0][99]
        );

        canvas.putPixel(
                new Vector2D(0, 0)
        );

        assertEquals(
                1,
                canvas.getCanvasArray()[99][0]
        );

        assertDoesNotThrow(
                () -> {
                    canvas.putPixel(
                            new Vector2D(1000, 100)
                    );
                }
        );
    }

    @Test
    void getCanvasArray() {
        int[][] testCanvas = new int[100][100];

        for (int i = 0; i < 100; i++) {
            for (int j = 0; j < 100; j++) {
                testCanvas[i][j] = 0;
            }
        }

        for (int i = 0; i < 100; i++) {
            for (int j = 0; j < 100; j++){
                assertEquals(
                        testCanvas[i][j],
                        canvas.getCanvasArray()[i][j]
                );
            }
        }
    }

    @Test
    void getCanvasWidth(){
      int expectedWidth = 100;
      assertEquals(expectedWidth, canvas.getWidth());
    }

    @Test
    void getCanvasHeight(){
      int expectedHeight = 100;
      assertEquals(expectedHeight, canvas.getHeight());
    }

    @Test
    void clear() {
        int[][] testCanvas = new int[100][100];

        for (int i = 0; i < 100; i++) {
            for (int j = 0; j < 100; j++) {
                testCanvas[i][j] = 0;
            }
        }

        canvas.putPixel(
                new Vector2D(100, 100)
        );

        assertNotEquals(
                testCanvas[0][99],
                canvas.getCanvasArray()[0][99]
        );

        canvas.clear();

        for (int i = 0; i < 100; i++) {
            for (int j = 0; j < 100; j++){
                assertEquals(
                        testCanvas[i][j],
                        canvas.getCanvasArray()[i][j]
                );
            }
        }

    }
}