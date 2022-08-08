
import QtQuick 2.2
import QtQuick.Controls.Styles 1.4

CircularGaugeStyle {
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

