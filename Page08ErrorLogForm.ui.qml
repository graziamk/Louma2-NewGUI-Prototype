import QtQuick 2.13
import QtQuick.Controls 2.13

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Error Log Page")
        font.pixelSize: Qt.application.font.pixelSize
        padding: 10
    }


    Label {
        text: qsTr("This is the Error Log Page")
        anchors.centerIn: parent
    }
}
