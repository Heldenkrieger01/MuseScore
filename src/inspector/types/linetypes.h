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
#ifndef MU_INSPECTOR_LINETYPES_H
#define MU_INSPECTOR_LINETYPES_H

#include "qobjectdefs.h"

namespace mu::inspector {
class LineTypes
{
    Q_GADGET

public:
    enum class LineStyle {
        LINE_STYLE_NONE = 0,
        LINE_STYLE_SOLID,
        LINE_STYLE_DASHED,
        LINE_STYLE_DOTTED,
        LINE_STYLE_DASH_DOT,
        LINE_STYLE_DASH_DOT_DOT,
        LINE_STYLE_CUSTOM
    };

    Q_ENUM(LineStyle)
};
}

#endif // MU_INSPECTOR_LINETYPES_H
