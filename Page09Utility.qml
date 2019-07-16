import QtQuick 2.12
import QtQml.Models 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12


Page09UtilityForm {

    property bool sbState
    property bool acState

    function setScreenBrightness(sbState) {
        if (!acState) {

            if (sbState) {
                rowUtilityScreenLvl1.visible = false
                rectDeviceDescription.visible = false
                itemScreenBrightness.visible = true
            } else {
                rowUtilityScreenLvl1.visible = true
                rectDeviceDescription.visible = true
                itemScreenBrightness.visible = false
            }

        } else {
            errorSound.play()
            console.log("Cannot open 'Screen Brightness Panel' while 'Audio Control Panel' is open!")
        }
    }

    utilBtnDispBrightness.onClicked: {
        if (!acState) {
            sbState = true
            setScreenBrightness(sbState)
        } else {
            errorSound.play()
            console.log("Cannot open 'Screen Brightness Panel' while 'Audio Control Panel' is open!")
        }
    }
    utilBtnCloseSB.onClicked: {
        sbState = false
        setScreenBrightness(sbState)
    }

    function setAudioControl(acState) {
        if (!sbState) {
            if (acState) {
                rowUtilityScreenLvl1.visible = false
                rectDeviceDescription.visible = false
                itemAudioCtrl.visible = true
            } else {
                rowUtilityScreenLvl1.visible = true
                rectDeviceDescription.visible = true
                itemAudioCtrl.visible = false
            }
        } else {
            errorSound.play()
            console.log("Cannot open 'Audio Control Panel' while 'Screen Brightness Panel' is open!")
        }
    }

    utilBtnAudioCtrl.onClicked: {
        if (!sbState) {
            acState = true
            setAudioControl(acState)
        } else {
            errorSound.play()
            console.log("Cannot open 'Audio Control Panel' while 'Screen Brightness Panel' is open!")
        }
    }

    utilBtnCloseAudioCtrl.onClicked: {
        acState = false
        setAudioControl(acState)
    }

    utilBtnDoneWithUP.onClicked: {
        swipeView.setCurrentIndex(0) // return to Splash Screen @ (index 0)
    }

}
