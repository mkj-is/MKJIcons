//
//  Checkmark.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class CheckmarkIcon: AnimatedIcon {
    
    @IBInspectable public var checkmarkColor = UIColor.iconLightGreenColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var crossColor = UIColor.iconRedColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var checked = false {
        willSet {
            
            if newValue != checked {
                animateTo(checked ? 0.0 : maximumAnimationValue)
            }
        }
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        if enabled {
            checked = !checked
            value = checked ? 1 : 0
        }
    }
    
    override func draw(time: CGFloat = 0) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        let currentColor = UIColor(between: crossColor, and: checkmarkColor, using: colorAnimationMode, ratio: time / maximumAnimationValue)
        
        //// Variable Declarations
        let phase: CGFloat = -time * 111 * scale
        let dash: CGFloat = (1 - time / 2.0) * 57 * scale
        
        //// Static line Drawing
        let staticLinePath = UIBezierPath()
        staticLinePath.moveToPoint(CGPoint(x: 70 * scale, y: 30 * scale))
        staticLinePath.addLineToPoint(CGPoint(x: 30 * scale, y: 70 * scale))
        staticLinePath.lineCapStyle = lineCapStyle;
        
        currentColor.setStroke()
        staticLinePath.lineWidth = lineWidth
        staticLinePath.stroke()
        
        
        //// Animated line Drawing
        let animatedLinePath = UIBezierPath()
        animatedLinePath.moveToPoint(CGPoint(x: 30 * scale, y: 30 * scale))
        animatedLinePath.addCurveToPoint(CGPoint(x: 70 * scale, y: 70 * scale), controlPoint1: CGPoint(x: 30 * scale, y: 30 * scale), controlPoint2: CGPoint(x: 56.58 * scale, y: 56.58 * scale))
        animatedLinePath.addCurveToPoint(CGPoint(x: 30 * scale, y: 70 * scale), controlPoint1: CGPoint(x: 83.42 * scale, y: 83.42 * scale), controlPoint2: CGPoint(x: 46.03 * scale, y: 86.03 * scale))
        animatedLinePath.addCurveToPoint(CGPoint(x: 10 * scale, y: 50 * scale), controlPoint1: CGPoint(x: 13.97 * scale, y: 53.97 * scale), controlPoint2: CGPoint(x: 10 * scale, y: 50 * scale))

        animatedLinePath.lineCapStyle = lineCapStyle
        animatedLinePath.lineWidth = lineWidth
        animatedLinePath.lineJoinStyle = lineJoinStyle
        
        CGContextSaveGState(context)
        CGContextSetLineDash(context, phase, [dash, 200 * scale], 2)
        animatedLinePath.stroke()
        CGContextRestoreGState(context)
    }
    
}
