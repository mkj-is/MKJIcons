//
//  MKJCheckmark.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class MKJCheckmarkIcon: MKJAnimatedIcon {
    
    @IBInspectable public var checkmarkColor = UIColor.greenColor()
    @IBInspectable public var crossColor = UIColor.redColor()
    
    @IBInspectable public var checked = false {
        willSet {
            
            if newValue != checked {
                animateTo(checked ? maximumAnimationValue : 0.0)
            }
        }
    }
    
    override func draw(time: CGFloat = 0) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        // Calculate color
        let r = crossColor.red + (checkmarkColor.red - crossColor.red) / maximumAnimationValue * time
        let g = crossColor.green + (checkmarkColor.green - crossColor.green) / maximumAnimationValue * time
        let b = crossColor.blue + (checkmarkColor.blue - crossColor.blue) / maximumAnimationValue * time
        let a = crossColor.alpha + (checkmarkColor.alpha - crossColor.alpha) / maximumAnimationValue * time
        
        let currentColor = UIColor(red: r, green: g, blue: b, alpha: a)
        
        
        //// Variable Declarations
        let phase: CGFloat = -time * 111
        let dash: CGFloat = 57 - time / 2.0 * 57
        
        //// Static line Drawing
        let staticLinePath = UIBezierPath()
        staticLinePath.moveToPoint(CGPoint(x: 70, y: 30))
        staticLinePath.addLineToPoint(CGPoint(x: 30, y: 70))
        staticLinePath.lineCapStyle = .Square;
        
        currentColor.setStroke()
        staticLinePath.lineWidth = strokeWidth
        staticLinePath.stroke()
        
        
        //// Animated line Drawing
        let animatedLinePath = UIBezierPath()
        animatedLinePath.moveToPoint(CGPoint(x: 30, y: 30))
        animatedLinePath.addCurveToPoint(CGPoint(x: 70, y: 70), controlPoint1: CGPoint(x: 30, y: 30), controlPoint2: CGPoint(x: 56.58, y: 56.58))
        animatedLinePath.addCurveToPoint(CGPoint(x: 30, y: 70), controlPoint1: CGPoint(x: 83.42, y: 83.42), controlPoint2: CGPoint(x: 46.03, y: 86.03))
        animatedLinePath.addCurveToPoint(CGPoint(x: 10, y: 50), controlPoint1: CGPoint(x: 13.97, y: 53.97), controlPoint2: CGPoint(x: 10, y: 50))
        animatedLinePath.lineCapStyle = .Square;
        
        animatedLinePath.lineWidth = strokeWidth
        CGContextSaveGState(context)
        CGContextSetLineDash(context, phase, [dash, 200], 2)
        animatedLinePath.stroke()
        CGContextRestoreGState(context)
    }
    
}
