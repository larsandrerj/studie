package no.ntnu.idatt1005.view;

import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;

/**
 * Class responsible for creating an alert window popup
 */
public class AlertViewBuilder {

    /**
     * Creates and shows an alert window popup with given message s.
     *
     * @param s String that will be shown as a message
     */
    public void showAlert(String s) {
        //Alert message
        Text message = new Text(s);
        message.setId("alert-message");

        //OK-button, which closes the alert window
        Button okButton = new Button("Ok");
        okButton.setOnAction(
                e -> {
                    Stage stage = (Stage) okButton.getScene().getWindow();
                    stage.close();
                }
        );

        //Vbox which contains the message and OK-button
        VBox vbox = new VBox(
                message,
                okButton
        );

        AnchorPane root = new AnchorPane(vbox);


        //Shows the stage
        Stage stage = new Stage();
        stage.setTitle("New message!");
        Scene rootScene = new Scene(root);
        stage.setScene(rootScene);
        stage.show();

    }
}
