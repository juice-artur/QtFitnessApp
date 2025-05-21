// ParameterStepper.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.VirtualKeyboard 2.2

Item {
    id: root
    width: 150
    height: 88

    property alias value: spinBox.value
    property string label: "Parameter"
    property string unit: ""
    property int from: 1
    property int to: 99
    property int step: 1

    property bool showKeyboard: false

    Rectangle {
        width: root.width
        height: root.height
        radius: 8
        color: "#1C1C1E"
        border.color: "#2C2C2E"
        border.width: 1

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

                Item {
                    Layout.fillWidth: true
                    height: 24

                    Text {
                        id: valueText
                        text: spinBox.value + (root.unit !== "" ? " " + root.unit : "")
                        color: "white"
                        font.pixelSize: 16
                        font.bold: true
                        visible: !textInput.visible
                    }

                    TextInput {
                        id: textInput
                        visible: false
                        width: parent.width
                        color: "white"
                        font.pixelSize: 16
                        font.bold: true
                        validator: IntValidator { bottom: root.from; top: root.to }
                        inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhDigitsOnly
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter

                        onAccepted: {
                            var newValue = parseInt(text)
                            if (!isNaN(newValue)) {
                                spinBox.value = Math.max(root.from, Math.min(root.to, newValue))
                            }
                            visible = false
                            Qt.inputMethod.hide()
                        }

                        onActiveFocusChanged: {
                            if (!activeFocus) {
                                visible = false
                                Qt.inputMethod.hide()
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            textInput.text = spinBox.value
                            textInput.visible = true
                            textInput.forceActiveFocus()
                            textInput.selectAll()
                            Qt.inputMethod.show()
                        }
                    }
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

}
