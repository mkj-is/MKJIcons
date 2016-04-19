//
//  BurgerIcon.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class BurgerIcon: AnimatedIcon {
    
    @IBInspectable public var burgerColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var crossColor: UIColor = UIColor.iconRedColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var open: Bool = false {
        willSet {
            
            if newValue != open {
                animateTo(open ? 0 : 1)
            }
        }
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        if enabled {
            open = !open
            internalValue = open ? 1 : 0
        }
    }
    
    override func draw(time: CGFloat = 0) {
        
        let offset: CGFloat = 5 * scale
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        let currentColor = UIColor(between: burgerColor, and: crossColor, using: colorMode, ratio: time)
        
        //// Variable Declarations
        let angle: CGFloat = time * 45
        let negativeAngle: CGFloat = -angle
        let localScale: CGFloat = 1 + time * 0.414
        let opacity = UIColor(red: burgerColor.red, green: burgerColor.green, blue: burgerColor.blue, alpha: burgerColor.alpha - time * burgerColor.alpha)
        let timedOffset: CGFloat = time * offset
        let negativeTimedOffset: CGFloat = -timedOffset
        let timeLineWidth: CGFloat = lineWidth / localScale
        
        //// Bottom Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 30 * scale, (timedOffset + 65 * scale))
        CGContextRotateCTM(context, -angle * CGFloat(M_PI) / 180)
        CGContextScaleCTM(context, localScale, localScale)
        
        let bottomPath = UIBezierPath()
        bottomPath.moveToPoint(CGPoint(x: 40 * scale, y: 0))
        bottomPath.addLineToPoint(CGPoint(x: 0, y: 0))
        bottomPath.lineCapStyle = lineCap;
        
        currentColor.setStroke()
        bottomPath.lineWidth = timeLineWidth
        bottomPath.stroke()
        
        CGContextRestoreGState(context)
        
        
        //// Middle Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 50 * scale, 50 * scale)
        
        let middlePath = UIBezierPath()
        middlePath.moveToPoint(CGPoint(x: 20 * scale, y: 0))
        middlePath.addLineToPoint(CGPoint(x: -20 * scale, y: 0))
        middlePath.lineCapStyle = lineCap;
        
        opacity.setStroke()
        middlePath.lineWidth = lineWidth
        middlePath.stroke()
        
        CGContextRestoreGState(context)
        
        
        //// Top Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 30 * scale, (negativeTimedOffset + 35 * scale))
        CGContextRotateCTM(context, -negativeAngle * CGFloat(M_PI) / 180)
        CGContextScaleCTM(context, localScale, localScale)
        
        let topPath = UIBezierPath()
        topPath.moveToPoint(CGPoint(x: 40 * scale, y: 0))
        topPath.addLineToPoint(CGPoint(x: 0, y: 0))
        topPath.lineCapStyle = lineCap;
        
        currentColor.setStroke()
        topPath.lineWidth = timeLineWidth
        topPath.stroke()
        
        CGContextRestoreGState(context)
    }
    
}
