import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtQml 2.14
import QtQml.Models 2.14
import QtGraphicalEffects 1.14
import QtQuick.VirtualKeyboard.Settings 2.14
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
        target: GlobalProperties
        property: 'inputFieldHeight'
        value: itemUtilityPage.y + GlobalProperties.spacingV_10 + GlobalProperties.spacingV_5
        when: textInputTopRight.activeFocus
        restoreMode: Binding.RestoreNone
    }

    Binding {
        target: GlobalProperties
        property: 'inputFieldHeight'
        value: itemUtilityPage.y + rectUtilDefault.y + sunkenRectDeviceDescription.y + GlobalProperties.spacingV_5
        when: testTextInput.activeFocus
        restoreMode: Binding.RestoreNone
    }

    Binding {
        target: GlobalProperties
        property: 'inputFieldHeight'
        value: itemUtilityPage.y + rectUtilDefault.y + sunkenRectTextInputField3.y + GlobalProperties.spacingV_5
        when: textInputField3.activeFocus
        restoreMode: Binding.RestoreNone
    }

    // Hack to correct potential errors during transitions between different Virtual Keyboards.
    // This exact section is not needed with current implementation (needed below).
    // Leaving code in for now, will remove if still not needed at a later time (12/28/2019)
    /*
    textInputTopRight.onAccepted: {
        GlobalProperties.inputFieldHeight = 0
    }
    textInputField3.onAccepted: {
        GlobalProperties.inputFieldHeight = 0
    }
    testTextInput.onAccepted: {
        GlobalProperties.inputFieldHeight = 0
    }
*/
    Binding {
        target: VirtualKeyboardSettings
        property: "fullScreenMode"
        value: true
        when: textInputField2.activeFocus || textInputNumeric.activeFocus
        restoreMode: Binding.RestoreBindingOrValue
    }

    // Hack to correct errors during transitions between different Virtual Keyboards (specifically,
    // between two different full-screen Keyboards.  Apparently, Binding's restoreMode is not
    // properly implemented.
    textInputField2.onAccepted: {
        GlobalProperties.inputFieldHeight = 0
    }
    textInputNumeric.onAccepted: {
        GlobalProperties.inputFieldHeight = 0
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
