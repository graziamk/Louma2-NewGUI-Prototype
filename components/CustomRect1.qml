import QtQuick 2.13
import QtGraphicalEffects 1.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.impl 2.13


Rectangle {
    id: sunkenRectangle
    height: 100
    width: 160

    property int offset: Math.round(Math.min(page09root.lrgBtnWidth,page09root.lrgBtnHeight)/20)
    property real myRadius

    Component.onCompleted: {
        myRadius = radius;
        radius = myRadius / 2
    }

    Material.theme: Material.Dark
    Material.background: Material.color(Material.Grey, Material.Shade400)
    //Material.primary: Material.color(Material.Grey, Material.Shade800)
    Material.foreground: Material.color(Material.BlueGrey, Material.ShadeA200)

    Rectangle { // draws the outter shadow/highlight
        id: sourceOutter;
        radius: myRadius
        antialiasing: true;
        gradient: Gradient {
            GradientStop { position: 0.0; color: Material.color(Material.Grey,Material.Shade800); }
            GradientStop { position: 0.7; color: "transparent"; }
            GradientStop { position: 1.0; color: "#F8F8F8" }  //Material.color(Material.Grey,Material.Shade50); }
        }
        anchors {
            fill: parent;
            margins: -offset;
        }
    }


    Rectangle { // mask for outer 3D effect
        id: maskOutter;
        color: "transparent";
        radius: myRadius;
        antialiasing: true;
        border {
            width: offset;
            color: "black";
        }
        anchors.fill: sourceOutter;
    }

    OpacityMask { // outter effect
        opacity: 0.65;
        source: ShaderEffectSource {
            sourceItem: sourceOutter;
            hideSource: true;
        }
        maskSource: ShaderEffectSource {
            sourceItem: maskOutter;
            hideSource: true;
        }
        anchors.fill: sourceOutter;
    }

}
