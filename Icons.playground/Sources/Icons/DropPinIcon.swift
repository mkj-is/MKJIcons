//
//  HeartIcon.swift
//
//
//  Created by Matěj Jirásek on 3/04/16.
//
//

import UIKit

@IBDesignable
public class DropPinIcon: AnimatedIcon {

    // MARK: - Inspectable properties

    @IBInspectable public var strokeColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var fillColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var circle: Bool = true {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var visible: Bool {
        get {
            return Bool(value)
        }
        set (newValue) {
            value = CGFloat(newValue)
        }
    }

    // MARK: - Drawing methods

    override func draw(time: CGFloat = 0) {

        if time == 0 {
            return
        }

        // General Declarations
        let context = UIGraphicsGetCurrentContext()


        strokeColor.setStroke()
        fillColor.colorWithAlphaComponent(time * fillAlpha).setFill()

        // Variable Declarations
        let circleLineLength: CGFloat = 20 * CGFloat(M_PI) * time
        let pinLineLength: CGFloat = time * 154

        CGContextScaleCTM(context, scale, scale)
        CGContextTranslateCTM(context, 50, 40)

        // Fill Drawing
        let fillPath = UIBezierPath(style: self)

        if circle {
            fillPath.moveToPoint(CGPoint(x: 0, y: -10))
            fillPath.addCurveToPoint(CGPoint(x: -10, y: 0), controlPoint1: CGPoint(x: -5, y: -10), controlPoint2: CGPoint(x: -10, y: -5))
            fillPath.addCurveToPoint(CGPoint(x: -10, y: 0), controlPoint1: CGPoint(x: -10, y: 0), controlPoint2: CGPoint(x: -10, y: 0))
            fillPath.addCurveToPoint(CGPoint(x: 0, y: 10), controlPoint1: CGPoint(x: -10, y: 5), controlPoint2: CGPoint(x: -5, y: 10))
            fillPath.addCurveToPoint(CGPoint(x: 10, y: 0), controlPoint1: CGPoint(x: 5, y: 10), controlPoint2: CGPoint(x: 10, y: 5))
            fillPath.addCurveToPoint(CGPoint(x: 0, y: -10), controlPoint1: CGPoint(x: 10, y: -5), controlPoint2: CGPoint(x: 5, y: -10))
            fillPath.closePath()
        }

        fillPath.moveToPoint(CGPoint(x: 0, y: 40))
        fillPath.addCurveToPoint(CGPoint(x: -20, y: 0), controlPoint1: CGPoint(x: -20, y: 15), controlPoint2: CGPoint(x: -20, y: 10))
        fillPath.addCurveToPoint(CGPoint(x: 0, y: -20), controlPoint1: CGPoint(x: -20, y: -10), controlPoint2: CGPoint(x: -10, y: -20))
        fillPath.addCurveToPoint(CGPoint(x: 20, y: 0), controlPoint1: CGPoint(x: 10, y: -20), controlPoint2: CGPoint(x: 20, y: -10))
        fillPath.addCurveToPoint(CGPoint(x: 0, y: 40), controlPoint1: CGPoint(x: 20, y: 10), controlPoint2: CGPoint(x: 20, y: 15))
        fillPath.closePath()

        fillPath.fill()

        if circle {
            // Circle Drawing
            CGContextSaveGState(context)
            CGContextRotateCTM(context, -180 * CGFloat(M_PI) / 180)

            let circlePath = UIBezierPath(style: self)
            circlePath.moveToPoint(CGPoint(x: 0, y: -10))
            circlePath.addCurveToPoint(CGPoint(x: 10, y: 0), controlPoint1: CGPoint(x: 5, y: -10), controlPoint2: CGPoint(x: 10, y: -5))
            circlePath.addCurveToPoint(CGPoint(x: 0, y: 10), controlPoint1: CGPoint(x: 10, y: 5), controlPoint2: CGPoint(x: 5, y: 10))
            circlePath.addCurveToPoint(CGPoint(x: -10, y: 0), controlPoint1: CGPoint(x: -5, y: 10), controlPoint2: CGPoint(x: -10, y: 5))
            circlePath.addCurveToPoint(CGPoint(x: 0, y: -10), controlPoint1: CGPoint(x: -10, y: -5), controlPoint2: CGPoint(x: -5, y: -10))
            circlePath.closePath()

            if time < 1 {
                CGContextSetLineDash(context, 0, [circleLineLength, 400], 2)
            }
            circlePath.stroke()

            CGContextRestoreGState(context)
        }


        // Drop Drawing

        let dropPath = UIBezierPath(style: self)
        dropPath.moveToPoint(CGPoint(x: 0, y: 40))
        dropPath.addCurveToPoint(CGPoint(x: -20, y: 0), controlPoint1: CGPoint(x: -20, y: 15), controlPoint2: CGPoint(x: -20, y: 10))
        dropPath.addCurveToPoint(CGPoint(x: 0, y: -20), controlPoint1: CGPoint(x: -20, y: -10), controlPoint2: CGPoint(x: -10, y: -20))
        dropPath.addCurveToPoint(CGPoint(x: 20, y: 0), controlPoint1: CGPoint(x: 10, y: -20), controlPoint2: CGPoint(x: 20, y: -10))
        dropPath.addCurveToPoint(CGPoint(x: 0, y: 40), controlPoint1: CGPoint(x: 20, y: 10), controlPoint2: CGPoint(x: 20, y: 15))
        dropPath.closePath()

        if time < 1 {
            CGContextSetLineDash(context, 0, [pinLineLength, 154], 2)
        }
        dropPath.stroke()

    }

}
