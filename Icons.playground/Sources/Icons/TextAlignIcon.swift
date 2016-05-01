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

        // Bezier Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, x, 34.5)

        let bezierPath = UIBezierPath(style: self)
        bezierPath.moveToPoint(CGPoint(x: 0, y: 0))
        bezierPath.addLineToPoint(CGPoint(x: width, y: 0))
        bezierPath.stroke()

        CGContextRestoreGState(context)


        // Bezier 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, shortX, 39.5)

        let bezier2Path = UIBezierPath(style: self)
        bezier2Path.moveToPoint(CGPoint(x: 0, y: 0))
        bezier2Path.addLineToPoint(CGPoint(x: shortWidth, y: 0))
        bezier2Path.stroke()

        CGContextRestoreGState(context)


        // Bezier 3 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, x, 44.5)

        let bezier3Path = UIBezierPath(style: self)
        bezier3Path.moveToPoint(CGPoint(x: 0, y: 0))
        bezier3Path.addLineToPoint(CGPoint(x: width, y: -0))
        bezier3Path.stroke()

        CGContextRestoreGState(context)


        // Bezier 4 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, shortX, 49.5)

        let bezier4Path = UIBezierPath(style: self)
        bezier4Path.moveToPoint(CGPoint(x: 0, y: 0))
        bezier4Path.addLineToPoint(CGPoint(x: shortWidth, y: 0))
        bezier4Path.stroke()

        CGContextRestoreGState(context)


        // Bezier 5 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, x, 54.5)

        let bezier5Path = UIBezierPath(style: self)
        bezier5Path.moveToPoint(CGPoint(x: 0, y: 0))
        bezier5Path.addLineToPoint(CGPoint(x: width, y: -0))
        bezier5Path.stroke()

        CGContextRestoreGState(context)


        // Bezier 6 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, shortX, 59.5)

        let bezier6Path = UIBezierPath(style: self)
        bezier6Path.moveToPoint(CGPoint(x: 0, y: 0))
        bezier6Path.addLineToPoint(CGPoint(x: shortWidth, y: 0))
        bezier6Path.stroke()

        CGContextRestoreGState(context)


        // Bezier 7 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, x, 64.5)

        let bezier7Path = UIBezierPath(style: self)
        bezier7Path.moveToPoint(CGPoint(x: 0, y: 0))
        bezier7Path.addLineToPoint(CGPoint(x: width, y: -0))
        bezier7Path.stroke()

        CGContextRestoreGState(context)

    }

}
