import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.15

Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("Path Line Example")


    Text {
        id: reference0
        text: "0,0"
        color: "black"
        z: 100
        anchors.centerIn: parent
    }

    Shape {
        id: shapeId
        z:1
        anchors.centerIn: parent

        ShapePath {
            id: shapePathId

            strokeColor: "red"
            strokeWidth: 10
            capStyle: ShapePath.FlatCap
            joinStyle: ShapePath.RoundJoin
            fillColor: "lightblue"

            startX: 100
            startY: 100

            PathLine { relativeX: 0; relativeY: -50 }
            PathLine { relativeX : -50; relativeY: 0 }
            PathLine { relativeX: 50; relativeY: 50 }

            PathLine { x: 100; y: 200 }
            PathLine { x: 200; y: 200 }
            PathLine { x: 200; y: 100 }
            PathLine { x:-100; y:100 }


        }
    }
}
