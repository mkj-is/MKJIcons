//
//  AnimatedIcon+Style.swift
//  Showcase
//
//  Created by Matěj Jirásek on 22/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit
import MKJIcons

extension AnimatedIcon {

    func applyStyle(style: Style) {
        lineWidth = style.lineWidth
        lineCapStyle = style.lineCap
        lineJoinStyle = style.lineJoin
        animationColorMode = style.animationColorMode
        animationTimingFunction = style.animationTimingFunction
        animationDuration = style.animationDuration
        animationRepeat = style.animationRepeat
    }

}
