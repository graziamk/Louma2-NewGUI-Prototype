pragma Singleton
import QtQuick 2.13
import QtMultimedia 5.13

//import GlobalProperties 1.0
import "qrc:///singletons/."

Item {

    property alias mouseClickSound: mouseClickSound
    property alias mousePressSound: mousePressSound
    property alias mouseReleaseSound: mouseReleaseSound
    property alias volumeChangeSound: volumeChangeSound
    property alias errorSound: errorSound

    // SET AUDIO
    // Set Mouse Sounds
    SoundEffect {
        id: mouseClickSound
        source: "qrc:///sounds/UI_ButtonClick.wav"
        volume: GlobalProperties.audioVolume
    }

    SoundEffect {
        id: mousePressSound
        source: "qrc:///sounds/UI_ButtonPress.wav"
        volume: GlobalProperties.audioVolume
    }

    SoundEffect {
        id: mouseReleaseSound
        source: "qrc:///sounds/UI_ButtonRelease.wav"
        volume: GlobalProperties.audioVolume
    }

    SoundEffect {
        id: volumeChangeSound
        source: "qrc:///sounds/AppChangeVolumeBeep.wav"
        volume: GlobalProperties.audioVolume/4 // this wav is from a different source and uses a higher relative volume

    }

    SoundEffect {
        id: errorSound
        source: "qrc:///sounds/AppError.wav"
        volume: GlobalProperties.audioVolume*0.75 // this wav is from a different source and uses a higher relative volume
    }

    //onAudioVolumeChanged: console.log("onAudioVolumeChanged: new audioVolume = " + audioVolume)
    // used on 2019/10/10 for debugging.
    //GlobalProperties.onAudioMuteChanged: console.log("GlobalPropertiesonAudioMuteChanged: audioMute = " + GlobalProperties.audioMute)
    //GlobalProperties.onErrorMuteChanged: console.log("GlobalProperties.onErrorMuteChanged: errorMute = " + GlobalProperties.errorMute)
    //GlobalProperties.onAudioVolumeChanged: console.log("GlobalProperties.onAudioVolumeChanged: new audioVolume = " + GlobalProperties.audioVolume)


}
