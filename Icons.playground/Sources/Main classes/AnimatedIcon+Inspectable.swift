//
//  AnimatedIcon+Inspectable.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 19/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

extension AnimatedIcon {

    // MARK: - Additional inspectable properties

    @IBInspectable public var animationColorMode: Int {
        get {
            if colorMode == .HSB {
                return 0
            } else {
                return 1
            }
        }
        set(new) {
            if new < 1 {
                colorMode = .HSB
            } else {
                colorMode = .RGB
            }
        }
    }

    @IBInspectable public var animationTimingFunction: Int {
        get {
            switch timingFunction {
            case kCAMediaTimingFunctionLinear:
                return 1
            case kCAMediaTimingFunctionEaseIn:
                return 2
            case kCAMediaTimingFunctionEaseOut:
                return 3
            case kCAMediaTimingFunctionEaseInEaseOut:
                return 4
            default:
                return 0
            }
        }
        set(new) {
            switch new {
            case 1:
                timingFunction = kCAMediaTimingFunctionLinear
            case 2:
                timingFunction = kCAMediaTimingFunctionEaseIn
            case 3:
                timingFunction = kCAMediaTimingFunctionEaseOut
            case 4:
                timingFunction = kCAMediaTimingFunctionEaseInEaseOut
            default:
                timingFunction = kCAMediaTimingFunctionDefault
            }
        }
    }

    @IBInspectable public var lineCapStyle: Int {
        get {
            lineCap.rawValue
            switch lineCap {
            case .Butt:
                return 0
            case .Square:
                return 1
            default:
                return 2
            }
        }
        set(new) {
            switch new {
            case 0:
                lineCap = .Butt
            case 1:
                lineCap = .Square
            default:
                lineCap = .Round
            }
        }
    }

    @IBInspectable public var lineJoinStyle: Int {
        get {
            switch lineJoin {
            case .Bevel:
                return 0
            case .Miter:
                return 1
            default:
                return 2
            }
        }
        set(new) {
            switch new {
            case 0:
                lineJoin = .Bevel
            case 1:
                lineJoin = .Miter
            default:
                lineJoin = .Round
            }
        }
    }

}
