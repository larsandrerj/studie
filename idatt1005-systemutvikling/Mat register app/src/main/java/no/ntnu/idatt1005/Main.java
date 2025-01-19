package no.ntnu.idatt1005;

import java.lang.reflect.Array;
import java.util.List;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import no.ntnu.idatt1005.controller.MainController;
import no.ntnu.idatt1005.controller.PageLoader;
import no.ntnu.idatt1005.model.data.entities.Ingredient;
import no.ntnu.idatt1005.model.data.entities.Tag;
import no.ntnu.idatt1005.model.repo.*;
import no.ntnu.idatt1005.model.services.*;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.Objects;

@SpringBootApplication
public class Main extends Application {
    MainController mainController;
    private static ApplicationContext context;

    public static void main(String[] args) {
        context = SpringApplication.run(Main.class, args);
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
        mainController = context.getBean(MainController.class);
        FXMLLoader loader = new FXMLLoader(Main.class.getResource("views/home.fxml"));
        Parent root = loader.load();

        PageLoader pl = loader.getController();
        pl.setController(mainController);
        mainController.init(pl);

        root.getStylesheets().add(Objects.requireNonNull(getClass().getResource("styles/style.css")).toExternalForm());


        Scene scene = new Scene(root, 1600, 900);
        stage.setScene(scene);
        stage.show();
    }
}
