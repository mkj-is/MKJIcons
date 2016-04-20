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
    
    // MARK: Inspectable attributes
    
    @IBInspectable public var strokeColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var fillColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var fillAlpha: CGFloat = 0.5 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var circle: Bool = true {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var visible: Bool = false {
        willSet {
            
            if newValue != visible {
                animateTo(newValue ? 1 : 0)
            }
        }
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        if enabled {
            visible = !visible
            internalValue = visible ? 1 : 0
        }
    }
    
    override func draw(time: CGFloat = 0) {
        
        if time == 0 {
            return
        }
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        
        strokeColor.setStroke()
        fillColor.colorWithAlphaComponent(time * fillAlpha).setFill()
        
        //// Variable Declarations
        let circleLineLength: CGFloat = 20 * CGFloat(M_PI) * time * scale
        let pinLineLength: CGFloat = time * 154 * scale
        
        CGContextTranslateCTM(context, 50 * scale, 40 * scale)
        
        //// Fill Drawing
        let fillPath = UIBezierPath()
        
        if circle {
            fillPath.moveToPoint(CGPoint(x: 0, y: -10 * scale))
            fillPath.addCurveToPoint(CGPoint(x: -10 * scale, y: 0), controlPoint1: CGPoint(x: -5 * scale, y: -10 * scale), controlPoint2: CGPoint(x: -10 * scale, y: -5 * scale))
            fillPath.addCurveToPoint(CGPoint(x: -10 * scale, y: 0), controlPoint1: CGPoint(x: -10 * scale, y: 0), controlPoint2: CGPoint(x: -10 * scale, y: 0))
            fillPath.addCurveToPoint(CGPoint(x: 0, y: 10 * scale), controlPoint1: CGPoint(x: -10 * scale, y: 5 * scale), controlPoint2: CGPoint(x: -5 * scale, y: 10 * scale))
            fillPath.addCurveToPoint(CGPoint(x: 10 * scale, y: 0), controlPoint1: CGPoint(x: 5 * scale, y: 10 * scale), controlPoint2: CGPoint(x: 10 * scale, y: 5 * scale))
            fillPath.addCurveToPoint(CGPoint(x: 0, y: -10 * scale), controlPoint1: CGPoint(x: 10 * scale, y: -5 * scale), controlPoint2: CGPoint(x: 5 * scale, y: -10 * scale))
            fillPath.closePath()
        }
        
        fillPath.moveToPoint(CGPoint(x: 0, y: 40 * scale))
        fillPath.addCurveToPoint(CGPoint(x: -20 * scale, y: 0), controlPoint1: CGPoint(x: -20 * scale, y: 15 * scale), controlPoint2: CGPoint(x: -20 * scale, y: 10 * scale))
        fillPath.addCurveToPoint(CGPoint(x: 0, y: -20 * scale), controlPoint1: CGPoint(x: -20 * scale, y: -10 * scale), controlPoint2: CGPoint(x: -10 * scale, y: -20 * scale))
        fillPath.addCurveToPoint(CGPoint(x: 20 * scale, y: 0), controlPoint1: CGPoint(x: 10 * scale, y: -20 * scale), controlPoint2: CGPoint(x: 20 * scale, y: -10 * scale))
        fillPath.addCurveToPoint(CGPoint(x: 0, y: 40 * scale), controlPoint1: CGPoint(x: 20 * scale, y: 10 * scale), controlPoint2: CGPoint(x: 20 * scale, y: 15 * scale))
        fillPath.closePath()
        
        fillPath.fill()
        
        if circle {
            //// Circle Drawing
            CGContextSaveGState(context)
            CGContextRotateCTM(context, -180 * CGFloat(M_PI) / 180)
            
            let circlePath = UIBezierPath()
            circlePath.moveToPoint(CGPoint(x: 0, y: -10 * scale))
            circlePath.addCurveToPoint(CGPoint(x: 10 * scale, y: 0), controlPoint1: CGPoint(x: 5 * scale, y: -10 * scale), controlPoint2: CGPoint(x: 10 * scale, y: -5 * scale))
            circlePath.addCurveToPoint(CGPoint(x: 0, y: 10 * scale), controlPoint1: CGPoint(x: 10 * scale, y: 5 * scale), controlPoint2: CGPoint(x: 5 * scale, y: 10 * scale))
            circlePath.addCurveToPoint(CGPoint(x: -10 * scale, y: 0), controlPoint1: CGPoint(x: -5 * scale, y: 10 * scale), controlPoint2: CGPoint(x: -10 * scale, y: 5 * scale))
            circlePath.addCurveToPoint(CGPoint(x: 0, y: -10 * scale), controlPoint1: CGPoint(x: -10 * scale, y: -5 * scale), controlPoint2: CGPoint(x: -5 * scale, y: -10 * scale))
            circlePath.closePath()
            
            circlePath.lineCapStyle = lineCap
            circlePath.lineJoinStyle = lineJoin
            circlePath.lineWidth = lineWidth

            if time < 1 {
                CGContextSetLineDash(context, 0, [circleLineLength, 400], 2)
            }
            circlePath.stroke()
            
            CGContextRestoreGState(context)
        }
        
        
        //// Drop Drawing
        
        let dropPath = UIBezierPath()
        dropPath.moveToPoint(CGPoint(x: 0, y: 40 * scale))
        dropPath.addCurveToPoint(CGPoint(x: -20 * scale, y: 0), controlPoint1: CGPoint(x: -20 * scale, y: 15 * scale), controlPoint2: CGPoint(x: -20 * scale, y: 10 * scale))
        dropPath.addCurveToPoint(CGPoint(x: 0, y: -20 * scale), controlPoint1: CGPoint(x: -20 * scale, y: -10 * scale), controlPoint2: CGPoint(x: -10 * scale, y: -20 * scale))
        dropPath.addCurveToPoint(CGPoint(x: 20 * scale, y: 0), controlPoint1: CGPoint(x: 10 * scale, y: -20 * scale), controlPoint2: CGPoint(x: 20 * scale, y: -10 * scale))
        dropPath.addCurveToPoint(CGPoint(x: 0, y: 40 * scale), controlPoint1: CGPoint(x: 20 * scale, y: 10 * scale), controlPoint2: CGPoint(x: 20 * scale, y: 15 * scale))
        dropPath.closePath()
        
        dropPath.lineCapStyle = lineCap
        dropPath.lineJoinStyle = lineJoin
        dropPath.lineWidth = lineWidth

        if time < 1 {
            CGContextSetLineDash(context, 0, [pinLineLength, 154], 2)
        }
        dropPath.stroke()
        
    }
    
}
