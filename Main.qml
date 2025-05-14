import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

        Rectangle {
            id: bottomNav
            height: 64
            width: parent.width - 32
            gradient: Gradient {
                GradientStop {
                    position: 0.23;
                    color: "#353a40";
                }
                GradientStop {
                    position: 0.70;
                    color: "#121416";
                }
            }
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 34
            radius: 100


            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 0
                Layout.alignment: Qt.AlignHCenter
                ToolButton {
                    display: AbstractButton.IconOnly
                    Layout.fillWidth: true
                    Layout.preferredWidth: 1
                    icon.source: Qt.resolvedUrl("Icons/fi-ss-home.svg")
                    icon.color: "#71717A"
                }

                ToolButton {
                    display: AbstractButton.IconOnly
                    Layout.fillWidth: true
                    Layout.preferredWidth: 1
                    icon.source: Qt.resolvedUrl("Icons/fi-ss-gym.svg")
                    icon.color: "#71717A"
                }

                ToolButton {
                    display: AbstractButton.IconOnly
                    Layout.fillWidth: true
                    Layout.preferredWidth: 1
                    icon.source: Qt.resolvedUrl("Icons/fi-ss-add.svg")
                    icon.color: "#A1A1AA"
                }

                ToolButton {
                    display: AbstractButton.IconOnly
                    Layout.fillWidth: true
                    Layout.preferredWidth: 1
                    icon.source: Qt.resolvedUrl("Icons/fi-ss-calendar.svg")
                    icon.color: "#FFA05C"
                }
            }
        }

}
