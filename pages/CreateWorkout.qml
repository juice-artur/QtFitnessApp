import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Item {
    Rectangle{
        width: parent.width
        height: parent.height
        color: "#636897"

        ToolButton {
            text: "Create Workout"
            display: AbstractButton.TextOnly
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 34
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            background: Rectangle {
                   anchors.fill: parent
                   gradient: Gradient {
                       GradientStop { position: 0; color: "#FFA05C" }
                       GradientStop { position: 1; color: "#F06500" }
                   }
                }
            }

    }
}
