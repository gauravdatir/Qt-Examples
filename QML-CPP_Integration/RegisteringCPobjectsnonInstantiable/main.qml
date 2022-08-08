import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import org.qmlExample 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Item {
        id: rootItem
        width: 900
        height: 900

        Message {
            id: messageObj
            author: "Gaurav"
            creationDate: new Date();
        }



        Rectangle {
            anchors.centerIn: parent
            width: 800
            height: 800
            color: "gray"
            Column {
                Text {
                    id: calenderText
                    height: 100
                    width: 300
                    color: "blue"
                    font.pointSize: 30
                    text:"Value only from calender: " + CalenderClass.SUNDAY
                }


                Row{
                    spacing: 10
                    Text {
                        height: 100
                        text:"author: "
                        font.pointSize: 30
                    }
                    Text {
                        id: name
                        text: messageObj.author
                        font.pointSize: 30
                    }
                }
                Row{
                    spacing: 10
                    Text {
                        height: 100
                        text:"new author"
                        font.pointSize: 30

                    }
                    TextField {
                        id: nameIn
                        height: 80
                        width: 300
                        font.pointSize: 30
                        onEditingFinished: {
                            messageObj.author = text
                        }

                    }
                }
                Text {
                    height: 100
                    text: messageObj.creationDate
                    font.pointSize: 30

                }
                TextArea {
                    id: msgbody
                    height: 200
                    text: "initial text"
                    font.pointSize: 30
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            var result = messageObj.postMessage("Hello from QML")
                            msgbody.text = result;
                            messageObj.refresh();
                        }
                    }

                }

            }
        }
    }
}
