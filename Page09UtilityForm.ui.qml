// Remember to change the version to 2.13, only changed to 2.12 because of error in the
// QtCreator Design mode
import QtQuick 2.12
import QtQml.Models 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.12

import "./components"

Page {
    id: page09_UtilityForm
    z: -10
    width: 600
    height: 400

    property alias page09_UtilityForm: page09_UtilityForm
    property alias cstmBtn1ClosePage09: cstmBtn1ClosePage09
    property alias itemUtilityPage: itemUtilityPage
    property alias rectUtilityScreenLvl1: rectUtilityScreenLvl1
    property alias rectDeviceDescription: rectDeviceDescription
    property alias cstmBtn1CameraPower: cstmBtn1CameraPower
    property alias cstmBtn1ServoPower: cstmBtn1ServoPower
    property alias cstmBtn1PowerOffCrane: cstmBtn1PowerOffCrane
    property alias cstmBtn1DispBrightness: cstmBtn1DispBrightness
    property alias cstmBtn1AudioCtrl: cstmBtn1AudioCtrl
    property alias cstmBtn1ClearHome: cstmBtn1ClearHome
    property alias cstmBtn1UpdateFw: cstmBtn1UpdateFw
    property alias cstmBtn1RestartNode: cstmBtn1RestartNode
    property alias cstmBtn1ShowNodeParams: cstmBtn1ShowNodeParams

    property alias audioControlDrawer: audioControlUtilDrawer
    property alias brightnessControDrawer: brightnessControlUtilDrawer

    property alias nodeListTumbler: nodeListTumbler

    Text {
        id: txtUtilityPageFooter
        font.family: rootWindow.fontFamUI2
        font.pixelSize: page09root.utilPageFontsize1
        text: qsTr("IIR - 16Jan19")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: page09root.smallVspacing
        anchors.horizontalCenter: parent.horizontalCenter
    }

    CornerClock {
    }

    Item {
        id: itemUtilityPage
        anchors.fill: parent
        z: -1

        anchors.rightMargin: page09root.largeHspacing
        anchors.leftMargin: page09root.largeHspacing
        anchors.topMargin: page09root.largeVspacing
        anchors.bottomMargin: page09root.largeVspacing

        Rectangle {
            id: rectUtilDefault
            z: 0
            color: "transparent"

            height: page09root.firstRowHeight + page09root.smallVspacing
                    + page09root.secondRowHeight

            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left

            Rectangle {
                id: rectUtilityScreenLvl1
                color: "transparent"

                height: page09root.firstRowHeight

                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left

                CustomRect1 {
                    id: rectComboBoxContainer

                    color: "#F0F0F0"
                    width: page09root.nodeListWidth
                    radius: Math.round(
                                (page09root.largeHspacing + page09root.largeVspacing) / 8)

                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left

                    anchors.rightMargin: page09root.largeHspacing

                    /*
                    Flickable {

                        anchors.fill: parent

                        ListView {
                            id: nodeList
                            anchors.fill: parent
                            snapMode: ListView.SnapOneItem

                            model: modelResetNodeList
                            highlight: Rectangle {
                                color: "lightsteelblue"
                                radius: 5
                            }
                            highlightFollowsCurrentItem: true
                            highlightMoveDuration: 250
                            highlightMoveVelocity: 50
                            focus: true
                            spacing: Math.round(
                                         page09root.utilPageFontsize1 / 5)
                            clip: true
                            currentIndex: -1
                        }

                        DelegateModel {
                            id: modelResetNodeList

                            model: ListModel {
                                ListElement {
                                    nodeName: "Console"
                                }
                                ListElement {
                                    nodeName: "System"
                                }
                                ListElement {
                                    nodeName: "Pan"
                                }
                                ListElement {
                                    nodeName: "Tilt"
                                }
                                ListElement {
                                    nodeName: "Roll"
                                }
                                ListElement {
                                    nodeName: "Leveling"
                                }
                                ListElement {
                                    nodeName: "Telescope"
                                }
                                ListElement {
                                    nodeName: "Altitude"
                                }
                                ListElement {
                                    nodeName: "Azimuth"
                                }
                                ListElement {
                                    nodeName: "Dolly"
                                }
                                ListElement {
                                    nodeName: "QTerm"
                                }
                            }

                            delegate: Item {
                                id: nodeContainer
                                width: parent.width
                                height: Math.round(
                                            page09root.utilPageFontsize1 * 1.3)
                                Column {
                                    Text {
                                        font.pixelSize: Math.round(
                                                            page09root.utilPageFontsize1 * 1.35)
                                        font.family: rootWindow.fontFamUI2
                                        leftPadding: Math.round(
                                                         page09root.smallVspacing / 2)

                                        color: "Black"
                                        horizontalAlignment: Text.AlignHCenter
                                        text: nodeName
                                    }
                                }

                                MouseArea {
                                    id: nodeMouseArea
                                    anchors.fill: parent
                                    hoverEnabled: true
                                }
                            }
                        }
                    }

                    */
                    Tumbler {
                        id: nodeListTumbler

                        anchors.fill: parent

                        background: Item {
                            Rectangle {
                                opacity: nodeListTumbler.enabled ? 0.2 : 0.1
                                border.color: "#000000"
                                width: parent.width
                                height: 1
                                anchors.top: parent.top
                            }

                            Rectangle {
                                opacity: nodeListTumbler.enabled ? 0.2 : 0.1
                                border.color: "#000000"
                                width: parent.width
                                height: 1
                                anchors.bottom: parent.bottom
                            }
                        }


                        contentItem: ListView {
                            model: nodeModel
                            //delegate: nameDelegate
                            snapMode: ListView.SnapToItem
                            highlightRangeMode: ListView.StrictlyEnforceRange
                            preferredHighlightBegin: height / 2 - (height / nodeListTumbler.visibleItemCount / 2)
                            preferredHighlightEnd: height / 2 + (height / nodeListTumbler.visibleItemCount / 2)
                            clip: true
                        }
                        /*
                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: Math.round(parent.height * 0.4)
                            width: parent.width // Math.round(parent.width * 0.6)
                            height: Math.round(parent.width * 0.1) //Math.round(parent.height / 75)
                            color: "darkgray" //"#21be2b"
                            opacity: 0.2
                        }
                        */

                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: Math.round(parent.height * 0.4)
                            width: Math.round(parent.width * 0.6)
                            height: Math.round(parent.height / 75)
                            color: "#21be2b"
                        }

                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: Math.round(parent.height * 0.6)
                            width: Math.round(parent.width * 0.6)
                            height: Math.round(parent.height / 75)
                            color: "#21be2b"
                        }

                    }

                }

                Grid {
                    id: gridUtilityScreenLvl1

                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.leftMargin: page09root.largeHspacing

                    rowSpacing: page09root.smallVspacing
                    columnSpacing: page09root.largeHspacing
                    rows: 2
                    columns: 2

                    CustomButton1 {
                        id: cstmBtn1ShowNodeParams
                        width: page09root.lrgBtnWidth
                        height: page09root.lrgBtnHeight
                        //ubID: "btnShowNodeParameters" // If I do end up finding that there's a need to
                        // tag each button with an ID, uncomment and add
                        // the ubID property to the appropriate Button qml file.
                        text: "Show Node Parameters"
                    }

                    CustomButton1 {
                        id: cstmBtn1RestartNode
                        width: page09root.lrgBtnWidth
                        height: page09root.lrgBtnHeight
                        //ubID: "btnRestartNode"
                        text: "Restart Node"
                    }

                    CustomButton1 {
                        id: cstmBtn1UpdateFw
                        width: page09root.lrgBtnWidth
                        height: page09root.lrgBtnHeight
                        //ubID: "btnUpdateFW"
                        text: "Update Firmware"
                    }

                    CustomButton1 {
                        id: cstmBtn1ClearHome
                        width: page09root.lrgBtnWidth
                        height: page09root.lrgBtnHeight
                        //ubID: "btnClearHome"
                        text: "Clear Home"
                    }
                }
            }

            CustomRect1 {
                id: rectDeviceDescription

                color: "#F0F0F0"
                height: page09root.secondRowHeight

                //width: Math.round((300 / 320) * utilityPage.width)
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: rectUtilityScreenLvl1.bottom

                anchors.topMargin: page09root.smallVspacing

                radius: Math.round(
                            (page09root.largeHspacing + page09root.largeVspacing) / 8)

                Text {
                    id: name
                    font.family: rootWindow.fontFamUI2
                    font.pixelSize: Math.round(page09root.utilPageFontsize1 * 1.35)
                    rightPadding: Math.round(page09root.smallVspacing / 2)
                    leftPadding: Math.round(page09root.smallVspacing / 2)
                    topPadding: Math.round(page09root.smallVspacing / 2)
                    bottomPadding: Math.round(topPadding / 2)

                    text: qsTr("Device Description")
                }
            }
        }

        Grid {
            id: gridUtilityScreenLvl2

            anchors.bottom: itemUtilityScreenLvl3.top
            anchors.right: parent.right
            anchors.left: parent.left

            anchors.bottomMargin: page09root.smallVspacing

            rows: 2
            rowSpacing: page09root.smallVspacing
            columns: 3
            columnSpacing: page09root.largeHspacing

            layoutDirection: Qt.RightToLeft
            horizontalItemAlignment: Grid.AlignRight

            CustomButton1 {
                id: cstmBtn1CameraPower
                width: page09root.lrgBtnWidth
                height: page09root.lrgBtnHeight
                //ubID: "btnCameraPower"
                checkable: true
                text: (!checked) ? "Camera Power (Off)" : "Camera Power (On)"
            }

            CustomButton1 {
                id: cstmBtn1ServoPower
                width: page09root.lrgBtnWidth
                height: page09root.lrgBtnHeight
                //ubID: "btnServoPower"
                checkable: true
                text: (!checked) ? "Servo Power (Off)" : "Servo Power (On)"
            }

            CustomButton1 {
                id: cstmBtn1PowerOffCrane
                width: page09root.lrgBtnWidth
                height: page09root.lrgBtnHeight
                //ubID: "btnPowerOffCrane"
                text: "Power-Off Crane"
            }

            CustomButton1 {
                id: cstmBtn1DispBrightness
                width: page09root.lrgBtnWidth
                height: page09root.lrgBtnHeight
                //ubID: "btnDisplayBrightness"
                text: "Display Brightness"
            }

            CustomButton1 {
                id: cstmBtn1AudioCtrl
                width: page09root.lrgBtnWidth
                height: page09root.lrgBtnHeight
                //ubID: "btnAudioControl"
                text: "Audio Control"
            }
        }

        Item {
            id: itemUtilityScreenLvl3

            width: cstmBtn1ClosePage09.width
            height: cstmBtn1ClosePage09.height

            anchors.bottom: parent.bottom
            anchors.right: parent.right

            Layout.alignment: Qt.AlignRight

            CustomButton1 {
                id: cstmBtn1ClosePage09
                width: page09root.smallBtnWidth
                height: page09root.smallBtnHeight

                Layout.alignment: Qt.AlignRight

                //ubID: "btnDoneWithUP"
                text: "Done"
            }


            UtilDrawer {
                id: audioControlUtilDrawer
                sliderLabel.text: "Set Note Volume:"

                middleButton.visible: true
                middleButton.checkable: true
                middleButton.text: (!middleButton.checked) ? "Error Mute" : "Audio Muted"

                leftButton.visible: true
                leftButton.checkable: true
                leftButton.text: (!leftButton.checked) ? "Error Mute" : "Audio Muted"
            }

            UtilDrawer {
                id: brightnessControlUtilDrawer
                sliderLabel.text: "Set Display Brightness:"
            }

        }
    }
}
