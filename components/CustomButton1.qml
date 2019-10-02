/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.impl 2.13
import QtQuick.Controls.Material 2.12
import QtQuick.Templates 2.13 as T

import QtGraphicalEffects 1.13



T.Button {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    leftInset: 0
    rightInset: 0
    topInset: 0
    bottomInset: 0

    bottomPadding: Math.round(parent.height / 50)
    topPadding: Math.round(bottomPadding*0.85)
    horizontalPadding: Math.round(page09root.smallVspacing * 0.65 )
    //spacing: 6
    display: AbstractButton.TextOnly

    property real myRadius: (Math.min(width, height)/3.5)

    //Material.theme: Material.Dark
    //Material.background: Material.color(Material.Grey, Material.Shade400)
    //--Material.primary: Material.color(Material.Grey, Material.Shade800)
    //--Material.foreground: Material.color(Material.BlueGrey, Material.Shade400) // This one did not affect at all

    //icon.width: 24
    //icon.height: 24
    //icon.color: control.checked || control.highlighted ? control.palette.brightText :
    //            control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText

/*
    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked || control.highlighted ? control.palette.brightText :
               control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText
    }
*/
    background: Rectangle {
        id: rectBackground

        implicitWidth: 100
        implicitHeight: 40
        visible: !control.flat || control.down || control.checked || control.highlighted
        color: Color.blend(control.checked || control.highlighted ? control.palette.dark : control.palette.button,
                                                                    control.palette.mid, control.down ? 0.5 : 0.0)
        border.color: control.palette.highlight
        border.width: control.visualFocus ? 2 : 0

        radius: myRadius

        // Uncomment this section for custom shadow effects using DropShadow (directly)

        layer.enabled: control.enabled

        layer.effect: DropShadow {
            verticalOffset: 2
            radius: 10
            //samples: control.MyStyle.elevation
            samples: 16
            spread: 0.4
            source: rectBackground
            color: (control.checked) ? "aquamarine" : Qt.rgba(0, 0, 0, 0.5) //Material.dropShadowColor
            //color: control.visualFocus ? "#330066ff" : "#aaaaaa"
            transparentBorder: true
        }


        // Uncomment this section for shadow effects using Glow (directly)
        /*
                layer.effect: Glow {
                    samples: 25
                    spread: 0.5
                    color: "#FFFFFF"
                    transparentBorder: true
                }
        */
    }


    contentItem: Text {
        text: control.text
        //font: control.font
        opacity: enabled ? 1.0 : 0.3
        //color: control.down ? "#17a81a" : "#21be2b"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        elide: Text.ElideRight ///////// Need to check if I should mess with this. What is elide again?

        color: control.checked || control.highlighted ? "aquamarine" :
               control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText

        font.family: rootWindow.fontFamUI2
        font.pixelSize: (height == page09root.lrgBtnHeight) ? page09root.utilPageFontsize1 : page09root.utilPageFontsize1 * 1.15
        fontSizeMode: Text.FixedSize //investigate font sizing
        lineHeight: 0.85
        maximumLineCount: 2
        wrapMode: Text.WordWrap
        bottomPadding: Math.round(parent.height / 25)
//        rightPadding: Math.round(page09root.smallVspacing / 2)
//        leftPadding: Math.round(page09root.smallVspacing / 2)

    }

    onPressed: mousePressSound.play()
}
