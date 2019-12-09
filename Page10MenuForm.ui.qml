import QtQuick 2.13
import QtQuick.Controls 2.13

//import QtGraphicalEffects 1.13
//import QtQuick.Controls.Material 2.13
//import QtQml.Models 2.13

//import GlobalProperties 1.0
//import GlobalSounds 1.0
import "singletons/."
import "components"

Page {
    id: page09_MenuForm

    property alias testTextInput1: testTextInput1
    property alias testTextInput2: testTextInput2
    property alias testTextInput3: testTextInput3

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

            Row {
                spacing: 20

                //Text {
                //    text: "Input #" + (index + 1)
                //    anchors.verticalCenter: parent.verticalCenter
                //}

                TextInput {
                    id: testTextInput1
                    width: 100
                    height: 30


                    Rectangle {
                        border.width: 1
                        anchors.fill: parent
                        anchors.margins: -1
                        z: -1
                    }
                }

                TextInput {
                    id: testTextInput2
                    width: 100
                    height: 30


                    Rectangle {
                        border.width: 1
                        anchors.fill: parent
                        anchors.margins: -1
                        z: -1
                    }
                }

                TextInput {
                    id: testTextInput3
                    width: 100
                    height: 30


                    Rectangle {
                        border.width: 1
                        anchors.fill: parent
                        anchors.margins: -1
                        z: -1
                    }
                }

            }
    }

    Rectangle {
        id: keyboardRect
        width: parent.width
        height: parent.height * 0.3
        anchors.bottom: parent.bottom
        color: "transparent"
        visible: false
    }

    /*
    background: Rectangle {
    color: "#999977"
    }
*/
}
