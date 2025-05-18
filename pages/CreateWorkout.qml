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

        ColumnLayout {
            width: parent.width
            anchors.top: parent.top
            anchors.margins: 16
            spacing: 16

            RowLayout  {
                width: parent.width
                Layout.bottomMargin: 16

                ToolButton {
                    id: iconItem
                    height: 40
                    icon.color: "#FFFFFF"
                    icon.source:  "qrc:/res/Icons/fi-ss-arrow-small-left.svg"
                    onClicked: NavigationManager.navigateTo("pages/Goals.qml")
                }

                Item {
                    Layout.fillWidth: true
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Create Exercise")
                        font.pixelSize: 18
                        font.weight: Font.Medium
                        color: "#A1A1AA"
                    }
                }

                Item {
                    width: iconItem.width
                    height: iconItem.height
                }
            }

            SelectableIconButtons {
                buttonModel: [
                    { icon: "qrc:/res/Icons/fi-ss-refresh.svg", label: "Warm up" },
                    { icon: "qrc:/res/Icons/Clock.svg", label: "Main" },
                    { icon: "qrc:/res/Icons/fi-ss-chart-pie.svg", label: "Cool Down" }
                ]
            }
        }

    }
}
