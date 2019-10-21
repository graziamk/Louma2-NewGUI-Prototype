import QtQuick 2.12
import QtGraphicalEffects 1.13

import "qrc:///singletons/"

SunkenRectangle {
    id: sunkenRectOuter

    color: GlobalProperties.fieldBgColor
    width: GlobalProperties.btnWidth60 //( 60 / 410 ) * screenWidth
    height: GlobalProperties.btnHeight24 //( 24 / 240 ) * screenHeight

    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.bottomMargin: GlobalProperties.spacingV_10 //( 10 / 410 ) * screenHeight
    anchors.leftMargin: GlobalProperties.spacingH_10

    Rectangle {
        id: rectCornerClock

        // currently just using the default locale
        // should probably change this so that there is a config menu where we can set the locale
        // and reference that value here.
        property var locale: Qt.locale()

        color: GlobalProperties.fieldBgColor

        anchors {
            fill: parent;
            margins: GlobalProperties.sunkenDepth;
        }


        //border.color: "#818141"
        //border.width: ( height + width ) / 45

        //DropShadow {}

        /*

    Rectangle {
        id: rightBorder
        width: ( parent.height + parent.width ) / 45
        height: parent.height
        color: "#D9D9B3"
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }

    Rectangle {
        id: bottomBorder
        width: parent.width
        height: ( parent.height + parent.width ) / 45
        color: "#D9D9B3"
        anchors {
            right: parent.right
            left: parent.left
            bottom: parent.bottom
        }
    }

    Rectangle {
        id: leftBorder
        width: ( parent.height + parent.width ) / 45
        height: parent.height
        color: "#818141"
        anchors {
            left: parent.left
            bottom: parent.bottom
            top: parent.top
        }

    }
        */
        Text {
            id: displayTime
            text: qsTr("text")
            width: parent.width


            font.family: GlobalProperties.fontFamUI1
            font.weight: Font.Medium
            padding: 12
            minimumPointSize: 7
            font.pointSize: Math.round(GlobalProperties.fontSize1*14/12) //fontSize1
            anchors.centerIn: parent
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.FixedSize
            clip: true

            function timeChanged() {
                var date = new Date;
                displayTime.text = date.toLocaleTimeString(rectCornerClock.locale,"h:mm ap")
            }

            Timer {
                interval: 100; running: true; repeat: true;
                onTriggered: parent.timeChanged()
            }
        }
    }
}
