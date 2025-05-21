import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import GymHelper
import QtQuick.VirtualKeyboard 2.2


ApplicationWindow  {
    id: root
    visible: true
    width: 360
    height: 640
    title: qsTr("Slide Transition SPA")
    flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint

    property string currentPage: "pages/Workout.qml"
    property string nextPage: ""

    Component.onCompleted: {
        NavigationManager.navigateTo.connect(function(pageUrl) {
            if (pageUrl !== currentPage) {
                nextPage = pageUrl;
                pageContainer.transitionTo(pageUrl);
            }
        });
    }

    InputPanel {
        id: keyboard
        visible: Qt.inputMethod.visible
        z: 99
        anchors.bottom: parent.bottom
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        Keyboard {
            id: keyboardInternal
            anchors.fill: root
        }
    }

    Item {
        id: pageContainer
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        clip: true

        Loader {
            id: loaderA
            width: parent.width
            height: parent.height
            x: 0
            source: currentPage
            visible: true
        }

        Loader {
            id: loaderB
            width: parent.width
            height: parent.height
            x: parent.width
            visible: false
        }

        function transitionTo(newPage) {
            if (newPage === currentPage) return;

            loaderB.source = newPage;
            loaderB.visible = true;
            loaderB.x = pageContainer.width;

            animation.running = true;
        }

        ParallelAnimation {
            id: animation
            running: false

            onFinished: {
                currentPage = nextPage;
                loaderA.source = currentPage;
                loaderA.x = 0;

                loaderB.source = "";
                loaderB.visible = false;
                loaderB.x = pageContainer.width;
            }

            NumberAnimation {
                target: loaderA
                property: "x"
                to: -pageContainer.width
                duration: 300
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: loaderB
                property: "x"
                to: 0
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
    }

    NavBar {
        id: navBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        currentPage: root.currentPage
    }

}
