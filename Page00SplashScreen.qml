import QtQuick 2.13
import QtQuick.Controls 2.13

import "qrc:///components"

import "./singletons/."

Page00SplashScreenForm {
    id: page00_SplashScreenForm

    // None of these are getting triggered.  Need to research and find where/how to trigger them.
    /*
    Component.onCompleted: {
        console.log("Just triggered Component.onCompleted for Page00SplashScreenForm")
        enableButtonContainerRect();
    }

    SwipeView.isCurrentItem: {
        console.log("Just triggered Component.isCurrentItem for Page00SplashScreenForm")
        enableButtonContainerRect();
    }

    SwipeView.onEnabledChanged: {
        console.log("Just triggered Component.onEnabledChanged for Page00SplashScreenForm")
        if (!SwipeView.enabled) {
            enableButtonContainerRect();
        }
    }
    */

}
