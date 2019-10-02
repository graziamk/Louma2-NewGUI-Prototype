import QtQuick 2.13
import QtQuick.Controls 2.13

Page {

    Image {
        id: image
        antialiasing: true
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit

        source: "qrc:///images/P07-Planing.png"
    }

    background: Rectangle {
    color: "#999977"
    }

}
