import QtQuick 2.13
import QtQuick.Controls 2.13

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Planing Page")
        font.pixelSize: Qt.application.font.pixelSize * 1.5
        padding: 10
    }


    Label {
        text: qsTr("This is the Planing Page")
        anchors.centerIn: parent
    }
}
