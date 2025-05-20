import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    width: 150
    height: 88
    radius: 8
    color: "#1C1C1E"
    border.color: "#2C2C2E"
    border.width: 1

    property alias value: spinBox.value
    property string label: "Parameter"
    property string unit: ""
    property int from: 1
    property int to: 99
    property int step: 1

    RowLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 8

        ColumnLayout {
            spacing: 6
            Layout.fillWidth: true

            Text {
                text: root.label
                color: "#A1A1AA"
                font.pixelSize: 12
            }

            Text {
                text: spinBox.value + (root.unit !== "" ? " " + root.unit : "")
                color: "white"
                font.pixelSize: 16
                font.bold: true
            }

            SpinBox {
                id: spinBox
                visible: false
                from: root.from
                to: root.to
                stepSize: root.step
            }
        }

        ColumnLayout {
            spacing: 4

            Rectangle {
                width: 24
                height: 24
                color: "transparent"
                Image {
                    anchors.centerIn: parent
                    source: "qrc:/res/Icons/fi-ss-caret-up.svg"
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: spinBox.increase()
                }
            }

            Rectangle {
                width: 24
                height: 24
                color: "transparent"
                Image {
                    anchors.centerIn: parent
                    source: "qrc:/res/Icons/fi-ss-caret-down.svg"
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: spinBox.decrease()
                }
            }
        }
    }
}
