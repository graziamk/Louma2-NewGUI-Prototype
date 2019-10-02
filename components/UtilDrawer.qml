import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.13

Drawer {
    id: utilDrawer

    visible: false

    // default height
    height: page09root.largeVspacing + page09root.firstRowHeight
            + page09root.smallVspacing + page09root.secondRowHeight

    // default width
    width: parent.width

    edge: Qt.TopEdge
    dragMargin: 0   // This means the drawer can't be opened via swipe, only via button press
    // This is probably best, since there are two drawers opening vertically:
    // Screen Brightness (this) and Audio Control

    focus: true
    modal: true

    //onAboutToShow: (page09_Utility.state == "")? page09_Utility.state = "drawerResized" : console.log("drawer already resized");

    property alias sliderLabel: sliderLabel
    property alias middleButton: middleCstmBtn1
    property alias leftButton: leftCstmBtn1

    // optional: define the min and max values of the slider, which are provided in parallel
    // to the position of the slider (which always varies from 0 to 1)
    property alias  sliderMin: utilSlider.from
    property alias sliderMax: utilSlider.to

    //property int minVal
    //property int maxVal

    function setSliderRange(minVal, maxVal) {
        sliderMin = minVal
        sliderMax = maxVal
    }

    // make the principal outputs of the slider available:
    property alias sliderPosition: utilSlider.position
    property alias sliderValue: utilSlider.value

    //property string buttonText
    //property string buttonAltText

    function setMiddleButton(buttonText, buttonAltText) {
        if (buttonAltText) {
            middleButton.checkable = true
            middleButton.text = (!middleButton.checked) ? buttonText : buttonAltText
        } else {
            middleButton.text = buttonText
        }
    }

    function setLeftButton(buttonText, buttonAltText) {
        if (buttonAltText) {
            leftButton.checkable = true
            leftButton.text = (!leftButton.checked) ? buttonText : buttonAltText
        } else {
            leftButton.text = buttonText
        }
    }

    Label {
        id: sliderLabel
        width: parent.width
        height: page09root.smallBtnHeight

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: page09root.largeHspacing

        fontSizeMode: Text.FixedHeight
        elide: Text.ElideRight
        font.pixelSize: Math.round(page09root.utilPageFontsize1 * 1.20)
        wrapMode: Text.NoWrap
        horizontalAlignment: Text.AlignLeft
        text: "Undefined:"
    }

    Rectangle {
        id: sliderBaseRect
        //color: "#EAEAEA"

        width: utilDrawer.width - (page09root.smallHspacing * 2)
        height: parent.height / 2.5
        radius: Math.round((page09root.largeHspacing + page09root.largeVspacing) / 12)

        anchors.top: sliderLabel.bottom
        anchors.left: sliderLabel.left
        anchors.leftMargin: (page09root.smallVspacing-page09root.largeHspacing)

        Item {
            height: utilSlider.height
            width: utilSlider.width
            anchors.centerIn: parent

            Slider {
                id: utilSlider
                value: 0.5

                background: Rectangle {
                    x: utilSlider.leftPadding
                    y: utilSlider.topPadding + utilSlider.availableHeight / 2 - height / 2
                    implicitWidth: Math.round(sliderBaseRect.width * 0.95)
                    implicitHeight: Math.round(sliderBaseRect.height / 12)
                    width: utilSlider.availableWidth
                    height: implicitHeight
                    radius: Math.round(height / 2)
                    color: "#bdbebf"

                    Rectangle {
                        width: utilSlider.visualPosition * parent.width
                        height: parent.height
                        color: "#21be2b"
                        radius: Math.round(height / 2)
                    }
                }

                handle: Rectangle {
                    x: utilSlider.leftPadding + utilSlider.visualPosition
                       * (utilSlider.availableWidth - width)
                    y: utilSlider.topPadding + utilSlider.availableHeight / 2 - height / 2
                    implicitWidth: Math.round(sliderBaseRect.height / 1.8)
                    implicitHeight: implicitWidth
                    radius: implicitWidth / 2
                    color: utilSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                    border.color: "#bdbebf"
                }
            }
        }
    }

    CustomButton1 {
        id: closeDrawerCstmBtn1
        width: page09root.lrgBtnWidth
        height: page09root.smallBtnHeight

        anchors.right: parent.right
        anchors.bottom: parent.bottom

        anchors.rightMargin: page09root.largeHspacing
        anchors.bottomMargin: page09root.largeVspacing

        text: "Close"

        onClicked: utilDrawer.close()
    }

    CustomButton1 {
        id: middleCstmBtn1
        width: page09root.lrgBtnWidth
        height: page09root.smallBtnHeight
        visible: false

        anchors.right: closeDrawerCstmBtn1.left
        anchors.bottom: parent.bottom

        anchors.rightMargin: page09root.largeHspacing
        anchors.bottomMargin: page09root.largeVspacing

        text: "undefined"
    }

    CustomButton1 {
        id: leftCstmBtn1
        width: page09root.lrgBtnWidth
        height: page09root.smallBtnHeight
        visible: false

        anchors.right: middleCstmBtn1.left
        anchors.bottom: parent.bottom

        anchors.rightMargin: page09root.largeHspacing
        anchors.bottomMargin: page09root.largeVspacing

        text: "undefined"
    }

    // remove this rectangle for production;
    // it's just here to show Mark what a button with 0 offset would look like
    Rectangle {
        id: transparentBorderRect
        width: page09root.lrgBtnWidth
        height: page09root.smallBtnHeight
        color: "lightgray"

        visible: (!middleCstmBtn1.visible) ? true : false

        anchors.bottom: parent.bottom
        anchors.right:  closeDrawerCstmBtn1.left

        anchors.rightMargin: page09root.largeHspacing
        anchors.bottomMargin: page09root.largeVspacing

        radius: 10

        layer.enabled: true

        layer.effect: DropShadow {
            radius: 10
            samples: 16
            spread: 0.4
            source: transparentBorderRect
            color: Qt.rgba(0, 0, 0, 0.5)
            transparentBorder: true
        }
    }
}
