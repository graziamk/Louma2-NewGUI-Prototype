// Remember to change the version to 2.13, only changed to 2.12 because of error in the
// QtCreator Design mode
import QtQuick 2.12
import QtQml.Models 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import "pages"

Page {
    id: utilityPage
    width: 600
    height: 400
    property alias utilBtnButtonMute: utilBtnButtonMute
    property alias utilBtnErrorMute: utilBtnErrorMute
    property alias itemAudioCtrl: itemAudioCtrl
    property alias utilBtnCloseAudioCtrl: utilBtnCloseAudioCtrl
    property alias audioSlider: audioSlider
    property alias utilBtnDoneWithUP: utilBtnDoneWithUP
    property alias utilBtnCloseSB: utilBtnCloseSB
    property alias sbSlider: sbSlider
    property alias rowUtilityScreenLvl1: rowUtilityScreenLvl1
    property alias itemScreenBrightness: itemScreenBrightness
    property alias rectDeviceDescription: rectDeviceDescription
    property alias utilBtnCameraPower: utilBtnCameraPower
    property alias utilBtnServoPower: utilBtnServoPower
    property alias utilBtnPowerOffCrane: utilBtnPowerOffCrane
    property alias utilBtnDispBrightness: utilBtnDispBrightness
    property alias utilBtnAudioCtrl: utilBtnAudioCtrl
    property alias utilBtnTop4: utilBtnTop4
    property alias utilBtnTop3: utilBtnTop3
    property alias utilBtnTop2: utilBtnTop2
    property alias utilBtnTop1: utilBtnTop1

    Rectangle {
        id: rectUtilityPage
        color: "#E0E0E0"
        anchors.fill: parent

        readonly property int lrgBtnWidth: Math.round((85 / 320) * width)
        readonly property int lrgBtnHeight: Math.round((35 / 240) * height)
        readonly property int smallBtnWidth: Math.round((60 / 320) * width)
        readonly property int smallBtnHeight: Math.round((24 / 240) * height)
        readonly property int smallHspacing: Math.round((5 / 320) * width)
        readonly property int largeHspacing: Math.round((10 / 320) * width)
        readonly property int smallVspacing: Math.round((5 / 240) * height)
        readonly property int largeVspacing: Math.round((10 / 240) * height)

        readonly property int fontSize: 12
        readonly property int utilPageFontsize1: Math.round(
                                                     72 / (25.4 * rootWindow.screenDPmm)
                                                     * (lrgBtnHeight / 2.5))

        Text {
            id: txtUtilityPageFooter
            x: 267
            y: 299
            font.family: "Helvetica"
            font.pointSize: rectUtilityPage.utilPageFontsize1
            text: qsTr("IIR - 16Jan19")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: rectUtilityPage.smallVspacing
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CornerClock {
        }

        ColumnLayout {
            id: columnLayout
            width: parent.width
            height: parent.height

            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.fill: parent

            anchors.rightMargin: rectUtilityPage.largeHspacing
            anchors.leftMargin: rectUtilityPage.largeHspacing
            anchors.topMargin: rectUtilityPage.largeVspacing
            anchors.bottomMargin: rectUtilityPage.largeVspacing

            spacing: rectUtilityPage.smallVspacing

            Row {
                id: rowUtilityScreenLvl1
                Layout.fillWidth: true
                Layout.preferredHeight: Math.round(
                                            (75 / 240) * rectUtilityPage.height)

                spacing: rectUtilityPage.largeHspacing

                Rectangle {
                    id: rectComboBoxContainer
                    width: Math.round((110 / 320) * rectUtilityPage.width)
                    height: Math.round((75 / 240) * rectUtilityPage.height)
                    color: "#b0b0b0"
                    radius: Math.round((rectUtilityPage.largeHspacing
                                        + rectUtilityPage.largeVspacing) / 12)

                    Flickable {
                        height: parent.height
                        anchors.top: parent.top
                        anchors.topMargin: Math.round(
                                               rectUtilityPage.smallVspacing / 5)
                        anchors.left: parent.left
                        anchors.leftMargin: Math.round(
                                                rectUtilityPage.smallHspacing / 5)
                        anchors.right: parent.right
                        anchors.rightMargin: Math.round(
                                                 rectUtilityPage.smallHspacing / 5)
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: Math.round(
                                                  rectUtilityPage.smallVspacing / 5)

                        ListView {
                            id: nodeList
                            anchors.fill: parent
                            snapMode: ListView.SnapOneItem

                            model: resetNodeListModel
                            highlight: Rectangle {
                                color: "lightsteelblue"
                                radius: 5
                            }
                            highlightFollowsCurrentItem: true
                            highlightMoveDuration: 250
                            highlightMoveVelocity: 50
                            focus: true
                            spacing: Math.round(
                                         rectUtilityPage.utilPageFontsize1 / 2.2)
                            clip: true
                            currentIndex: -1
                        }

                        DelegateModel {
                            id: resetNodeListModel

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

                            delegate: Item {
                                id: nodeContainer
                                width: parent.width
                                height: Math.round(
                                            rectUtilityPage.utilPageFontsize1 * 1.15)
                                Column {
                                    Text {
                                        font.pointSize: Math.round(
                                                            rectUtilityPage.utilPageFontsize1
                                                            * 1.25)
                                        font.family: "Helvetica"
                                        leftPadding: Math.round(
                                                         rectUtilityPage.smallVspacing / 2)

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
                }

                Grid {
                    id: gridUtilityScreenLvl1
                    rowSpacing: rectUtilityPage.smallVspacing
                    columnSpacing: rectUtilityPage.largeHspacing
                    rows: 2
                    columns: 2

                    UtilityButton {
                        id: utilBtnTop1
                        width: rectUtilityPage.lrgBtnWidth
                        height: rectUtilityPage.lrgBtnHeight
                        ubID: "btnShowNodeParameters"
                        ubText: "Show Node Parameters"
                    }

                    UtilityButton {
                        id: utilBtnTop2
                        width: rectUtilityPage.lrgBtnWidth
                        height: rectUtilityPage.lrgBtnHeight
                        ubID: "btnRestartNode"
                        ubText: "Restart Node"
                    }

                    UtilityButton {
                        id: utilBtnTop3
                        width: rectUtilityPage.lrgBtnWidth
                        height: rectUtilityPage.lrgBtnHeight
                        ubID: "btnUpdateFW"
                        ubText: "Update Firmware"
                    }

                    UtilityButton {
                        id: utilBtnTop4
                        width: rectUtilityPage.lrgBtnWidth
                        height: rectUtilityPage.lrgBtnHeight
                        ubID: "btnClearHome"
                        ubText: "Clear Home"
                    }
                }
            }

            Rectangle {
                id: rectDeviceDescription
                color: "#B0B0B0"
                //width: Math.round((300 / 320) * rectUtilityPage.width)
                Layout.fillWidth: true
                Layout.preferredHeight: Math.round(
                                            (30 / 240) * rectUtilityPage.height)
                radius: Math.round(
                            (rectUtilityPage.largeHspacing + rectUtilityPage.largeVspacing) / 12)

                Text {
                    id: name
                    font.family: "Helvetica"
                    font.pointSize: Math.round(
                                        rectUtilityPage.utilPageFontsize1 * 1.25)
                    padding: Math.round(rectUtilityPage.smallVspacing / 2)

                    text: qsTr("Device Description")
                }
            }

            Item {
                id: itemScreenBrightness
                visible: false

                Layout.preferredHeight: Math.round(
                                            rowUtilityScreenLvl1.height
                                            + rectDeviceDescription.height
                                            + rectUtilityPage.smallVspacing)
                Layout.preferredWidth: Math.round(
                                           (300 / 320) * rectUtilityPage.width)

                Label {
                    id: labelSBslider
                    width: Math.round(parent.width / 2)
                    height: Math.round((30 / 240) * rectUtilityPage.height)

                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottomMargin: rectUtilityPage.smallVspacing

                    fontSizeMode: Text.HorizontalFit
                    font.pixelSize: Math.round(
                                        rectUtilityPage.utilPageFontsize1 * 1.25)
                    wrapMode: Text.NoWrap
                    horizontalAlignment: Text.AlignLeft
                    text: "Set Display Brightness:"
                }

                Rectangle {
                    id: rectSBslider
                    width: itemScreenBrightness.width
                    height: Math.round(itemScreenBrightness.height - labelSBslider.height
                                - (rectUtilityPage.largeVspacing + rectUtilityPage.smallBtnHeight))
                    radius: Math.round((rectUtilityPage.largeHspacing
                                        + rectUtilityPage.largeVspacing) / 12)
                    color: "#EAEAEA"

                    anchors.top: labelSBslider.bottom
                    Item {
                        height: sbSlider.height
                        width: sbSlider.width
                        anchors.centerIn: parent

                        Slider {
                            id: sbSlider
                            value: 0.5

                            background: Rectangle {
                                x: sbSlider.leftPadding
                                y: sbSlider.topPadding + sbSlider.availableHeight / 2 - height / 2
                                implicitWidth: Math.round(
                                                   rectSBslider.width * 0.95)
                                implicitHeight: Math.round(
                                                    rectSBslider.height / 15)
                                width: sbSlider.availableWidth
                                height: implicitHeight
                                radius: Math.round(height / 2)
                                color: "#bdbebf"

                                Rectangle {
                                    width: sbSlider.visualPosition * parent.width
                                    height: parent.height
                                    color: "#21be2b"
                                    radius: Math.round(height / 2)
                                }
                            }

                            handle: Rectangle {
                                x: sbSlider.leftPadding + sbSlider.visualPosition
                                   * (sbSlider.availableWidth - width)
                                y: sbSlider.topPadding + sbSlider.availableHeight / 2 - height / 2
                                implicitWidth: Math.round(
                                                   rectSBslider.height / 3)
                                implicitHeight: implicitWidth
                                radius: implicitWidth / 2
                                color: sbSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                                border.color: "#bdbebf"
                            }
                        }
                    }
                }

                UtilityButton {
                    id: utilBtnCloseSB
                    width: rectUtilityPage.lrgBtnWidth
                    height: rectUtilityPage.smallBtnHeight

                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: rectUtilityPage.smallVspacing

                    ubID: "btnCloseScreenBrightness"
                    ubText: "Close"
                }
            }

            Item {
                id: itemAudioCtrl
                visible: false

                Layout.preferredHeight: Math.round(
                                            rowUtilityScreenLvl1.height
                                            + rectDeviceDescription.height
                                            + rectUtilityPage.smallVspacing)
                Layout.preferredWidth: Math.round((300 / 320) * rectUtilityPage.width)

                Label {
                    id: labelAudioSlider
                    width: Math.round(parent.width / 2)
                    height: Math.round((30 / 240) * rectUtilityPage.height)

                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottomMargin: rectUtilityPage.smallVspacing

                    fontSizeMode: Text.HorizontalFit
                    font.pixelSize: Math.round(rectUtilityPage.utilPageFontsize1 * 1.25)
                    wrapMode: Text.NoWrap
                    horizontalAlignment: Text.AlignLeft
                    text: "Set Note Volume:"
                }

                Rectangle {
                    id: rectAudioSlider
                    width: itemAudioCtrl.width
                    height: Math.round(
                                itemAudioCtrl.height - labelAudioSlider.height
                                - (rectUtilityPage.largeVspacing + rectUtilityPage.smallBtnHeight))
                    radius: Math.round((rectUtilityPage.largeHspacing + rectUtilityPage.largeVspacing) / 12)
                    color: "#EAEAEA"

                    anchors.top: labelAudioSlider.bottom

                    Item {
                        height: audioSlider.height
                        width: audioSlider.width
                        anchors.centerIn: parent

                        Slider {
                            id: audioSlider
                            value: 0.5

                            background: Rectangle {
                                x: audioSlider.leftPadding
                                y: audioSlider.topPadding
                                   + audioSlider.availableHeight / 2 - height / 2
                                implicitWidth: Math.round(
                                                   rectAudioSlider.width * 0.95)
                                implicitHeight: Math.round(
                                                    rectAudioSlider.height / 15)
                                width: audioSlider.availableWidth
                                height: implicitHeight
                                radius: Math.round(height / 2)
                                color: "#bdbebf"

                                Rectangle {
                                    width: audioSlider.visualPosition * parent.width
                                    height: parent.height
                                    color: "#21be2b"
                                    radius: Math.round(height / 2)
                                }
                            }

                            handle: Rectangle {
                                x: audioSlider.leftPadding + audioSlider.visualPosition
                                   * (audioSlider.availableWidth - width)
                                y: audioSlider.topPadding
                                   + audioSlider.availableHeight / 2 - height / 2
                                implicitWidth: Math.round(
                                                   rectAudioSlider.height / 3)
                                implicitHeight: implicitWidth
                                radius: implicitWidth / 2
                                color: audioSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                                border.color: "#bdbebf"
                            }
                        }
                    }
                }

                Item {
                    id: itemAudioCtrlBtnHolder

                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: rectUtilityPage.smallVspacing

                    UtilityButton {
                        id: utilBtnCloseAudioCtrl
                        width: rectUtilityPage.lrgBtnWidth
                        height: rectUtilityPage.smallBtnHeight
                        ubID: "btnCloseAudioControl"
                        ubText: "Close"

                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                    }

                    UtilityButton {
                        id: utilBtnErrorMute
                        width: rectUtilityPage.lrgBtnWidth
                        height: rectUtilityPage.smallBtnHeight
                        ubID: "btnErrorMute"
                        ubText: "Error Mute"
                        isToggable: true
                        altText: "Audio Muted"

                        anchors.right: utilBtnCloseAudioCtrl.left
                        anchors.bottom: parent.bottom

                        anchors.rightMargin: rectUtilityPage.largeHspacing
                    }

                    UtilityButton {
                        id: utilBtnButtonMute
                        width: rectUtilityPage.lrgBtnWidth
                        height: rectUtilityPage.smallBtnHeight
                        ubID: "btnButtonMute"
                        ubText: "Button Mute"
                        isToggable: true
                        altText: "Audio Muted"

                        anchors.right: utilBtnErrorMute.left
                        anchors.bottom: parent.bottom

                        anchors.rightMargin: rectUtilityPage.largeHspacing
                    }
                }
            }

            Grid {
                id: rowUtilityScreenLvl2

                rows: 2
                rowSpacing: rectUtilityPage.smallVspacing
                columns: 3
                columnSpacing: rectUtilityPage.largeHspacing

                Layout.fillWidth: true

                layoutDirection: Qt.RightToLeft
                horizontalItemAlignment: Grid.AlignRight

                UtilityButton {
                    id: utilBtnCameraPower
                    width: rectUtilityPage.lrgBtnWidth
                    height: rectUtilityPage.lrgBtnHeight
                    ubID: "btnCameraPower"
                    ubText: "Camera Power (Off)"
                    isToggable: true
                    altText: "Camera Power (On)"
                }

                UtilityButton {
                    id: utilBtnServoPower
                    width: rectUtilityPage.lrgBtnWidth
                    height: rectUtilityPage.lrgBtnHeight
                    ubID: "btnServoPower"
                    ubText: "Servo Power (Off)"
                    isToggable: true
                    altText: "Servo Power (On)"
                }

                UtilityButton {
                    id: utilBtnPowerOffCrane
                    width: rectUtilityPage.lrgBtnWidth
                    height: rectUtilityPage.lrgBtnHeight
                    ubID: "btnPowerOffCrane"
                    ubText: "Power-Off Crane"
                }

                UtilityButton {
                    id: utilBtnDispBrightness
                    width: rectUtilityPage.lrgBtnWidth
                    height: rectUtilityPage.lrgBtnHeight
                    ubID: "btnDisplayBrightness"
                    ubText: "Display Brightness"
                }

                UtilityButton {
                    id: utilBtnAudioCtrl
                    width: rectUtilityPage.lrgBtnWidth
                    height: rectUtilityPage.lrgBtnHeight
                    ubID: "btnAudioControl"
                    ubText: "Audio Control"
                }
            }

            Item {

                Layout.preferredWidth: utilBtnDoneWithUP.width
                Layout.preferredHeight: utilBtnDoneWithUP.height
                Layout.alignment: Qt.AlignRight

                UtilityButton {
                    id: utilBtnDoneWithUP
                    width: rectUtilityPage.smallBtnWidth
                    height: rectUtilityPage.smallBtnHeight

                    Layout.alignment: Qt.AlignRight

                    ubID: "btnDoneWithUP"
                    ubText: "Done"
                }
            }
        }
    }
}
