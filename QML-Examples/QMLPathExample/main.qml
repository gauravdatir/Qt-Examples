import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.15


Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("QML Path example")

    Text{
        id: textReference
        text: "0,0"
        color: "black"
        anchors.centerIn: parent
        z: 100
    }

    Shape {
        anchors.centerIn: parentve
        z:1

        ShapePath {
            strokeColor : "red"
            strokeWidth: 8
            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.BevelJoin
            fillColor: "lightblue"
          //  strokeStyle: ShapePath.DashLine

            startX:100
            startY: 100

            PathLine { relativeX : 0; relativeY : -50 }
            PathLine { relativeX : -50; relativeY : 0 }
            PathLine { relativeX : 50; relativeY : 50 }


            PathLine { x: 100; y: 200 }
            PathLine { x: 200; y: 200 }
            PathLine { x: 200; y: 100 }
            PathLine { x: 100; y: 100 }
        }
    }
}
