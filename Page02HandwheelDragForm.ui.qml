import QtQuick 2.13
import QtQuick.Controls 2.13

Page {
    width: 600
    height: 400
    wheelEnabled: false

    header: Label {
        text: qsTr("Handwheel Drag Page")
        font.pixelSize: Qt.application.font.pixelSize * 1.5
        padding: 10
    }

    Label {
        text: qsTr("This is the Handweel Drag Page.")
        anchors.centerIn: parent
    }
}
