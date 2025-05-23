import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import GymHelper
import App.Models 1.0

ColumnLayout {
    width: parent.width
    height: parent.height
    spacing: 16

    ColumnLayout {
        width: parent.width
        Layout.alignment: Qt.AlignHCenter

        RowLayout {
            width: parent.width
            Layout.bottomMargin: 16

            ParameterStepper {
                id: repsStepper
                Layout.rightMargin: 40
                label: "Reps:"
                unit: "reps"
                from: 1
                to: 1000000
                step: 1
            }

            ParameterStepper {
                id: setsStepper
                label: "Sets:"
                unit: "sets"
                from: 1
                to: 1000000
                step: 1
            }
        }

        RowLayout {
            width: parent.width

            ParameterStepper {
                id: weightStepper
                Layout.rightMargin: 40
                label: "Weight:"
                unit: "kg"
                from: 1
                to: 1000000
                step: 1
            }

            ParameterStepper {
                id: resttimerStepper
                label: "Rest timer:"
                unit: "s"
                from: 1
                to: 1000000
                step: 1
            }
        }
    }

    Item {
        Layout.fillHeight: true
    }

    ToolButton {
        id: bottomButton
        Layout.fillWidth: true
        Layout.preferredHeight: 48
        Layout.leftMargin: 16
        Layout.rightMargin: 16
        Layout.bottomMargin: 16

        contentItem: Text {
            text: qsTr("Create new plan")
            color: "#FFFFFF"
            font.weight: Font.DemiBold
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            radius: 8
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0; color: "#FFA05C" }
                GradientStop { position: 1; color: "#F06500" }
            }
        }

        onClicked:  {
            exerciseModel.addExercise(ExerciseTypeWrapper.PushUps, repsStepper.value, weightStepper.value, resttimerStepper.value, setsStepper.value)
            exerciseModel.saveToFile()
        }
    }
}
