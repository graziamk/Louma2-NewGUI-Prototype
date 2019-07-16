import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtMultimedia 5.13

import "./pages"
import "./images"

ApplicationWindow {
    id: rootWindow
    visible: true

    // The final release should be, per my understanding, full-screen and without borders
    // or window dressings.  To achieve that, simply set: 'visibility: true'
    // uncomment this line (visibility:) and comment the height/width for the final release
    visibility: "FullScreen"

    // During testing, I'm displaying a resizable window so that I can resize on the fly to check
    // that the code is 'portable' in terms of screen size & ratio.
    //width: Math.round(maximumWidth * 0.9)
    //height: Math.round(maximumHeight * 0.9)
    title: qsTr("Tabs")


    // Now find out the Pixel Density
    property real screenDPmm: Screen.pixelDensity //in pixels per mm

    property string fontFamUI1: "Segoe UI"

    // SET SOUNDS
    // Set Mouse Sounds
    SoundEffect {
        id: mouseClickSound
        source: "qrc:///sounds/AppMouseClick.wav"
    }
    SoundEffect {
        id: mousePressSound
        source: "qrc:///sounds/AppMousePress.wav"
    }
    SoundEffect {
        id: mouseReleaseSound
        source: "qrc:///sounds/AppMouseRelease.wav"
    }
    SoundEffect {
        id: errorSound
        source: "qrc:///sounds/AppError.wav"
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page00SplashScreenForm {
        }

        Page01OperatorForm {
        }

        Page02HandwheelDragForm {
        }

        Page03LensForm {
        }

        Page04CameraForm {
        }

        Page05CopyNodeForm {
        }

        Page06TelescopeForm {
        }

        Page07PlaningForm {
        }

        Page08ErrorLogForm {
        }

        Page09Utility {
        }

        Page10MenuForm {
        }


    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        property real utilTabFontsize1: Math.round(tabBar.height / 4 )
        property real utilTabBottomPad: Math.round(tabBar.height / 25)
        property real utilTabSidePad: Math.round(tabBar.width / 20 )

        TabButton {
            id: tab0
            display: AbstractButton.TextBesideIcon
            visible: false

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Splash Screen"

            width: 0
        }


        TabButton {
            id: tab1
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Operator"
        }

        TabButton {
            id: tab2
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Handwheel"

            icon.source: "qrc:///images/5162.svg"

            spacing: 1.5
        }

        TabButton {
            id: tab3
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Lens"

            icon.source: "qrc:///images/5324.svg"

            spacing: 1.5
        }

        TabButton {
            id: tab4
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Camera"

            icon.source: "qrc:///images/5887.svg"

            spacing: 2
        }

        TabButton {
            id: tab5
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Copy Node"

            icon.source: "qrc:///images/0012.svg"

            spacing: 1.5
        }

        TabButton {
            id: tab6
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55
            text: "Telescope"
        }

        TabButton {
            id: tab7
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55
            text: "Planing"
        }

        TabButton {
            id: tab8
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Error Log"

            icon.source: "qrc:///images/5352.svg"

            spacing: 1.5
        }

        TabButton {
            id: tab9
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Utility"

            icon.source: "qrc:///images/1166B.svg"

            spacing: 1.5

            //onClicked: swipeView.setCurrentIndex(8) // this didn't result in jumping to the 9th View (counting from 0), the SwipeView still
            // scrolled though the intervening views.  will look at disabling the animation, per Mark's comment.
        }

        TabButton {
            id: tab10

            text: "Menu"
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

        }

    }
}
