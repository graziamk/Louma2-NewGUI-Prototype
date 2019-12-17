import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtQml 2.14
import QtQml.Models 2.14
import QtGraphicalEffects 1.14

import "singletons/."

Page10MenuForm {
    id: page10_Menu

    property string selectedNode
    property int totalHeight

    Item {
        id: shaderItem

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
/*
    testTextInput.onCursorVisibleChanged: {
        console.log("Entered testTextInput.onFocusChanged!!\n\n");
        if (testTextInput.cursorVisible) {
            GlobalProperties.inputFieldHeight = (totalHeight-testTextInput.mapToGlobal(0,testTextInput.height).y);
            console.log("GlobalProperties.inputFieldHeight = "+GlobalProperties.inputFieldHeight);
        }
    }
*/

    Binding {
        target: GlobalProperties ; property: 'inputFieldHeight'
        value: sunkenRectDeviceDescription.y + itemUtilityPage.y + GlobalProperties.spacingV_5
        when: testTextInput.activeFocus
        restoreMode: Binding.RestoreNone
    }

    Binding {
        target: GlobalProperties ; property: 'inputFieldHeight'
        value: sunkenRectTextInputField2.y + itemUtilityPage.y + GlobalProperties.spacingV_5
        when: textInputField2.activeFocus
        restoreMode: Binding.RestoreNone
    }

    Binding {
        target: GlobalProperties ; property: 'inputFieldHeight'
        value: sunkenRectTextInputField3.y + itemUtilityPage.y + GlobalProperties.spacingV_5
        when: textInputField3.activeFocus
        restoreMode: Binding.RestoreNone
    }


    /*
    Component.onCompleted: {
        console.log("Page10 Component loaded (Completed).");
        //GlobalProperties.cursorHeight = 40;
        totalHeight = GlobalProperties.rootWindowHeight;
    }
*/
    nodeTumbler.onCurrentItemChanged: {
            selectedNode = nodeTumbler.currentItem.toString();
        console.log("nodeTumbler.onCurrentItemChanged: new nodeTumbler.currentItem: "+selectedNode)
    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
