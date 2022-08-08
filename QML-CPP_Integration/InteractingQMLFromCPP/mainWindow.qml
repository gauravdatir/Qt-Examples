import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: appWindow

    visible: true
    title: "Basic layouts"
    property int margin: 11
    width: 800
    height:800
  //  minimumWidth: mainItem.Layout.minimumWidth + 2 * margin
   // minimumHeight: mainItem.Layout.minimumHeight + 2 * margin

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "Open..." }
            MenuItem { text: "Close" }
        }

    }

}
