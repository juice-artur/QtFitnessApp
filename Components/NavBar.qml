import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: bottomNav
    property string currentPage: ""

    height: 64

    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.7; color: "#353a40" }
        GradientStop { position: 0.23; color: "#121416" }
    }
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 34
    anchors.leftMargin: 16
    anchors.rightMargin: 16
    radius: 100

    signal navigateToPage(string pageUrl)

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 0
        Layout.alignment: Qt.AlignHCenter

        ToolButton {
            property string page: "pages/HomePage.qml"
            icon.source: "qrc:/res/Icons/fi-ss-home.svg"
            icon.color: currentPage === page ? "#FFA05C" : "#71717A"
            display: AbstractButton.IconOnly
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            onClicked: navigateToPage(page)
        }

        ToolButton {
            property string page: "pages/Workout.qml"
            icon.source: "qrc:/res/Icons/fi-ss-gym.svg"
            icon.color: currentPage === page ? "#FFA05C" : "#71717A"
            display: AbstractButton.IconOnly
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            onClicked: navigateToPage(page)
        }

        ToolButton {
            property string page: "pages/Goals.qml"
            icon.source: "qrc:/res/Icons/fi-ss-add.svg"
            icon.color: currentPage === page ? "#FFA05C" : "#A1A1AA"
            display: AbstractButton.IconOnly
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            onClicked: navigateToPage(page)
        }

        ToolButton {
            property string page: "pages/Calendar.qml"
            icon.source: "qrc:/res/Icons/fi-ss-calendar.svg"
            icon.color: currentPage === page ? "#FFA05C" : "#71717A"
            display: AbstractButton.IconOnly
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            onClicked: navigateToPage(page)
        }
    }
}
