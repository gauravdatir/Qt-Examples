import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Item {
    id:itemComp
    property int stateNumber:5
    property int refWidth:300

    signal qmlSignal(msg: string)

    width: 100; height: 100
    anchors.leftMargin: 50
    anchors.topMargin: 50
    Rectangle {
        id: rectId
        objectName: "rect"
        anchors.fill: parent
        anchors.centerIn: parent
       // color: "red"
        width: refWidth
        Text {
            id: rectText
            objectName: "rectTextObj"
            text:"Hello world"
            font.pointSize: 30
        }
        MouseArea {
            anchors.fill: parent
            onClicked: itemComp.qmlSignal("Hello from QML")
        }
    }

    function myQmlFunction(msg: string) : string {
        console.log("Got message:", msg)
        rectText.text = msg
        return "success"
    }
    }
