import QtQuick 2.15


Item {
    Component.onCompleted: NavigationManager.showNavBar = true
    anchors.fill: parent

    Rectangle {
        width: parent.width
        height: parent.height
        gradient: Styles.backgroundGradient
    }
}
