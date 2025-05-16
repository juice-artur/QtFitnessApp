import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import GymHelper

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Slide Transition SPA")

    property string currentPage: "pages/Workout.qml"
    property string nextPage: ""

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

        onNavigateToPage: (pageUrl) => {
            if (pageUrl !== currentPage) {
                nextPage = pageUrl;
                pageContainer.transitionTo(pageUrl);
            }
        }
    }
}
