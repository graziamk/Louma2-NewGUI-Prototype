import QtQuick 2.13
import QtQuick.Controls 2.13
//import QtQuick.VirtualKeyboard 2.13
//import "content"
//import "components"

Page10MenuForm {
    id: page10_Menu


   testTextInput1.onActiveFocusChanged: {
        if (activeFocus)
            keyboardRect.visible = activeFocus
    }

   testTextInput2.onActiveFocusChanged: {
        if (activeFocus)
            keyboardRect.visible = activeFocus
    }

   testTextInput3.onActiveFocusChanged: {
        if (activeFocus)
            keyboardRect.visible = activeFocus
    }

}
