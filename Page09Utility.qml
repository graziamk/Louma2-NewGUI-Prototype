import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.13

Page09UtilityForm {
    id: page09_Utility

    property alias nodeModel: nodeModel

    //background: Rectangle { color: "#FFFFFF" }
/*
    background: Image {
        id: image
        antialiasing: true
        anchors.fill: parent
        fillMode: Image.Stretch

        opacity: 0.3

        z: 10

        source: "qrc:///images/P09-Utility.png"
    }

*/
/*
    Connections {
        target: audioSlider
        onPositionChanged: { rootWindow.playVolume = audioSlider.position }
    }
*/

    cstmBtn1DispBrightness.onClicked: {
        //ParentChange
        brightnessControDrawer.open()
    }

    cstmBtn1AudioCtrl.onClicked: audioControlDrawer.open()

    cstmBtn1ClosePage09.onClicked: {
        swipeView.setCurrentIndex(0) // return to Splash Screen @ (index 0)
    }

    audioControlDrawer.onSliderPositionChanged: {
        rootWindow.playVolume = audioControlDrawer.sliderPosition
    }



    DelegateModel {
        id: nodeModel

        model: ListModel {
            ListElement { nodeName: "Console" }
            ListElement { nodeName: "System" }
            ListElement { nodeName: "Pan" }
            ListElement { nodeName: "Tilt" }
            ListElement { nodeName: "Roll" }
            ListElement { nodeName: "Leveling" }
            ListElement { nodeName: "Telescope" }
            ListElement { nodeName: "Altitude" }
            ListElement { nodeName: "Azimuth" }
            ListElement { nodeName: "Dolly" }
            ListElement { nodeName: "QTerm" }
        }

        delegate: Component  {
            Text {
                text: nodeName
                font.pixelSize: Math.round(page09root.utilPageFontsize1 * 1.35)
                font.family: rootWindow.fontFamUI2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0 - Math.abs(Tumbler.displacement) / (nodeListTumbler.visibleItemCount / 2)
            }
        }
    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
