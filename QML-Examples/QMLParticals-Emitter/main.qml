import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Particles 2.15


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Particles")


    Emitter {
        id: trailsNormal
        system: sys1

        emitRate: 500
        lifeSpan: 2000

        y: mouseArea.pressed ? mouseArea.mouseY : circle.cy
        x: mouseArea.pressed ? mouseArea.mouseX : circle.cx

        velocity: PointDirection {xVariation: 4; yVariation: 4;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}
        velocityFromMovement: 8

        size: 8
        sizeVariation: 4
    }
}
