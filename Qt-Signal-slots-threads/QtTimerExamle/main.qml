import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 1000
    height: 1000
    title: qsTr("Hello World")

    Rectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        height: 20
        width: 300
        Column {
            Text {
                id: dateComp
                color: "red"
                font.pointSize: 10
                function update() {
                    dateComp.text = Date()
                }
            }
            Text {
                id: timeRemaining
                text: "Time to Udpate";
                color: "red"
                font.pointSize: 10

            }
        }
        Timer {
            id: timeComp
            interval: 10000
            repeat: true
            running: true
            triggeredOnStart: true
            onTriggered: {
                dateComp.update()

            }
        }
        Connections {
            target: msg
            onInterUpdated : {
                timeRemaining.text = "Time to Udpate: " + interVal;
            }
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 1000
        height: 800
        color: "red"
        Column {
            Row{
                spacing: 10
                Text {
                    height: 100
                    text:"author: "
                    font.pointSize: 30
                }
                Text {
                    id: name
                    text: msg.author
                    font.pointSize: 30
                    Component.onCompleted: {
                        msg.author = "Gaurav"  // invokes Message::setAuthor()
                    }
                }
            }

            Text {
                height: 100
                text: "Creation date: " + msg.creationDate
                font.pointSize: 20

                Component.onCompleted: {
                    msg.creationDate = new Date()
                }
            }

            Text {
                height: 100
                text: msg.currentDate
                font.pointSize: 20
                Component.onCompleted: {
                    msg.currentDate = new Date()
                }
            }



            TextArea {
                id: msgbody
                height: 200
                text: "initial text"
                font.pointSize: 30
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var result = msg.postMessage("Hello from QML")
                        msgbody.text = result;
                        msg.refresh();
                    }
                }

            }

        }



        InputPanel {
            id: inputPanel
            z: 99
            x: 0
            y: window.height
            width: window.width

            states: State {
                name: "visible"
                when: inputPanel.active
                PropertyChanges {
                    target: inputPanel
                    y: window.height - inputPanel.height
                }
            }
            transitions: Transition {
                from: ""
                to: "visible"
                reversible: true
                ParallelAnimation {
                    NumberAnimation {
                        properties: "y"
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
}
