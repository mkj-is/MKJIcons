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
        let circleLineLength: CGFloat = 20 * CGFloat(M_PI) * time
        let pinLineLength: CGFloat = time * 154
        
        //// Fill Drawing
        let fillPath = UIBezierPath()
        
        if circle {
            fillPath.moveToPoint(CGPoint(x: 50, y: 29.79))
            fillPath.addCurveToPoint(CGPoint(x: 40, y: 39.79), controlPoint1: CGPoint(x: 44.48, y: 29.79), controlPoint2: CGPoint(x: 40, y: 34.27))
            fillPath.addCurveToPoint(CGPoint(x: 40.01, y: 40.21), controlPoint1: CGPoint(x: 40, y: 39.93), controlPoint2: CGPoint(x: 40, y: 40.07))
            fillPath.addCurveToPoint(CGPoint(x: 50, y: 49.79), controlPoint1: CGPoint(x: 40.23, y: 45.54), controlPoint2: CGPoint(x: 44.62, y: 49.79))
            fillPath.addCurveToPoint(CGPoint(x: 60, y: 39.79), controlPoint1: CGPoint(x: 55.52, y: 49.79), controlPoint2: CGPoint(x: 60, y: 45.31))
            fillPath.addCurveToPoint(CGPoint(x: 50, y: 29.79), controlPoint1: CGPoint(x: 60, y: 34.27), controlPoint2: CGPoint(x: 55.52, y: 29.79))
            fillPath.closePath()
        }
        
        fillPath.moveToPoint(CGPoint(x: 69.91, y: 40.02))
        fillPath.addCurveToPoint(CGPoint(x: 49.91, y: 80.9), controlPoint1: CGPoint(x: 69.91, y: 51.07), controlPoint2: CGPoint(x: 49.91, y: 80.9))
        fillPath.addCurveToPoint(CGPoint(x: 40.27, y: 65.22), controlPoint1: CGPoint(x: 49.91, y: 80.9), controlPoint2: CGPoint(x: 45.15, y: 73.79))
        fillPath.addCurveToPoint(CGPoint(x: 29.91, y: 40.02), controlPoint1: CGPoint(x: 35.15, y: 56.25), controlPoint2: CGPoint(x: 29.91, y: 45.67))
        fillPath.addCurveToPoint(CGPoint(x: 49.91, y: 20.02), controlPoint1: CGPoint(x: 29.91, y: 28.98), controlPoint2: CGPoint(x: 38.87, y: 20.02))
        fillPath.addCurveToPoint(CGPoint(x: 69.91, y: 40.02), controlPoint1: CGPoint(x: 60.96, y: 20.02), controlPoint2: CGPoint(x: 69.91, y: 28.98))
        fillPath.closePath()
        fillPath.fill()
        
        if circle {
            //// Circle Drawing
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, 50, 40)
            CGContextRotateCTM(context, -180 * CGFloat(M_PI) / 180)
            
            let circlePath = UIBezierPath()
            circlePath.moveToPoint(CGPoint(x: 0, y: -10))
            circlePath.addCurveToPoint(CGPoint(x: 10, y: 0), controlPoint1: CGPoint(x: 5.52, y: -10), controlPoint2: CGPoint(x: 10, y: -5.52))
            circlePath.addCurveToPoint(CGPoint(x: 0, y: 10), controlPoint1: CGPoint(x: 10, y: 5.52), controlPoint2: CGPoint(x: 5.52, y: 10))
            circlePath.addCurveToPoint(CGPoint(x: -10, y: 0), controlPoint1: CGPoint(x: -5.52, y: 10), controlPoint2: CGPoint(x: -10, y: 5.52))
            circlePath.addCurveToPoint(CGPoint(x: 0, y: -10), controlPoint1: CGPoint(x: -10, y: -5.52), controlPoint2: CGPoint(x: -5.52, y: -10))
            circlePath.closePath()
            
            circlePath.lineCapStyle = lineCap
            circlePath.lineJoinStyle = lineJoin
            circlePath.lineWidth = lineWidth
            
            CGContextSaveGState(context)
            CGContextSetLineDash(context, 0, [circleLineLength, 400], 2)
            circlePath.stroke()
            CGContextRestoreGState(context)
            
            CGContextRestoreGState(context)
        }
        
        
        //// Drop Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 50.04, 41.53)
        
        let dropPath = UIBezierPath()
        dropPath.moveToPoint(CGPoint(x: -0.12, y: 39.58))
        dropPath.addCurveToPoint(CGPoint(x: -20.12, y: -1.3), controlPoint1: CGPoint(x: -0.12, y: 39.58), controlPoint2: CGPoint(x: -20.12, y: 9.75))
        dropPath.addCurveToPoint(CGPoint(x: -0.12, y: -21.3), controlPoint1: CGPoint(x: -20.12, y: -12.34), controlPoint2: CGPoint(x: -11.17, y: -21.3))
        dropPath.addCurveToPoint(CGPoint(x: 19.88, y: -1.3), controlPoint1: CGPoint(x: 10.92, y: -21.3), controlPoint2: CGPoint(x: 19.88, y: -12.34))
        dropPath.addCurveToPoint(CGPoint(x: -0.12, y: 39.58), controlPoint1: CGPoint(x: 19.88, y: 9.75), controlPoint2: CGPoint(x: -0.12, y: 39.58))
        dropPath.closePath()
        
        dropPath.lineCapStyle = lineCap
        dropPath.lineJoinStyle = lineJoin
        dropPath.lineWidth = lineWidth
        
        CGContextSaveGState(context)
        CGContextSetLineDash(context, 0, [pinLineLength, 154], 2)
        dropPath.stroke()
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)
        
    }
    
}
