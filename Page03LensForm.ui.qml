import QtQuick 2.13
import QtQuick.Controls 2.13

Page {

    Image {
        id: image
        antialiasing: true
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit

        source: "qrc:///images/P03-Lens.png"
    }

    background: Rectangle {
    color: "#999977"
    }
}
