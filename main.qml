import QtQuick 2.13
import QtQuick.Window 2.2
import QtQml 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13

import QtMultimedia 5.13

import "./components"
import "./images"

ApplicationWindow {
    id: rootWindow
    title: qsTr("Louma2 Console")

    // List here any properties defined in this QML Type will be available to children via the 'rootWindow' id.
    //property alias rootWindow: rootWindow

    // Attached Properties for QtQuick.Window's Screen QML Type; may want to use some of them in the future.
    // desktopAvailableHeight : int
    // desktopAvailableWidth : int
    // devicePixelRatio : real
    // height : int
    // manufacturer : string
    // model : string
    // name : string
    // orientation : Qt::ScreenOrientation
    // orientationUpdateMask : Qt::ScreenOrientations
    // pixelDensity : real
    // primaryOrientation : Qt::ScreenOrientation
    // serialNumber : string
    // virtualX : int
    // virtualY : int
    // width : int
    //
    // Attached Methods
    // int angleBetween(a, Qt::ScreenOrientation b)


    // DEVELOPMENT SETTINGS
    // Use this setting to facilitate tests while keeping the code easier to maintain
    property bool testBuild: true   // if set to 'true', the screen will not maximize and will be centered
                                    // on the screen, with a gap from the borders as defined next.
    property int testBorderY: 100   // define the vertical gap between the screen and the application's
                                    // test window.  The horizontal gap will be proportional.


    // RUN ONCE BLOCK
    // All start-up tasks should be put here; it will wait for  the screen to finish initializing
    // and all environment variables to be set-up.
    Component.onCompleted: {

        // SET WINDOW SIZE
        // During testing, I'm displaying a resizable window so that I can resize on the fly to check
        // how the code adapts to different screen aspect ratios and sizes.    property int testBorder: 100
        if (testBuild) {
            console.log( Screen.height, Screen.width, Screen.desktopAvailableHeight, Screen.desktopAvailableWidth)
        }

        // This should result in a window centered on the screen with proportional borders.
        // We get, instead, a window that is slightly below horizontal, because it doesn't take into account
        // the borders added by Windows (with maximize, minimize, close, etc).
        y = (testBuild) ? testBorderY/2 : 0
        x = (testBuild) ? Math.round(y*(Screen.desktopAvailableWidth/Screen.desktopAvailableHeight)) : 0
        height = Screen.desktopAvailableHeight - y*2
        width = Screen.desktopAvailableWidth - x*2

        if (testBuild) {
            visibility = Qt.WindowMaximized
        } else {
            // The final release should be, per my understanding, full-screen and without borders
            // or window dressings, which I get from 'visible: true'.  During tests: a resizable screen.
            console.log("Setting 'visible' to 'true'.")
            visible = true

            // If we want the release to have boders and ability to Maximize/Minimize, etc., comment the line
            // above 'visible = true', and uncomment the line below setting visibility to Qt.WindowFullScreen
            // visibility = Qt.WindowFullScreen
        }

        // SET MATERIAL THEME, COLORS FOR THEME
        Material.theme = Material.Dark
        Material.background = Material.color(Material.Grey, Material.Shade500)
        Material.accent = Material.color(Material.Teal, Material.ShadeA200)
        //Material.foreground = Material.color(Material.BlueGrey, Material.ShadeA200)

    }

    // Now find out the Pixel Density
    property real screenDPmm: Screen.pixelDensity //in pixels per mm

    // Create parameters to be re-used multiple times.  Everytime I need to know
    // how big my working screen is, I should refer to these two:
    //property int screenHeight: Screen.height // in pixels
    //property int screenWidth: Screen.width // in pixels
    property int screenHeight: rootWindow.height-tabBar.height // in pixels
    property int screenWidth: rootWindow.width // in pixels


    property string fontFamUI1: "Segoe UI"
    property string fontFamUI2: "Helvetica"


    // SET AUDIO
    // Set Volume
    property real playVolume: 0.5   // Ideally, I should be initializing playVolume to the System's current volume
                                    // However, QML has no access to the native resources (unless we use their
                                    // paid-for embedded suite).  Community release requires a C++ implementation
                                    // to tie together QML with system properties such as Volume and Brightness.
                                    // The QML tie-in will be left to a future improvement for now.

    // Set Mouse Sounds
    SoundEffect {
        id: mouseClickSound
        source: "qrc:///sounds/AppMouseClick.wav"
        volume: playVolume
    }
    SoundEffect {
        id: mousePressSound
        source: "qrc:///sounds/AppMousePress.wav"
        volume: playVolume
    }
    SoundEffect {
        id: mouseReleaseSound
        source: "qrc:///sounds/AppMouseRelease.wav"
        volume: playVolume
    }
    SoundEffect {
        id: errorSound
        source: "qrc:///sounds/AppError.wav"
        volume: playVolume*0.75 // this wav is from a different source and uses a higher relative volume
    }


    // The main QML
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

        Page08ErrorLog {
            id: page08_ErrorLogRoot

        }

        Page09Utility {
            id: page09root

            property alias page09_Root: page09root

            readonly property int lrgBtnWidth: Math.round((85 / 320) * screenWidth)
            readonly property int lrgBtnHeight: Math.round((35 / 240) * screenHeight)
            readonly property int smallBtnWidth: Math.round((60 / 320) * screenWidth)
            readonly property int smallBtnHeight: Math.round((24 / 240) * screenHeight)

            readonly property int smallHspacing: Math.round((5 / 320) * screenWidth)
            readonly property int largeHspacing: Math.round((10 / 320) * screenWidth)
            readonly property int smallVspacing: Math.round((5 / 240) * screenHeight)
            readonly property int largeVspacing: Math.round((10 / 240) * screenHeight)

            readonly property int firstRowHeight: Math.round((75 / 240) * screenHeight)
            readonly property int secondRowHeight: Math.round((30 / 240) * screenHeight)
            readonly property int thirdRowHeight: Math.round((75 / 240) * screenHeight)

            readonly property int nodeListWidth: Math.round((110 / 320) * screenWidth)

            readonly property int fontSize: 12
            readonly property int utilPageFontsize1: screenHeight / 20
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


        // define the background (a rectangle set to the palette.shadow), and
        // explicitly set the inset (the border for the background) to 0.
        background: Rectangle {
            color: tabBar.palette.shadow
        }

        topInset: 0
        bottomInset: 0

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

            width: implicitWidth
        }

        TabButton {
            id: tab2
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Handwheel"

            width: implicitWidth

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

            width: implicitWidth

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

            width: implicitWidth

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

            width: implicitWidth

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

            width: implicitWidth
        }

        TabButton {
            id: tab7
            //display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Planing"

            width: implicitWidth
        }

        TabButton {
            id: tab8
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Error Log"

            width: implicitWidth

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

            width: implicitWidth

            icon.source: "qrc:///images/1166B.svg"

            spacing: 1.5

            //onClicked: swipeView.setCurrentIndex(8) // this didn't result in jumping to the 9th View (counting from 0), the SwipeView still
            // scrolled though the intervening views.  will look at disabling the animation, per Mark's comment.

        }

        TabButton {
            id: tab10

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Menu"

            width: implicitWidth

        }

    }
}
