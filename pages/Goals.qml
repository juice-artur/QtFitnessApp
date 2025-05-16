import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import GymHelper

Item {
    width: 360
    height: 640

    Rectangle {
        width: parent.width
        height: parent.height
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 1; color: "#32383E" }
            GradientStop { position: 0; color: "#17191C" }
        }


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


            Column {
                width: parent.width
                bottomPadding: 8

                ColumnLayout  {
                    width: parent.width
                    spacing: 8

                    RowLayout {
                        width: parent.width

                        Text {
                            text: qsTr("Overall progress:")
                            font.pixelSize: 16
                            color: "#D4D4D8"
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        Text {
                            text: qsTr("60%")
                            font.pixelSize: 16
                            color: "#FFFFFF"
                        }
                    }

                    CustomProgressBar {
                        id: progress
                        value: 0.6
                        width: parent.width
                    }
                }
            }

            ToolButton {
                width: parent.width
                height: 40
                icon.color: "#FFFFFF"


                contentItem: Row {
                    width: parent.width
                    height: 40

                    Item {
                        width: (parent.width - (textItem.width + iconItem.width)) / 2
                        height: 1
                    }

                    Image {
                        id: iconItem
                        source: "qrc:/res/Icons/fi-ss-plus.svg"
                        width: 20
                        height: 20
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Item {
                        width: 6
                        height: 1
                    }

                    Text {
                        id: textItem
                        text: "Create new plan"
                        color: "#FFFFFF"
                        height: 19
                        font.weight: Font.DemiBold
                        anchors.verticalCenter: parent.verticalCenter
                    }

                }

                background: Rectangle {
                    anchors.fill: parent
                    radius: 8
                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 1; color: "#FFA05C" }
                        GradientStop { position: 0; color: "#F06500" }
                    }
                }
            }
        }
    }
}

