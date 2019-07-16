import QtQuick 2.12
import "./pages"


Image {
    id: image
    antialiasing: true
    source: "qrc:///images/louma32h.png"
    fillMode: Image.PreserveAspectCrop

    Text {
        id: louma2Text
        text: qsTr("Louma 2")
        font.pixelSize: Math.round(parent.height / 8)
        anchors.rightMargin: Math.round(parent.width / 5)
        anchors.right: parent.right
        anchors.bottomMargin: Math.round(parent.height / 10)
        anchors.bottom: parent.bottom
        style: Text.Raised
        font.bold: true
    }

    CornerClock{}
}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
