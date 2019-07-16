import QtQuick 2.13
import QtQuick.Controls 2.13

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Menu Page")
        font.pixelSize: Qt.application.font.pixelSize * 1.5
        padding: 10
    }


    Label {
        text: qsTr("This is the Menu Page")
        anchors.centerIn: parent
    }
}
