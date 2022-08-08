import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Car Dash")

    ValueSource {
        id: valueSource
    }
    Rectangle {
        id: dashBoard
        width: 900
        height: 500
        color: "black"

        Row {
            id: dashBoardRow
            spacing: dashBoard.width * 0.02
            anchors.centerIn: parent

            TurnArrow {
                id: leftIndicator
                anchors.verticalCenter: parent.verticalCenter
                width: height
                height: dashBoard.height * 0.2 - dashBoardRow.spacing

                direction: Qt.LeftArrow
            }

            CircularGauge {
                id: speedometer
                value: accelerating ? 180 : 0
                height: dashBoard.height * 0.9
                width: height
                maximumValue: 180

                style:SppedoMeterStyle{}

/*
                style: CircularGaugeStyle {
                    id: style

                    function degreesToRadians(degrees) {
                        return degrees * (Math.PI / 180);
                    }

                    background: Canvas {
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.reset();

                            ctx.beginPath();
                            ctx.strokeStyle = "#e34c22";
                            ctx.lineWidth = outerRadius * 0.02;

                            ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                                    degreesToRadians(valueToAngle(120) - 90), degreesToRadians(valueToAngle(180) - 90));
                            ctx.stroke();
                        }
                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.verticalCenter
                            anchors.topMargin: outerRadius * 0.2
                            Text {
                                id: speedText
                                font.pixelSize: outerRadius * 0.1
                                text: kphInt
                                color: "white"
                                horizontalAlignment: Text.AlignRight


                                readonly property int kphInt: speedometer.value
                            }
                            Text {
                                text: "km/h"
                                color: "white"
                                font.pixelSize: outerRadius * 0.1
                            }
                        }

                        Text {
                            id: gearText
                            font.pixelSize: outerRadius * 0.3
                            text: gear
                            color: "white"
                            horizontalAlignment: Text.AlignRight
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.verticalCenter
                            anchors.topMargin: outerRadius * 0.4

                            readonly property string gear: valueSource.gear
                        }


                    }

                    tickmark: Rectangle {
                        visible: styleData.value < 120 || styleData.value % 10 == 0
                        implicitWidth: outerRadius * 0.02
                        antialiasing: true
                        implicitHeight: outerRadius * 0.06
                        color: styleData.value >= 120 ? "#e34c22" : "#e5e5e5"
                    }

                    needle: Rectangle {
                        y: outerRadius * 0.15
                        implicitWidth: outerRadius * 0.03
                        implicitHeight: outerRadius * 0.9
                        antialiasing: true
                        color: "#e5e5e5"
                    }

                    foreground: Item {
                        Rectangle {
                            width: outerRadius * 0.2
                            height: width
                            radius: width / 2
                            color: "#e5e5e5"
                            anchors.centerIn: parent
                        }
                    }

                }

*/
                property bool accelerating: false


                Behavior on value {
                    id: speedBehaviour
                    NumberAnimation{
                        id: speedAnimation
                        duration:5000
                    }
                }

                Component.onCompleted: forceActiveFocus()

            }
            TurnArrow {
                id: rightIndicator
                width: height
                height: dashBoard.height * 0.2 - dashBoardRow.spacing
                anchors.verticalCenter: parent.verticalCenter

                direction: Qt.RightArrow

            }
        }
        Keys.onLeftPressed: {
            rightIndicator.on = false;
            leftIndicator.on = true;
        }
        Keys.onRightPressed: {
            leftIndicator.on = false;
            rightIndicator.on = true
        }
        Keys.onUpPressed:{
            speedometer.accelerating = true
        }
        Keys.onDownPressed: {
            speedometer.accelerating = false
        }
        Keys.onReleased: {
            if(event.key === Qt.Key_Up)
            {
                speedometer.accelerating = false;
                event.accepted = true
            }
            if(event.key === Qt.Key_Down)
            {
                event.accepted = true
            }
        }
    }

}
