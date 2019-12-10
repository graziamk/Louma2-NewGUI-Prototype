import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.13
import QtQuick.Controls.Material 2.13
import QtQml.Models 2.13

//import QtQuick.VirtualKeyboard 2.13
//import "content"
//import "components"

Page10MenuForm {
    id: page10_Menu

    property alias nodeModelTumbler: nodeModelTumbler
    property alias shaderItemTumbler: shaderItemTumbler

    nodeListTumbler.onCurrentIndexChanged: {
        if ( GlobalProperties.audioMute ) {
            console.log("Tumbler selection sound muted");
        } else {
            GlobalSounds.tumblerSelectSound.play() ;
            console.log("GlobalSounds.tumblerSelectSound.play() invoked.");
        }
    }

    DelegateModel {
        id: nodeModelTumbler

        model: ListModel {
            ListElement { nodeName: "Console" }
            ListElement { nodeName: "System" }
            ListElement { nodeName: "Pan" }
            ListElement { nodeName: "Tilt" }
            ListElement { nodeName: "Roll" }
            ListElement { nodeName: "Leveling" }
            ListElement { nodeName: "Telescope" }
            ListElement { nodeName: "Altitude" }
            ListElement { nodeName: "Azimuth" }
            ListElement { nodeName: "Dolly" }
            ListElement { nodeName: "QTerm" }
        }

        delegate: Component  {
            Text {
                text: nodeName
                font.pixelSize: Math.round(GlobalProperties.fontSize1 * 1.35)
                font.family: GlobalProperties.fontFamUI2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0 - Math.abs(Tumbler.displacement) / (nodeListTumbler.visibleItemCount / 2)
            }
        }
    }

    Item {
        id: shaderItemTumbler

        Rectangle {
            anchors.fill: parent
            anchors.margins: parent.height/100  // this is a hack.  'anchors.fill: parent' should provide
            // a perfect fit. I need to look into this when I have some
            // time. Also, consider adding a gap and darkness between the
            // SunkenRectangle inner border and the tumbler's outer border.
            radius: rectComboBoxContainer.radius/1.75
            antialiasing: true;


            gradient: Gradient {
                GradientStop { position: 0.0; color: Material.color(Material.Grey,Material.Shade600); }
                GradientStop { position: 0.5; color: "transparent"; }
                GradientStop { position: 1.0; color: Material.color(Material.Grey,Material.Shade600); }
            }
        }
    }
}
