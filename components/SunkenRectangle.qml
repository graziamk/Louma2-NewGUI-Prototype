import QtQuick 2.13
import QtGraphicalEffects 1.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.impl 2.13

import "../singletons/."

Rectangle {
    id: outerRectangle

    z:100

    anchors.margins: GlobalProperties.sunkenDepth

    Rectangle {
        id: sunkenRectangle

        //property real myRadius: parent.radius/1.05
/*
        Component.onCompleted: {
            myRadius=parent.radius/1.05
        }

        onHeightChanged: {
            myRadius=parent.radius/1.05
        }

        onWidthChanged: {
            myRadius=parent.radius/1.05
        }

        onWindowChanged: {
            myRadius=parent.radius/1.05
        }
*/
        anchors.fill: parent
        anchors.margins: GlobalProperties.sunkenDepth

        radius: parent.radius/(1.5*1.05)

        Material.theme: Material.Dark
        Material.background: Material.color(Material.Grey, Material.Shade400)
        //Material.primary: Material.color(Material.Grey, Material.Shade800)
        Material.foreground: Material.color(Material.BlueGrey, Material.ShadeA200)

        Rectangle { // draws the outer shadow/highlight
            id: sourceOuter;
            radius: parent.radius*1.5
            antialiasing: true;
            gradient: Gradient {
                GradientStop { position: 0.0; color: Material.color(Material.Grey,Material.Shade800); }
                GradientStop { position: 0.7; color: "transparent"; }
                GradientStop { position: 1.0; color: "#F8F8F8" }  //Material.color(Material.Grey,Material.Shade50); }
            }
            anchors {
                fill: parent;
                margins: -GlobalProperties.sunkenDepth;
            }
        }


        Rectangle { // mask for outer 3D effect
            id: maskOuter;
            color: "transparent";
            radius: parent.radius*1.5;
            antialiasing: true;
            border {
                width: GlobalProperties.sunkenDepth;
                color: "black";
            }
            anchors.fill: sourceOuter;
        }

        OpacityMask { // outer effect
            opacity: 0.65;
            source: ShaderEffectSource {
                sourceItem: sourceOuter;
                hideSource: true;
            }
            maskSource: ShaderEffectSource {
                sourceItem: maskOuter;
                hideSource: true;
            }
            anchors.fill: sourceOuter;
        }

    }

}

