import QtQuick 2.12
import QtQml.Models 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.12
import QtQuick.VirtualKeyboard 2.13

import "qrc:///components"

//import GlobalProperties 1.0
//import GlobalSounds 1.0
import "singletons/."

Page {
    id: page10_MenuForm

    property alias itemUtilityPage: itemUtilityPage
    property alias page10_MenuForm: page10_MenuForm
    property alias nodeTumbler: nodeTumbler
    property alias rectComboBoxContainer: rectComboBoxContainer
    property alias sunkenRectTopRight: sunkenRectTopRight
    property alias sunkenRectDeviceDescription: sunkenRectDeviceDescription
    property alias sunkenRectTextInputField2: sunkenRectTextInputField2
    property alias sunkenRectTextInputField3: sunkenRectTextInputField3
    property alias textInputTopRight: textInputTopRight
    property alias testTextInput: testTextInput
    property alias textInputField2: textInputField2
    property alias textInputField3: textInputField3
    property alias textInputNumeric: textInputNumeric
    property alias rectUtilDefault: rectUtilDefault
    property alias topRow: topRect

    Item {
        id: itemUtilityPage
        anchors.fill: parent
        z: -1

        anchors.rightMargin: GlobalProperties.spacingH_10
        anchors.leftMargin: GlobalProperties.spacingH_10
        anchors.topMargin: GlobalProperties.spacingV_10
        anchors.bottomMargin: GlobalProperties.spacingV_10

        Column {
            id: rectUtilDefault
            z: 0
            //color: "transparent"

            //height: GlobalProperties.rowH_75 + GlobalProperties.spacingV_5
            //        + GlobalProperties.rowH_29

            anchors.fill: parent

            anchors.topMargin: GlobalProperties.spacingV_10
            spacing: GlobalProperties.spacingV_10

            Rectangle {
                id: topRect


                height: GlobalProperties.rowH_75

                //anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left

                color: "transparent"

                SunkenRectangle {
                    id: rectComboBoxContainer

                    width: page09root.nodeListWidth
                    height: parent.height

                    color: GlobalProperties.fieldBgColor
                    radius: (Math.min(GlobalProperties.btnWidth85,
                                      GlobalProperties.btnHeight35) / 7)

                    anchors.margins: GlobalProperties.myOffset
                    anchors.rightMargin: GlobalProperties.spacingH_10 + GlobalProperties.myOffset

                    Tumbler {
                        id: nodeTumbler

                        anchors.fill: parent
                        anchors.margins: GlobalProperties.sunkenDepth - GlobalProperties.myOffset


                        background: shaderItem
                        wrap: false

                        model: NodeListModel {}

                        delegate: Text {
                            text: nodeName
                            font.pixelSize: Math.round(
                                                GlobalProperties.fontSize1 * 1.35)
                            font.family: GlobalProperties.fontFamUI2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            opacity: 1.0 - Math.abs(Tumbler.displacement)
                                     / (nodeTumbler.visibleItemCount / 2)
                        }

                        Rectangle {
                            id: topBgRect
                            opacity: nodeTumbler.enabled ? 0.2 : 0.1
                            color: GlobalProperties.fieldBgColor
                            width: parent.width
                            height: 1
                            anchors.top: parent.top
                        }
                        Rectangle {
                            id: btmBgRect
                            opacity: nodeTumbler.enabled ? 0.2 : 0.1
                            color: GlobalProperties.fieldBgColor
                            width: parent.width
                            height: 1
                            anchors.bottom: parent.bottom
                        }

                        Rectangle {
                            id: rectSelectionColoring
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: Math.round(parent.height * 0.4)
                            //anchors.top: upperLineMarker.top
                            //anchors.bottom: lowerLineMarker.bottom
                            width: parent.width // Math.round(parent.width * 0.6)
                            height: Math.round(
                                        parent.height * 0.2) // Math.round(parent.width * 0.1) //Math.round(parent.height / 75)
                            color: "#a0f0f0" //"darkgray" //"#21be2b"
                            opacity: 0.2
                        }
                    }
                }

                SunkenRectangle {
                    id: sunkenRectTopRight

                    color: GlobalProperties.fieldBgColor
                    height: GlobalProperties.rowH_29

                    width: Math.round(0.3 * parent.width)
                    anchors.top: parent.top
                    anchors.right: parent.right

                    anchors.margins: GlobalProperties.myOffset

                    radius: Math.min(GlobalProperties.btnWidth85,
                                     GlobalProperties.btnHeight35) / 7

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: GlobalProperties.sunkenDepth
                        radius: parent.radius

                        TextField {
                            id: textInputTopRight

                            anchors.fill: parent
                            anchors.centerIn: parent

                            rightPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                            leftPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                            topPadding: Math.round(GlobalProperties.spacingV_5 / 2)
                            bottomPadding: topPadding / 2

                            verticalAlignment: Text.AlignVCenter

                            placeholderText: qsTr("Text Top Right")
                            placeholderTextColor : "lightsteelblue"

                            color: "black"

                            wrapMode: TextInput.NoWrap
                            echoMode: TextInput.Normal
                            cursorVisible: true

                            font.family: GlobalProperties.fontFamUI2
                            font.pixelSize: Math.round(GlobalProperties.fontSize1 * 1.5)
                            font.weight: Font.Normal
                            font.capitalization: Font.MixedCase
                        }
                    }
                }

                SunkenRectangle {
                    id: sunkenRectNumeric

                    color: GlobalProperties.fieldBgColor
                    height: GlobalProperties.rowH_29

                    width: Math.round(0.2 * parent.width)
                    anchors.bottom: parent.bottom
                    anchors.left: rectComboBoxContainer.right

                    anchors.leftMargin: GlobalProperties.spacingH_5

                    radius: Math.min(GlobalProperties.btnWidth85,
                                     GlobalProperties.btnHeight35) / 7


                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: GlobalProperties.sunkenDepth
                        radius: parent.radius

                        TextField {
                            id: textInputNumeric

                            anchors.fill: parent
                            anchors.centerIn: parent

                            rightPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                            leftPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                            topPadding: Math.round(GlobalProperties.spacingV_5 / 2)
                            bottomPadding: topPadding / 2

                            verticalAlignment: Text.AlignVCenter

                            placeholderText: qsTr("55.5")
                            placeholderTextColor : "lightsteelblue"

                            color: "black"

                            inputMethodHints: Qt.ImhDigitsOnly

                            //wrapMode: TextInput.NoWrap
                            echoMode: TextInput.Normal
                            cursorVisible: true

                            font.family: GlobalProperties.fontFamUI2
                            font.pixelSize: Math.round(GlobalProperties.fontSize1 * 1.5)
                            font.weight: Font.Normal
                            font.capitalization: Font.MixedCase


                        }
                    }
                }
            }

            SunkenRectangle {
                id: sunkenRectDeviceDescription

                color: GlobalProperties.fieldBgColor
                height: GlobalProperties.rowH_29

                //width: Math.round(0.3 * parent.width)
                anchors.right: parent.right
                anchors.left: parent.left

                anchors.margins: GlobalProperties.myOffset

                radius: Math.min(GlobalProperties.btnWidth85,
                                 GlobalProperties.btnHeight35) / 7

                Rectangle {
                    id: rectDeviceDescription

                    anchors.fill: parent
                    anchors.margins: GlobalProperties.sunkenDepth
                    radius: parent.radius

                    TextField {
                        id: testTextInput

                        anchors.fill: parent
                        anchors.centerIn: parent

                        rightPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                        leftPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                        topPadding: Math.round(GlobalProperties.spacingV_5 / 2)
                        bottomPadding: topPadding / 2

                        verticalAlignment: Text.AlignVCenter

                        placeholderText: qsTr("Existing Text")
                        placeholderTextColor : "lightsteelblue"

                        color: "black"

                        text: qsTr("Device Description")

                        wrapMode: TextInput.NoWrap
                        echoMode: TextInput.Normal
                        cursorVisible: true

                        font.family: GlobalProperties.fontFamUI2
                        font.pixelSize: Math.round(GlobalProperties.fontSize1 * 1.5)
                        font.weight: Font.Normal
                        font.capitalization: Font.MixedCase
                    }
                }
            }

            SunkenRectangle {
                id: sunkenRectTextInputField2

                color: GlobalProperties.fieldBgColor
                height: GlobalProperties.rowH_29

                //width: Math.round((300 / 320) * utilityPage.width)
                anchors.right: parent.right
                anchors.left: parent.left

                anchors.margins: GlobalProperties.myOffset

                radius: Math.min(GlobalProperties.btnWidth85,
                                 GlobalProperties.btnHeight35) / 7

                Rectangle {
                    id: rectInputField2

                    anchors.fill: parent
                    anchors.margins: GlobalProperties.sunkenDepth
                    radius: parent.radius

                    TextField {
                        id: textInputField2

                        anchors.fill: parent
                        anchors.centerIn: parent

                        rightPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                        leftPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                        topPadding: Math.round(GlobalProperties.spacingV_5 / 2)
                        bottomPadding: topPadding / 2

                        verticalAlignment: Text.AlignVCenter

                        placeholderText: qsTr("Text Input Field 2 - Full Sreen")
                        placeholderTextColor : "lightsteelblue"

                        color: "black"

                        wrapMode: TextInput.NoWrap
                        echoMode: TextInput.Normal
                        cursorVisible: true

                        font.family: GlobalProperties.fontFamUI2
                        font.pixelSize: Math.round(GlobalProperties.fontSize1 * 1.5)
                        font.weight: Font.Normal
                        font.capitalization: Font.MixedCase
                    }
                }
            }

            SunkenRectangle {
                id: sunkenRectTextInputField3

                color: GlobalProperties.fieldBgColor
                height: GlobalProperties.rowH_29
                width: Math.round(testTextInput.width * 0.6)

                anchors.right: parent.right

                anchors.margins: GlobalProperties.myOffset
                //anchors.topMargin: GlobalProperties.myOffset + GlobalProperties.spacingV_5

                radius: Math.min(GlobalProperties.btnWidth85,
                                 GlobalProperties.btnHeight35) / 7

                Rectangle {
                    id: rectInputField3

                    anchors.fill: parent
                    anchors.margins: GlobalProperties.sunkenDepth
                    radius: parent.radius

                    TextField {
                        id: textInputField3

                        anchors.fill: parent
                        anchors.centerIn: parent

                        height: testTextInput.height

                        rightPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                        leftPadding: Math.round(GlobalProperties.spacingH_5 / 2)
                        topPadding: Math.round(GlobalProperties.spacingV_5 / 2)
                        bottomPadding: topPadding / 2

                        verticalAlignment: Text.AlignVCenter

                        placeholderText: qsTr("Blank Input 2")
                        placeholderTextColor: "lightsteelblue"

                        color: "black"
                        wrapMode: TextInput.NoWrap
                        echoMode: TextInput.Normal
                        cursorVisible: true

                        font.family: GlobalProperties.fontFamUI2
                        font.pixelSize: Math.round(GlobalProperties.fontSize1 * 1.5)
                        font.weight: Font.Normal
                        font.capitalization: Font.MixedCase
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

