import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Shapes 1.15
import QtQuick 2.15
import QtQuick.Particles 2.15

Window {
    id: root
    width: 800
    height: 800
    visible: true
    title: qsTr("Cubic Path example")
    property double xEnd: 200
    property double yEnd: -200

    Text {
        text: "(0,0)"
        color: "green"
        anchors.centerIn: parent
        z:100

    }

    Shape {

        anchors.centerIn: parent
        z: 10
        ShapePath {
            strokeColor: "red"
            strokeWidth: 5
            startX: 0
            startY:0
            PathQuad {
                x: 500; y: 0; controlX: 200; controlY: -200
            }
        }
    }
    Shape {
        anchors.centerIn: parent
        z: 5
        ShapePath {
            strokeColor: "blue"
            strokeWidth: 2
            startX: 0
            startY:0
            PathLine {
                x: 200; y: -200;
            }
            PathLine {
                x: 500; y: 0;
            }

        }
    }
    Shape {
        id: tangent
        anchors.centerIn: parent
        z: 8
        ShapePath {
            id: pathTang
            strokeColor: "green"
            strokeWidth: 2
            startX: 0
            startY:0
            PathLine {
                id: pathid
                x: root.xEnd; y: root.yEnd;
            }



            SequentialAnimation on startX {
                loops: Animation.Infinite
                PropertyAnimation{ duration: 3000; to: 200 }
                PropertyAnimation{ duration: 3000; to: 0 }
            }
            SequentialAnimation on startY {
                loops: Animation.Infinite
                PropertyAnimation  { duration: 3000; to: -200 }
                PropertyAnimation  { duration: 3000; to: 0 }
            }
        }
    }
    SequentialAnimation on xEnd {
        loops: Animation.Infinite
        PropertyAnimation { duration: 3000; to: 500 }
        PropertyAnimation { duration: 3000; to: 200 }
    }
    SequentialAnimation on yEnd {
        loops: Animation.Infinite
        PropertyAnimation  { duration: 3000; to: 0 }
        PropertyAnimation  { duration: 3000; to: -200 }
    }


    Rectangle {
        id: rectPoint
        x: 0
        y: 0
        width: 10
        height: 10
        color: "blue"
        z: 200
    }

    PathAnimation
    {
        path: Path {
            startX: 0
            startY:0
            PathQuad {
                x: 500; y: 500; controlX: 200; controlY: -200
            }
        }
        duration: 2000
        target: rectPoint
    }



}
