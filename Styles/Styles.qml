pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property Gradient backgroundGradient: Gradient {
            id: backgroundGradient
            GradientStop { position: 0.0; color: "#17191C" }
            GradientStop { position: 1.0; color: "#32383E" }
        }
}
