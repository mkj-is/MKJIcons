//
//  StarIcon.swift
//
//
//  Created by Matěj Jirásek on 15/04/16.
//
//

import UIKit

public enum AnimationDirection {
    case In
    case Out
}

@IBDesignable
public class StarIcon: AnimatedIcon {
    
    @IBInspectable public var strokeColor = UIColor.iconOrangeColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var fillColor = UIColor.iconOrangeColor.colorWithBrightnessComponent(UIColor.iconRedColor.brightness - 0.5) {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var doubleLines = true {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    public var animationDirection = AnimationDirection.In {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    public var animationCenteredOnCorners = true {
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
        let lineLength: CGFloat = 18.2
        let dash: CGFloat = time * lineLength
        let doubleDash: CGFloat = 2 * dash
        let outerPhase: CGFloat = dash
        let gap: CGFloat = (1 - time) * lineLength
        let doubleGap: CGFloat = 2 * gap
        let innerPhase: CGFloat = lineLength + dash
        let varyingGap: CGFloat = doubleLines ? doubleGap : gap
        let varyingDash: CGFloat = doubleLines ? doubleDash : dash
        let inOutPhase = animationDirection == .In ? outerPhase : innerPhase
        let linePhase = animationDirection == .In ? 0 : lineLength
        
        //// Path Drawing
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 50, y: 27.15))
        path.addLineToPoint(CGPoint(x: 55.58, y: 44.46))
        path.addLineToPoint(CGPoint(x: 73.78, y: 44.42))
        path.addLineToPoint(CGPoint(x: 59.04, y: 55.09))
        path.addLineToPoint(CGPoint(x: 64.69, y: 72.38))
        path.addLineToPoint(CGPoint(x: 50, y: 61.65))
        path.addLineToPoint(CGPoint(x: 35.31, y: 72.38))
        path.addLineToPoint(CGPoint(x: 40.96, y: 55.09))
        path.addLineToPoint(CGPoint(x: 26.22, y: 44.42))
        path.addLineToPoint(CGPoint(x: 44.42, y: 44.46))
        path.closePath()
        
        strokeColor.setStroke()
        fillColor.colorWithAlphaComponent(time).setFill()
        
        path.lineWidth = lineWidth
        path.lineCapStyle = lineCapStyle
        path.lineJoinStyle = lineJoinStyle
        
        CGContextSaveGState(context)
        CGContextSetLineDash(context, animationCenteredOnCorners ? inOutPhase : linePhase, [
            animationCenteredOnCorners ? doubleDash : varyingDash,
            animationCenteredOnCorners ? doubleGap : varyingGap
        ], 2)
        path.fill()
        path.stroke()
        CGContextRestoreGState(context)
        
    }
    
}
