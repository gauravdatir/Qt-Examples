import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: window
        width: 320
        height: 480

        Canvas {
            id: canvas
            anchors.fill: parent
            antialiasing: true

            onPaint: {
                var context = canvas.getContext("2d")
                context.clearRect(0, 0, width, height)
                context.strokeStyle = "black"
                context.path = pathAnim.path
                context.stroke()
            }
        }

        SequentialAnimation {
            running: true
            loops: -1

            PauseAnimation { duration: 1000 }
            PathAnimation {
                id: pathAnim

                duration: 6000
                easing.type: Easing.InQuad

                target: box
                orientation: PathAnimation.RightFirst
                anchorPoint: Qt.point(box.width/2, box.height/2)
                path: Path {
                    startX: 50; startY: 50

                    PathCubic {
                        x: window.width - 50
                        y: window.height - 50

                        control1X: x; control1Y: 50
                        control2X: 50; control2Y: y
                    }

                    onChanged: canvas.requestPaint()
                }
            }
        }

        Rectangle {
            id: box

            x: 25; y: 25
            width: 50; height: 50
            border.width: 1
            antialiasing: true

            Text {
                anchors.centerIn: parent
                text: "Box"
            }
        }
    }
}
