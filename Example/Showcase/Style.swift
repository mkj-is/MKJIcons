//
//  Style.swift
//  Showcase
//
//  Created by Matěj Jirásek on 19/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

struct Style {
    var lineCap = 2
    var lineJoin = 2
    var lineWidth: CGFloat = 2
    var animationDuration: Double = 0.4
    var animationColorMode = 0
    var animationTimingFunction = 4
    var animationRepeat = false
}

protocol StyleUpdateDelegate: AnyObject {
    func styleUpdated(_ style: Style)
}
