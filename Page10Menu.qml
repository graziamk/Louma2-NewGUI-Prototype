import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.13
import QtQuick.Controls.Material 2.13
import QtQml.Models 2.13

//import GlobalProperties 1.0
//import GlobalSounds 1.0
import "singletons/."




















































































































Page10MenuForm {
    id: page10_Menu

    property alias xyzABC: xyzABC

    Item {
        id: xyzABC

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

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
