import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import GymHelper

Item {
    Component.onCompleted: NavigationManager.showNavBar = false
    Component.onDestruction: NavigationManager.showNavBar = true

    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        gradient: Styles.backgroundGradient

        Column {
            width: parent.width
            anchors.fill: parent
            anchors.margins: 16
            spacing: 16

            RowLayout  {
                width: parent.width

                ToolButton {
                    id: iconItem
                    height: 40
                    icon.color: "#FFFFFF"
                    icon.source:  "qrc:/res/Icons/fi-ss-arrow-small-left.svg"
                    onClicked: NavigationManager.navigateTo("pages/Goals.qml")
                }


                Item { Layout.fillWidth: true }

                Text {
                    text: qsTr("Create Exercise")
                    font.pixelSize: 18
                    font.weight: Font.Medium
                    color: "#A1A1AA"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

                Item { Layout.fillWidth: true }
            }
        }
    }
}
