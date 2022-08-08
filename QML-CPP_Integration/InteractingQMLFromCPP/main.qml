import QtQuick 2.0

Item {
    property int stateNumber:5
    property int refWidth:0

    width: 100; height: 100
    anchors.leftMargin: 50
    anchors.topMargin: 50
    Rectangle {
        id: rectId
        objectName: "rect"
        anchors.fill: parent
        anchors.centerIn: parent
        color: "red"
        width: refWidth
        Text {
            id: rectText
            text:"Hello world"
        }
    }

    function myQmlFunction(msg: string) : string {
            console.log("Got message:", msg)
            rectText.text = msg
            return "success"
        }
}
