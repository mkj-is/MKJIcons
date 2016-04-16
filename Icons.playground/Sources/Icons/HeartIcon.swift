//
//  HeartIcon.swift
//
//
//  Created by Matěj Jirásek on 3/04/16.
//
//

import UIKit

@IBDesignable
public class HeartIcon: AnimatedIcon {
    
    @IBInspectable public var strokeColor = UIColor.iconRedColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var fillColor = UIColor.iconRedColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var fillAlpha: CGFloat = 0.5 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var twoLines = true {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var visible = false {
        willSet {
            
            if newValue != visible {
                animateTo(newValue ? maximumAnimationValue : 0.0)
            }
        }
    }
    
    override func draw(time: CGFloat = 0) {
        
        if time == 0 {
            return
        }
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        //// Variable Declarations
        let dash: CGFloat = time * (twoLines ? 82 : 164) * scale
        let gap: CGFloat = -5 + (1 - time) * (twoLines ? 82 : 164) * scale
        let phase: CGFloat = -0.5 * scale
        
        //// Bezier Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 50 * scale, 75 * scale)
        CGContextRotateCTM(context, -45 * CGFloat(M_PI) / 180)
        
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPoint(x: 30 * scale, y: -30.19 * scale))
        bezierPath.addLineToPoint(CGPoint(x: 30 * scale, y: -30 * scale))
        bezierPath.addCurveToPoint(CGPoint(x: 45 * scale, y: -15 * scale), controlPoint1: CGPoint(x: 38.28 * scale, y: -30 * scale), controlPoint2: CGPoint(x: 45 * scale, y: -23.28 * scale))
        bezierPath.addCurveToPoint(CGPoint(x: 30 * scale, y: 0), controlPoint1: CGPoint(x: 45 * scale, y: -6.72 * scale), controlPoint2: CGPoint(x: 38.28 * scale, y: 0))
        bezierPath.addLineToPoint(CGPoint(x: 0, y: 0))
        bezierPath.addLineToPoint(CGPoint(x: 0, y: -30 * scale))
        bezierPath.addCurveToPoint(CGPoint(x: 5.94 * scale, y: -41.95 * scale), controlPoint1: CGPoint(x: 0, y: -34.88 * scale), controlPoint2: CGPoint(x: 2.33 * scale, y: -39.21 * scale))
        bezierPath.addLineToPoint(CGPoint(x: 6.03 * scale, y: -42.02 * scale))
        bezierPath.addCurveToPoint(CGPoint(x: 15 * scale, y: -45 * scale), controlPoint1: CGPoint(x: 8.53 * scale, y: -43.89 * scale), controlPoint2: CGPoint(x: 11.64 * scale, y: -45 * scale))
        bezierPath.addCurveToPoint(CGPoint(x: 30 * scale, y: -30.19 * scale), controlPoint1: CGPoint(x: 23.22 * scale, y: -45 * scale), controlPoint2: CGPoint(x: 29.9 * scale, y: -38.39 * scale))
        bezierPath.closePath()
        bezierPath.lineCapStyle = lineCapStyle
        bezierPath.lineJoinStyle = lineJoinStyle
        bezierPath.lineWidth = lineWidth
        strokeColor.setStroke()
        fillColor.colorWithAlphaComponent(time * fillAlpha).setFill()
        CGContextSaveGState(context)
        CGContextSetLineDash(context, phase, [dash, gap], 2)
        bezierPath.fill()
        bezierPath.stroke()
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)

    }
    
}
