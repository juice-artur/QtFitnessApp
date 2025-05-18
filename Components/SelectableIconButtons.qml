import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Effects

Item {
    width: parent.width
    id: root
    property var buttonModel: []

    ButtonGroup { id: group }

    RowLayout {
        anchors.centerIn: parent
        spacing: 16

        Repeater {
            model: root.buttonModel

            delegate: ColumnLayout {
                spacing: 6
                Layout.alignment: Qt.AlignHCenter

                ToolButton {
                    id: radio
                    checkable: true
                    checked: index === 0
                    ButtonGroup.group: group
                    width: 50
                    height: 50
                    Layout.alignment: Qt.AlignHCenter

                    background: Rectangle {
                        anchors.fill: parent
                        color: "#3F3F46"
                        radius: 4
                        border.color: "#F06500"
                        border.width: radio.checked ? 2 : 0
                    }

                    contentItem: Image {
                        id: sourceImage
                        anchors.centerIn: parent
                        source: modelData.icon
                        width: 20
                        height: 20
                        fillMode: Image.PreserveAspectFit
                        visible: false
                    }

                    MultiEffect {
                            anchors.fill: sourceImage
                            source: sourceImage
                            colorization: 1.0
                            colorizationColor: radio.checked ? "#F06500" : "#FFFFFF"
                    }
                }

                Text {
                    text: modelData.label
                    font.pointSize: 10
                    color: radio.checked ? "#F06500" : "#FFFFFF"
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
}

