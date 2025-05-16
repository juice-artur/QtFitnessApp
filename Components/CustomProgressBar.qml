import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    property real value: 0.5
    property color backgroundColor: "#3F3F46"
    property color progressColor: "#F06500"
    property int barHeight: 8
    width: 200
    height: barHeight

    Rectangle {
        id: backgroundBar
        anchors.fill: parent
        color: backgroundColor
        radius: barHeight / 2
    }

    Rectangle {
        id: progressBar
        width: root.width * Math.min(Math.max(value, 0), 1)
        height: root.height
        color: progressColor
        radius: barHeight / 2
    }
}
