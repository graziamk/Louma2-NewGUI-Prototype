import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.12

import "qrc:///singletons/."

Rectangle {
    id: utilityButton
    property alias isToggable: itemState.toggable
    property alias toggled: itemState.isToggled
    property alias altText: itemState.addText
    property alias ubText: textUB.text
    property alias ubID: itemState.ubMyID

    property int offset: Math.round(Math.min(GlobalProperties.btnWidth85,GlobalProperties.btnHeight35)/22)
    property int myRadius: Math.round(Math.min(utilityButton.width,utilityButton.height)/3.5)

    radius: myRadius
    //border.width: offset  // commented as we're replacing this with shadowing effects

    signal clicked()
    
    Item {
        id: itemState
        property bool toggable: false
        property bool isToggled: false
        property bool firstRun: true
        property color origColor: "#B0B0B0"
        property color altColor: "#B0C4DE"
        property string addText
        property string origText
        property string ubMyID
    }
    
    color: itemState.origColor

    Rectangle { // draws the outter shadow/highlight
        id: sourceOutter;
        radius: myRadius
        antialiasing: true;
        gradient: Gradient {
            GradientStop { position: 0.0; color: "black"; }
            GradientStop { position: 0.5; color: "transparent"; }
            GradientStop { position: 1.0; color: "white"; }
        }
        anchors {
            fill: parent;
            margins: -offset;
        }
    }


    Rectangle { // mask for outer 3D effect
        id: maskOutter;
        color: "transparent";
        radius: myRadius;
        antialiasing: true;
        border {
            width: offset;
            color: "black";
        }
        anchors.fill: sourceOutter;
    }

    OpacityMask { // outter effect
        opacity: 0.65;
        source: ShaderEffectSource {
            sourceItem: sourceOutter;
            hideSource: true;
        }
        maskSource: ShaderEffectSource {
            sourceItem: maskOutter;
            hideSource: true;
        }
        anchors.fill: sourceOutter;
    }


    /*
    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0,0)
        end: Qt.point(0,parent.height)
        gradient: Gradient {
            GradientStop {
              position: 0.0
              color: "#909090"
            }
            GradientStop {
              position: 0.5
              color: "#b0b0b0"
            }
            GradientStop {
              position: 1.0
              color: "#909090"
            }
        }
    }
*/
    //    property color origColor: utilityButton.color
    
    Text {
        id: textUB
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: rootWindow.fontFamUI2
        // A 1-inch font is size 72. There are 25.4 mm in an inch. So there are ~2.835 points per mm
        // We also want our font size to be 1/2 of window height, so:
        font.pixelSize: (height === GlobalProperties.btnHeight35) ? GlobalProperties.fontSize1 : GlobalProperties.fontSize1 * 1.15
        fontSizeMode: Text.FixedSize //investigate font sizing
        lineHeight: 0.85
        wrapMode: Text.WordWrap
        bottomPadding: Math.round(parent.height / 25)
        rightPadding: Math.round(GlobalProperties.spacingV_5 / 2)
        leftPadding: Math.round(GlobalProperties.spacingV_5 / 2)
        
        text: "Undefined"
    }
    
    MouseArea {
        id: ubMA
        anchors.fill: parent
        
        onClicked: {
            if (itemState.firstRun) { itemState.firstRun = false; itemState.origText = textUB.text }
            console.log("rectangle color is: " + parent.color)
            utilityButton.clicked()
            if (itemState.toggable) {
                
                if (itemState.isToggled) {
                    itemState.isToggled = false
                    textUB.text = itemState.origText
                    saBtnUp.start()
                } else {
                    itemState.isToggled = true
                    textUB.text = itemState.addText
                    saBtnDown.start()
                }
                
            } else {
                saBtnClick.start()
            }
        }
        
        onPressed:  ( !GlobalProperties.audioMute ) ? GlobalSounds.mousePressSound.play() : console.log("Mouse press muted")
    }
    
    SequentialAnimation on color {
        id: saBtnClick
        loops: 1
        ColorAnimation { to: "#E0E0E0"; duration: 50 }
        ColorAnimation { to: utilityButton.color ; duration: 50 }
    }
    
    SequentialAnimation on color {
        id: saBtnDown
        loops: 1
        ColorAnimation { to: itemState.altColor ; duration: 50 }
    }
    
    SequentialAnimation on color {
        id: saBtnUp
        loops: 1
        ColorAnimation { to: itemState.origColor ; duration: 50 }
    }
    
}
