import QtQuick 2.14
import QtQuick.Window 2.2
import QtQml 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtQuick.VirtualKeyboard 2.14
import QtQuick.VirtualKeyboard.Settings 2.14
import QtMultimedia 5.14

import "qrc:///components"
import "qrc:///images"

import "singletons/."

ApplicationWindow {
    id: rootWindow

    property alias mainTabBar: mainTabBar
    property alias mainSwipeView: mainSwipeView
    property alias kbScrollView: kbScrollView

    /*
    property alias cstmBtn2CameraPower: cstmBtn2CameraPower
    property alias cstmBtn2StartupCrane: cstmBtn2StartupCrane
    property alias buttonContainerRect: buttonContainerRect
*/
    //    property alias enableButtonContainerRect: enableButtonContainerRect

    // DEVELOPMENT SETTINGS
    // Use this setting to facilitate tests while keeping the code easier to maintain
    property bool testBuild: false  // if set to 'true', the screen will not maximize and will be centered
    // on the screen, with a gap from the borders as defined next.
    property int testBorderY: 100   // define the vertical gap between the screen and the application's
    // test window.  The horizontal gap will be proportional.

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

    property int screenHeight  // local cache of GlobalProperties screenHeight, to improve performance

    // RUN ONCE BLOCK
    // All start-up tasks should be put here; it will wait for  the screen to finish initializing
    // and all environment variables to be set-up.
    Component.onCompleted: {
        // Set window title
        title = "Louma2 Console"

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
            // The final release should be, per my understanding, full-screen and without borders
            // or window dressings, which I get from 'visible = false' and visibility = Qt.WindowMaximized.
            // During tests: a resizable screen.
            visibility = Qt.WindowMaximized
        } else {
            // The final release should be, per my understanding, full-screen and without borders
            // or window dressings, which I get from setting the FramelessWindowHint and visibility = Qt.WindowFullscreen.
            flags = Qt.FramelessWindowHint
            visibility = Qt.WindowFullScreen
        }

        // SET SCREEN/WINDOW-RELATED PARAMS
        // They need to be reset whenever the window or screen changes
        setScreenParams()

        // SET MATERIAL THEME, COLORS FOR THEME
        Material.theme = Material.Dark
        Material.background = Material.color(Material.Grey, Material.Shade500)
        Material.accent = Material.color(Material.Teal, Material.ShadeA200)
        //Material.foreground = Material.color(Material.BlueGrey, Material.ShadeA200)

        // SET VIRTUAL-KEYBOARD-RELATED GlobalProperties
        GlobalProperties.cursorHeight = 0;
        //GlobalProperties.qwertyKBHeight=inputPanel.height;
        console.log("Keyboard Height (i.e. inputPanel.height) = "+inputPanel.height);
        GlobalProperties.qwertyKBActive = true; // initial [default] value, util I implement all keyboard logic
        // probably will be removed once keyboard logic implemented fully.
    }

    onScreenChanged: {
        console.log("onScreenChanged Triggered");
        console.log("Old screen width, height = " +
                    GlobalProperties.screenWidth + ", " +
                    GlobalProperties.screenHeight)
        setScreenParams()
        console.log("New screen width, height = " +
                    GlobalProperties.screenWidth + ", " +
                    GlobalProperties.screenHeight)
    }

    onHeightChanged: {
        setScreenParams()
    }

    onWidthChanged: {
        setScreenParams()
    }

    function setScreenParams (){
        // SET SCREEN/WINDOW-RELATED PARAMS
        // Now find out the Pixel Density
        GlobalProperties.setScreenDPmm(Screen.pixelDensity);

        // Create parameters to be re-used multiple times.  Everytime I need to know
        // how big my working screen is, I should refer to these two:
        GlobalProperties.setScreenHeight(rootWindow.height-mainTabBar.height)   // in pixels
        screenHeight = GlobalProperties.screenHeight
        GlobalProperties.setScreenWidth(rootWindow.width)                       // in pixels
        GlobalProperties.setRootWindowHeight(rootWindow.height)                 // in pixels
    }

    function leaveSplashScreen() {
        mainSwipeView.incrementCurrentIndex() ;  //set back to 1 after debugging

    }

    function goToSplashScreen() {
        mainTabBar.setCurrentIndex(0);
    }

    function enableTabBar(myBool) {
        mainTabBar.enabled = myBool;
    }

    function enableSwipeView(myBool) {
        mainSwipeView.enabled = myBool;
    }

    function powerOffCrane() {
        GlobalProperties.cranePowered = false;
        if (cstmBtn2StartupCrane.checked) {
            cstmBtn2StartupCrane.toggle();
        }
        goToSplashScreen();
    }

    function powerOnCrane() {
        GlobalProperties.cranePowered = true;
        leaveSplashScreen();
    }

    function enableButtonContainerRect() {
        myTimer.start();
    }

    function disableButtonContainerRect() {
        buttonContainerRect.enabled = false;
        buttonContainerRect.visible = false;
    }
    // The main QML

    Timer {
        id: myTimer

        interval: 700

        onTriggered: {
            buttonContainerRect.enabled = true;
            buttonContainerRect.visible = true;
        }
    }

    Rectangle {
        id: rectVisibleArea

        anchors.fill: parent

        // NOT SURE THIS NEEDS TO BE HERE OR INSIDE THE SCROLLVIEW
        /*
         * Need to remember this setting for whenever I want a 'Popup' version of the keyboard....
         * ...not sure I'll ever use it (will probably use a smaller version of the pop-up)
         * ...unless the 'fullscreen' actually means full-parent (can be limited by the parent)
         * ...in which case, this is perfect for the non-scrolling inputs -> the pop-ups.
        Binding {
            target: VirtualKeyboardSettings
            property: "fullScreenMode"
            value: true
        }
        */

        ScrollView {
            id: kbScrollView

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            //anchors.bottomMargin:  GlobalProperties.cursorHeight // will try to use States instead

            contentWidth: parent.width
            contentHeight: parent.height

            ScrollBar.horizontal.interactive: false
            ScrollBar.horizontal.active: false

            ScrollBar.vertical: ScrollBar {
                parent: kbScrollView
                x: kbScrollView.mirrored ? 0 : kbScrollView.width - width
                y: kbScrollView.topPadding
                height: kbScrollView.availableHeight
                active: kbScrollView.availableHeight < height? true : false
                interactive: false
            }

            /*
             * Need to remember this setting for whenever I want a 'Popup' version of the keyboard....
             * ...not sure I'll ever use it (will probably use a smaller version of the pop-up)
             * ...unless the 'fullscreen' actually means full-parent (can be limited by the parent)
             * ...in which case, this is perfect for the non-scrolling inputs -> the pop-ups.
            Binding {
                target: VirtualKeyboardSettings
                property: "fullScreenMode"
                value: true
            }
            */

            states: [
                State {
                    name: "qwertyKeyboardActiveNotFS"
                    when: (inputPanel.active && GlobalProperties.qwertyKBActive && !VirtualKeyboardSettings.fullScreenMode )

                    PropertyChanges {
                        target: mainSwipeView
                        anchors.bottomMargin: GlobalProperties.inputFieldHeight - (screenHeight - mainTabBar.height - inputPanel.height)
                    }
                },
                State {
                    name: "qwertyKeyboardActiveFS"
                    when: (inputPanel.active && GlobalProperties.qwertyKBActive && VirtualKeyboardSettings.fullScreenMode )

                    PropertyChanges {
                        target: mainSwipeView
                        anchors.bottomMargin: -mainTabBar.height
                    }
                }
            ]

            transitions: Transition {
                from: ""
                to: "qwertyKeyboardActiveNotFS" || "qwertyKeyboardActiveFS"
                reversible: true
                // smoothly reanchor myRect and move into new position
                //AnchorAnimation { duration: 250 }
                ParallelAnimation {
                    NumberAnimation {
                        properties: "y"
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            SwipeView {
                id: mainSwipeView

                property alias currIDX: mainSwipeView.currentIndex

                anchors.right: parent.right
                anchors.left: parent.left
                anchors.bottom: parent.bottom

                height: rectVisibleArea.height

                currentIndex: mainTabBar.currentIndex

                enabled: GlobalProperties.cranePowered

                onCurrentIndexChanged: {
                    console.log("mainSwipeView.currentIndex = " + currentIndex)
                    if (currentIndex == 0) {
                        enableButtonContainerRect();
                    } else {
                        disableButtonContainerRect();
                    }
                }

                Page00SplashScreenForm {
                    id: page00root

                    property alias page00root: page00root

                }

                Page01OperatorForm { // NOTE: change to Page01Operator (remove Form) after adding Page01Operator.qml
                }

                Page02HandwheelDragForm { // NOTE: change to Page02HandwheelDrag (remove Form) after adding Page02HandwheelDrag.qml
                }

                Page03LensForm { // NOTE: change to Page03Lens (remove Form) after adding Page03Lens.qml
                }

                Page04CameraForm { // NOTE: change to Page04Camera (remove Form) after adding Page04Camera.qml
                }

                Page05CopyNodeForm { // NOTE: change to Page05CopyNode (remove Form) after adding Page05CopyNode
                }

                Page06TelescopeForm { // NOTE: change to Page06Telescope (remove Form) after adding Page06Telescope
                }

                Page07Planing {
                }

                Page08ErrorLog {
                    id: page08_ErrorLogRoot

                }

                Page09Utility {
                    id: page09root

                    property alias page09root: page09root

                    // Local Properties:
                    readonly property int nodeListWidth: Math.round((110 / 320) * GlobalProperties.screenWidth)

                    Component.onCompleted: {
                        audioControlDrawer.sliderValue = (audioControlDrawer.sliderMax-audioControlDrawer.sliderMin)/2
                    }

                }

                Page10Menu {
                    id: page10root

                    property alias page10root: page10root

                    // Local Properties:
                    readonly property int nodeListWidth: Math.round((110 / 320) * GlobalProperties.screenWidth)

                }


            }

        }

    }

    footer: TabBar {
        id: mainTabBar
        currentIndex: mainSwipeView.currentIndex

        property real utilTabfontSize1: Math.round(mainTabBar.height / 4 )
        property real utilTabBottomPad: Math.round(mainTabBar.height / 25)
        property real utilTabSidePad: Math.round(mainTabBar.width / 20 )

        onCurrentIndexChanged: console.log("mainTabBar Current Index = " + currentIndex)


        // define the background (a rectangle set to the palette.shadow), and
        // explicitly set the inset (the border for the background) to 0.
        background: Rectangle {
            color: mainTabBar.palette.shadow
        }

        enabled: GlobalProperties.cranePowered

        topInset: 0
        bottomInset: 0

        TabButton {
            id: tab0
            display: AbstractButton.TextBesideIcon
            visible: false

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: GlobalProperties.fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Splash Screen"

            width: 0
        }

        TabButton {
            id: tab1
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: GlobalProperties.fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Operator"

            width: implicitWidth
        }

        TabButton {
            id: tab2
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: GlobalProperties.fontFamUI1
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
            font.family: GlobalProperties.fontFamUI1
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
            font.family: GlobalProperties.fontFamUI1
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
            font.family: GlobalProperties.fontFamUI1
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
            font.family: GlobalProperties.fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Telescope"

            width: implicitWidth
        }

        TabButton {
            id: tab7
            //display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: GlobalProperties.fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Planing"

            width: implicitWidth
        }

        TabButton {
            id: tab8
            display: AbstractButton.TextBesideIcon

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: GlobalProperties.fontFamUI1
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
            font.family: GlobalProperties.fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Utility"

            width: implicitWidth

            icon.source: "qrc:///images/1166B.svg"

            spacing: 1.5

            //onClicked: mainSwipeView.setCurrentIndex(8) // this didn't result in jumping to the 9th View (counting from 0), the SwipeView still
            // scrolled though the intervening views.  will look at disabling the animation, per Mark's comment.

        }

        TabButton {
            id: tab10

            font.pixelSize: Qt.application.font.pixelSize * 1.5
            font.family: GlobalProperties.fontFamUI1
            font.weight: Font.DemiBold
            font.letterSpacing: 0.55

            text: "Menu"

            width: implicitWidth

        }

    }

    Rectangle {
        id: buttonContainerRect

        z: 20

        width: ((GlobalProperties.btnWidth80*2)+GlobalProperties.spacingH_10)
        //height: (GlobalProperties.btnHeight50)
        // using implicitHeight: (based on size of child objects [the buttons])

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: GlobalProperties.spacingV_10 * 4

        CustomButton2 {
            id: cstmBtn2CameraPower

            onClicked: {
                if (cstmBtn2CameraPower.checked) {
                    GlobalProperties.cameraPowered = true;
                } else {
                    GlobalProperties.cameraPowered = false;
                }
            }

            visible: parent.visible
            enabled: parent.enabled

            z: 40

            width: GlobalProperties.btnWidth80
            height: GlobalProperties.btnHeight45

            anchors.left: parent.left
            anchors.bottom: parent.bottom

            //anchors.right: cstmBtn2StartupCrane // generated warning or error
            anchors.rightMargin: GlobalProperties.spacingH_10

            lightingColorChecked: GlobalProperties.btnGreen
            lightingColorUnChecked: GlobalProperties.btnYellow

            checkable: true

            text: (!cstmBtn2CameraPower.checked) ? "Power On Camera" : "Power Off Camera"
        }

        CustomButton2 {
            id: cstmBtn2StartupCrane


            onClicked: {
                if (cstmBtn2StartupCrane.checked) {
                    GlobalProperties.cranePowered = true;
                    leaveSplashScreen();
                } else {
                    GlobalProperties.cranePowered = false;
                }
            }

            visible: parent.visible
            enabled: parent.enabled

            z: 40

            width: GlobalProperties.btnWidth80
            height: GlobalProperties.btnHeight45

            anchors.right: parent.right
            anchors.bottom: parent.bottom

            //anchors.left: cstmBtn2CameraPower // generated warning or error
            anchors.leftMargin: GlobalProperties.spacingH_10

            lightingColorChecked: GlobalProperties.btnGreen
            lightingColorUnChecked: GlobalProperties.btnYellow

            checkable: true

            text:  (!cstmBtn2StartupCrane.checked) ? "Startup Crane" : "Power Off Crane"
        }

    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: rootWindow.height
        width: rootWindow.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: rootWindow.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
