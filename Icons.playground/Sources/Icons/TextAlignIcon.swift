//
//  TextAlignIcon.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 28/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

@IBDesignable
public class TextAlignIcon: AnimatedIcon {

    // MARK: - Inspectable properties

    @IBInspectable public var strokeColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var width: CGFloat = 40 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var shortWidth: CGFloat = 32 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var offset: CGFloat = 5 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var lines: UInt = 7 {
        didSet {
            if lines < 2 {
                lines = 2
            }
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var textAlignment: NSTextAlignment {
        get {
            switch value {
            case 1:
                return .Right
            case 0.5:
                return .Center
            default:
                return .Left
            }
        }
        set (newValue) {
            switch newValue {
            case .Right:
                value = 1
            case .Left:
                value = 0
            default:
                value = 0.5
            }
        }
    }

    // MARK: - Drawing methods

    override func draw(time: CGFloat = 0) {

        // General Declarations
        let context = UIGraphicsGetCurrentContext()

        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        CGContextScaleCTM(context, scale, scale)

        strokeColor.setStroke()

        // Variable Declarations
        let x: CGFloat = 50 - width / 2.0
        let timeOffset: CGFloat = time * (width - shortWidth)
        let shortX: CGFloat = x + timeOffset

        for i in 0...lines - 1 {

            let short = i % 2 == 1

            CGContextSaveGState(context)
            CGContextTranslateCTM(context, short ? shortX : x, 34.5 + CGFloat(i) * 30 / CGFloat(lines - 1))

            let bezierPath = UIBezierPath(style: self)
            bezierPath.moveToPoint(CGPoint(x: 0, y: 0))
            bezierPath.addLineToPoint(CGPoint(x: short ? shortWidth : width, y: 0))
            bezierPath.stroke()

            CGContextRestoreGState(context)
        }

    }

}
