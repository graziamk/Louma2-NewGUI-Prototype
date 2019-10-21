pragma Singleton
import QtQuick 2.13

QtObject {

    // DEFINE CRANE AND CAMERA (POWER) PROPERTIES
    property bool cameraPowered
    property bool cranePowered

    onCranePoweredChanged: {
        console.log("cranePowered is: "+cranePowered)
    }
    onCameraPoweredChanged: {
        console.log("cameraPowered is: "+cameraPowered)
    }

    // Set SCREEN & WINDOW PROPERTIES
    property real screenDPmm   // in pixels per mm, as reported by: Screen.pixelDensity
    property int screenHeight // window height - mainTabBar height, in pixels
    property int screenWidth  // window width, in pixel

    function setScreenDPmm(d){
        screenHeight = d
    }

    function setScreenHeight(x){
        screenHeight = x
    }

    function setScreenWidth(y){
        screenWidth = y
    }

    // COLOR PROPERTIES
    readonly property color fieldBgColor: "#F0F0F0"
    readonly property color btnGreen: "aquamarine"
    readonly property color btnYellow: "#fff454"
    readonly property color btnRed: "#ff2800"

    // FONT PROPERTIES
    readonly property string fontFamUI1: "Segoe UI"
    readonly property string fontFamUI2: "Helvetica"

    property real fontCalc1: (screenHeight / 20)
    property real fontCalc2: ((screenHeight / 140) + ( screenWidth*3/70))
    property int fontSize1: (screenWidth > screenHeight) ? fontCalc1 : fontCalc2
    //readonly property int fontSize1: screenHeight / 20

    // Note: I tried an area-based formula, but it doesn't work as well as the simple formula 'screenHeight / 20'.
    // The reason is that the buttons have two rows of text, so the height has much more weight than
    // the width.
    // I basically set the font to "screenHeight / 20", unless the screen is very narrow, in which case
    // we use an alternate formula which gives a smaller font size (avoiding ellipsis)


    // BUTTON AND CONTAINER DIMENSIONS
    readonly property int btnHeight24: Math.round((24 / 240) * screenHeight)
    readonly property int btnHeight25: Math.round((25 / 240) * screenHeight)
    readonly property int btnHeight35: Math.round((35 / 240) * screenHeight)
    readonly property int btnHeight45: Math.round((45 / 240) * screenHeight)
    readonly property int btnWidth60: Math.round((60 / 320) * screenWidth)
    readonly property int btnWidth80: Math.round((80 / 320) * screenWidth)
    readonly property int btnWidth85: Math.round((85 / 320) * screenWidth)

    readonly property int spacingH_5: Math.round((5 / 320) * screenWidth)
    readonly property int spacingH_10: Math.round((10 / 320) * screenWidth)
    readonly property int spacingV_5: Math.round((5 / 240) * screenHeight)
    readonly property int spacingV_10: Math.round((10 / 240) * screenHeight)

    readonly property int rowH_29: Math.round((29 / 240) * screenHeight)
    readonly property int rowH_75: Math.round((75 / 240) * screenHeight)

    readonly property int sunkenDepth: Math.round((Math.min(btnWidth60, btnHeight35)/10))

    readonly property real myOffset: spacingV_5/5   // this is a correction for the glow/shader effect, which
                                                    // invades the space around the button.  I found that
                                                    // to preserve the original visual separation, we need to
                                                    // retreat the button's borders a bit, and this will be
                                                    // offset/corrected by invasion resultant from the glow/shader
                                                    // effect.

    // AUDIO PROPERTIES
    // However, QML has no access to the native resources (unless we use their
    // paid-for embedded suite).  Community release requires a C++ implementation
    // to tie together QML with system properties such as Volume and Brightness.
    // The QML tie-in will be left to a future improvement for now.

    // for now, without resorting to C++ to access system volume, just set slider to the middle.
    property real audioVolume: 0.5;   // this is a relative value, will be evaluated to 0.5 * (sliderMax-sliderMin)
    readonly property int maxGain: 60 // in dB; set this according to the HW audio capabilities. 60,70 & 90 are typical. [Not sure this is required...]


    property bool audioMute: false; // This Boolean should be checked before generating button sounds
    property bool errorMute: false; // This Boolean should be checked before generating error sounds.


}
