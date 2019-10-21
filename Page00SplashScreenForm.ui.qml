import QtQuick 2.13
import QtQuick.Controls 2.13

import "qrc:///components/"

import "./singletons/."

Item {
    id: page00_SplashScreenForm

    Image {
        id: image
        antialiasing: true
        source: "qrc:///images/P00-Louma32h.jpg"

        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        z: 0
    }

}
