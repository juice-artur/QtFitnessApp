import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import GymHelper
import App.Models 1.0

Item {
    Component.onCompleted: NavigationManager.showNavBar = false


    Rectangle {
        width: parent.width
        height: parent.height
        gradient: Styles.backgroundGradient

        ColumnLayout {
            width: parent.width
            anchors.fill: parent
            Layout.fillWidth: true
            Layout.leftMargin: 16
            Layout.rightMargin: 16
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 16

            RowLayout  {
                Layout.fillWidth: true
                Layout.bottomMargin: 16
                ToolButton {

                    id: iconItem
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
                Layout.fillWidth: true
                Layout.bottomMargin: 24
                buttonModel: [
                    { icon: "qrc:/res/Icons/fi-ss-refresh.svg", label: "Warm up" },
                    { icon: "qrc:/res/Icons/fi-ss-chart-pie.svg", label: "Cool Down" }
                ]
            }

            ComboBox {
                id: control
                Layout.fillWidth: true
                leftPadding: 12
                rightPadding: 32
                topPadding: 0
                bottomPadding: 0
                Layout.leftMargin: 16
                Layout.rightMargin: 16

                model: ListModel {
                    ListElement { name: "Pull-ups"; value: ExerciseTypeWrapper.PullUps }
                    ListElement { name: "Push-Ups"; value: ExerciseTypeWrapper.PushUps }
                    ListElement { name: "Bench press"; value: ExerciseTypeWrapper.BenchPress }
                }

                textRole: "name"

                indicator: Canvas {
                    id: arrowCanvas
                    x: control.width - width - 12
                    y: (control.height - height) / 2
                    width: 12
                    height: 6
                    contextType: "2d"

                    Connections {
                        target: control
                        function onPressedChanged() { arrowCanvas.requestPaint() }
                    }

                    onPaint: {
                        context.reset()
                        context.moveTo(0, 0)
                        context.lineTo(width, 0)
                        context.lineTo(width / 2, height)
                        context.closePath()
                        context.fillStyle = "#C6C6C6"
                        context.fill()
                    }
                }

                contentItem: Text {
                    text: control.displayText
                    color: "#C6C6C6"
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    elide: Text.ElideRight
                    leftPadding: 0
                    rightPadding: 20
                    anchors.verticalCenter: parent.verticalCenter
                }

                background: Rectangle {
                    width: parent.width
                    height: control.height
                    radius: 4
                    color: "#3F3F46"
                    border.color: "#52525B"
                    border.width: 1
                }

                delegate: ItemDelegate {
                    width: control.width
                    height: control.height
                    padding: 12
                    text: model.name
                    background: Rectangle {
                        color: control.highlightedIndex === index ? "#71717A" : "#3F3F46"
                    }
                    contentItem: Text {
                        text: model.name
                        font.weight: Font.Medium
                        color: "#C6C6C6"
                        font.pixelSize: 14
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                popup: Popup {
                    y: control.height
                    width: control.width
                    padding: 0
                    margins: 0

                    contentItem: ListView {
                        clip: true
                        model: control.delegateModel
                        currentIndex: control.highlightedIndex
                        interactive: true
                        implicitHeight: contentHeight
                        boundsBehavior: Flickable.StopAtBounds
                        delegate: control.delegate
                    }

                    background: Rectangle {
                        color: "#3F3F46"
                        radius: 4
                        border.color: "#52525B"
                        border.width: 0

                    }
                }
            }

            CreateExerciseComponent{
                type: control.currentIndex >= 0 ? control.model.get(control.currentIndex).value : ExerciseTypeWrapper.PullUps
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
