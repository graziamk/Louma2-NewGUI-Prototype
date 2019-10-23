import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.13
import QtQuick.Controls.Material 2.13
import QtQml.Models 2.13

//import GlobalProperties 1.0
//import GlobalSounds 1.0
import "singletons/."

Page09UtilityForm {
    id: page09_Utility

    property alias nodeModel: nodeModel
    property alias shaderItem: shaderItem

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
        mainSwipeView.setCurrentIndex(1)
        mainTabBar.setCurrentIndex(1)   // return to Operator Screen @ (index 1)
        // (per Mark's verbal instruction on 10/04?)
    }

    cstmBtn1PowerOffCrane.onClicked: {
        powerOffCrane()       // return to main splash screen (and disable SwipeView)
    }

    audioControlDrawer.onSliderValueChanged: {
        console.log("onSliderValueChanged: new audioControlDrawer.sliderValue: "+audioControlDrawer.sliderValue)
        console.log("onSliderValueChanged: new audioControlDrawer.sliderPosition is: "+audioControlDrawer.sliderPosition)
        GlobalProperties.audioVolume = (audioControlDrawer.sliderValue ** 3.5)
        console.log("audioVolume set to: "+GlobalProperties.audioVolume+", based on Slider Value of: "+audioControlDrawer.sliderValue)
        GlobalSounds.volumeChangeSound.play()
    }

    audioControlDrawer.leftButton.onCheckedChanged: {
        GlobalProperties.audioMute = audioControlDrawer.leftButton.checked
        //console.log("audioControlDrawer.middlebutton.checked: valueOf = " + audioControlDrawer.leftButton.checked.toString())
        //console.log("GlobalPropertiesonAudioMuteChanged: audioMute = " + GlobalProperties.audioMute)
    }


    audioControlDrawer.middleButton.onCheckedChanged: {
        GlobalProperties.errorMute = audioControlDrawer.middleButton.checked
    }

    nodeListTumbler.onCurrentIndexChanged: {
        if ( GlobalProperties.audioMute ) {
            console.log("Tumbler selection sound muted");
        } else {
            GlobalSounds.tumblerSelectSound.play() ;
            console.log("GlobalSounds.tumblerSelectSound.play() invoked.");
        }
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
                font.pixelSize: Math.round(GlobalProperties.fontSize1 * 1.35)
                font.family: GlobalProperties.fontFamUI2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0 - Math.abs(Tumbler.displacement) / (nodeListTumbler.visibleItemCount / 2)
            }
        }
    }

    Item {
        id: shaderItem

        Rectangle {
            anchors.fill: parent
            anchors.margins: parent.height/100  // this is a hack.  'anchors.fill: parent' should provide
                                                // a perfect fit. I need to look into this when I have some
                                                // time. Also, consider adding a gap and darkness between the
                                                // SunkenRectangle inner border and the tumbler's outer border.
            radius: rectComboBoxContainer.radius/1.75
            antialiasing: true;


            gradient: Gradient {
                GradientStop { position: 0.0; color: Material.color(Material.Grey,Material.Shade600); }
                GradientStop { position: 0.5; color: "transparent"; }
                GradientStop { position: 1.0; color: Material.color(Material.Grey,Material.Shade600); }
            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
