import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QM dialog example")
    Dialog {
        id: dialog
        title: "Title"
        standardButtons: Dialog.Ok | Dialog.Cancel
        modal: false
        anchors.centerIn: parent


        onAccepted: console.log("Ok clicked")
        onRejected: console.log("Cancel clicked")
    }
    Button {
        id: okbutton
        text: "save"
        width: 100
        height: 70
        anchors.centerIn: parent
        onClicked: {
            dialog.open()
        }
    }
}
