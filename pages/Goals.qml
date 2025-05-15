import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Item {
    width: 360
    height: 640

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#636897"


        Column {
            width: parent.width
            anchors.fill: parent
            anchors.margins: 16
            spacing: 16

            Text {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: "Goals"
                font.pixelSize: 20
                color: "#A1A1AA"
            }

            ProgressBar {
                value: 0.5
                contentItem:  {
                    color: "#F06500"
                }
            }


            ToolButton {
                text: "Create Workout"
                display: AbstractButton.TextOnly
                width: parent.width
                height: 40

                background: Rectangle {
                    anchors.fill: parent
                    radius: 8
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#FFA05C" }
                        GradientStop { position: 1; color: "#F06500" }
                    }
                }
            }
        }
    }
}

