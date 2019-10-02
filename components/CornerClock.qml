import QtQuick 2.12

CustomRect1 {
    id: rectCornerClock

    // currently just using the default locale
    // should probably change this so that there is a config menu where we can set the locale
    // and reference that value here.
    property var locale: Qt.locale()

    color: "#BBBB77"
    width: ( 60 / 410 ) * parent.width
    height: ( 24 / 240 ) * parent.height
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.bottomMargin: ( 10 / 410 ) * parent.width
    anchors.leftMargin: anchors.bottomMargin

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


        padding: 12
        minimumPointSize: 7
        font.pointSize: parent.height / 3.25
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit

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
