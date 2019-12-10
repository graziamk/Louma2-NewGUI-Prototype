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
    id: page10_MenuForm
    /*
    property alias testTextInput1: testTextInput1
    property alias testTextInput2: testTextInput2
    property alias testTextInput3: testTextInput3
*/
    property alias rectComboBoxContainer: rectComboBoxContainer
    property alias nodeListTumbler: nodeListTumbler

    Item {
        id: itemMenuFormPage
        anchors.fill: parent
        z: -1

        anchors.rightMargin: GlobalProperties.spacingH_10
        anchors.leftMargin: GlobalProperties.spacingH_10
        anchors.topMargin: GlobalProperties.spacingV_10
        anchors.bottomMargin: GlobalProperties.spacingV_10

        SunkenRectangle {
            id: rectComboBoxContainer

            height: GlobalProperties.rowH_75
            width: page10root.nodeListWidth
            radius: (Math.min(GlobalProperties.btnWidth85, GlobalProperties.btnHeight35)/7)

            anchors.top: parent.top
            anchors.left: parent.left

            color: GlobalProperties.fieldBgColor

            anchors.margins: GlobalProperties.myOffset
            anchors.rightMargin: GlobalProperties.spacingH_10 + GlobalProperties.myOffset

            Tumbler {
                id: nodeListTumbler

                anchors.fill: parent
                anchors.margins: GlobalProperties.sunkenDepth-GlobalProperties.myOffset

                background: shaderItemTumbler

                contentItem: ListView {
                    model: nodeModelTumbler
                    //delegate: nameDelegate
                    snapMode: ListView.SnapToItem
                    highlightRangeMode: ListView.StrictlyEnforceRange
                    preferredHighlightBegin: height / 2 - (height / nodeListTumbler.visibleItemCount / 2)
                    preferredHighlightEnd: height / 2 + (height / nodeListTumbler.visibleItemCount / 2)
                    clip: true
                }

                Rectangle {
                    id: rectSelectionColoring
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: Math.round(parent.height * 0.4)
                    //anchors.top: upperLineMarker.top
                    //anchors.bottom: lowerLineMarker.bottom
                    width: parent.width // Math.round(parent.width * 0.6)
                    height: Math.round(parent.height * 0.2) // Math.round(parent.width * 0.1) //Math.round(parent.height / 75)
                    color: "#a0f0f0" //"darkgray" //"#21be2b"
                    opacity: 0.2
                }
            }
        }

    }
    /*
    background: Rectangle {
    color: "#999977"
    }
*/
}
