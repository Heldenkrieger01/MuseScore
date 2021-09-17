/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-CLA-applies
 *
 * MuseScore
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore BVBA and others
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.15
import QtQuick.Controls 2.15

import MuseScore.Ui 1.0
import MuseScore.UiComponents 1.0
import MuseScore.Inspector 1.0

import "../../common"
import "internal"

Column {
    id: root

    property QtObject model: null

    objectName: "PedalSettings"

    spacing: 12

    InspectorPropertyView {

        titleText: qsTrc("inspector", "Line type")
        propertyItem: root.model ? root.model.endHookType : null

        RadioButtonGroup {
            id: lineTypeButtonList

            height: 30
            width: parent.width

            model: [
                { iconRole: IconCode.LINE_NORMAL, typeRole: PedalTypes.HOOK_TYPE_NONE },
                { iconRole: IconCode.LINE_WITH_END_HOOK, typeRole: PedalTypes.HOOK_TYPE_RIGHT_ANGLE },
                { iconRole: IconCode.LINE_WITH_ANGLED_END_HOOK, typeRole: PedalTypes.HOOK_TYPE_ACUTE_ANGLE },
                { iconRole: IconCode.LINE_PEDAL_STAR_ENDING, typeRole: PedalTypes.HOOK_TYPE_STAR }
            ]

            delegate: FlatRadioButton {
                ButtonGroup.group: lineTypeButtonList.radioButtonGroup

                iconCode: modelData["iconRole"]
                checked: root.model && !root.model.endHookType.isUndefined ? root.model.endHookType.value === modelData["typeRole"]
                                                                           : false
                onToggled: {
                    root.model.endHookType.value = modelData["typeRole"]
                }
            }
        }
    }

    Item {
        height: childrenRect.height
        width: parent.width

        InspectorPropertyView {
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 2

            titleText: qsTrc("inspector", "Thickness")
            propertyItem: root.model ? root.model.thickness : null

            IncrementalPropertyControl {
                id: thicknessControl

                isIndeterminate: root.model ? root.model.thickness.isUndefined : false
                currentValue: root.model ? root.model.thickness.value : 0

                onValueEdited: { root.model.thickness.value = newValue }
            }
        }

        InspectorPropertyView {
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 2
            anchors.right: parent.right

            titleText: qsTrc("inspector", "Hook height")
            propertyItem: root.model ? root.model.hookHeight : null

            IncrementalPropertyControl {
                id: hookHeightControl

                enabled: root.model ? root.model.hookHeight.isEnabled : false
                isIndeterminate: root.model && enabled ? root.model.hookHeight.isUndefined : false
                currentValue: root.model ? root.model.hookHeight.value : 0

                onValueEdited: { root.model.hookHeight.value = newValue }
            }
        }
    }

    CheckBox {
        id: showBothSideHookCheckbox

        /*isIndeterminate: model ? model.isDefaultTempoForced.isUndefined : false
            checked: model && !isIndeterminate ? model.isDefaultTempoForced.value : false*/
        text: qsTrc("inspector", "Show hook on both ends")

        //onClicked: { model.isDefaultTempoForced.value = !checked }
    }

    SeparatorLine { anchors.margins: -10 }

    LineStyleSection {
        lineStyle: root.model ? root.model.lineStyle : null
        dashLineLength: root.model ? root.model.dashLineLength : null
        dashGapLength: root.model ? root.model.dashGapLength : null
    }

    PlacementSection {
        propertyItem: root.model ? root.model.placement : null
    }
}
