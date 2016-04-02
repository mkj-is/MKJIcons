//
//  MKJBurgerIcon.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class MKJBurgerIcon: MKJAnimatedIcon {
    
    @IBInspectable public var burgerColor = UIColor.whiteColor()
    @IBInspectable public var crossColor = UIColor.redColor()
    
    @IBInspectable public var open = false {
        willSet {
            
            if newValue != open {
                animateTo(open ? 0.0 : maximumAnimationValue)
            }
        }
    }
    
    override func draw(time: CGFloat = 0) {
        
        let offset: CGFloat = 5
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        let currentColor = UIColor(between: burgerColor, and: crossColor, using: colorAnimationMode, ratio: time / maximumAnimationValue)
        
        //// Variable Declarations
        let angle: CGFloat = time * 45
        let negativeAngle: CGFloat = -angle
        let scale: CGFloat = 1 + time * 0.414
        let opacity = UIColor(red: burgerColor.red, green: burgerColor.green, blue: burgerColor.blue, alpha: burgerColor.alpha - time * burgerColor.alpha)
        let timedOffset: CGFloat = time * offset
        let negativeTimedOffset: CGFloat = -timedOffset
        let timeLineWidth: CGFloat = strokeWidth / scale
        
        //// Bottom Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 30, (timedOffset + 65))
        CGContextRotateCTM(context, -angle * CGFloat(M_PI) / 180)
        CGContextScaleCTM(context, scale, scale)
        
        let bottomPath = UIBezierPath()
        bottomPath.moveToPoint(CGPoint(x: 40, y: 0))
        bottomPath.addLineToPoint(CGPoint(x: 0, y: 0))
        bottomPath.lineCapStyle = .Square;
        
        currentColor.setStroke()
        bottomPath.lineWidth = timeLineWidth
        bottomPath.stroke()
        
        CGContextRestoreGState(context)
        
        
        //// Middle Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 50, 50)
        
        let middlePath = UIBezierPath()
        middlePath.moveToPoint(CGPoint(x: 20, y: 0))
        middlePath.addLineToPoint(CGPoint(x: -20, y: 0))
        middlePath.lineCapStyle = .Square;
        
        opacity.setStroke()
        middlePath.lineWidth = strokeWidth
        middlePath.stroke()
        
        CGContextRestoreGState(context)
        
        
        //// Top Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 30, (negativeTimedOffset + 35))
        CGContextRotateCTM(context, -negativeAngle * CGFloat(M_PI) / 180)
        CGContextScaleCTM(context, scale, scale)
        
        let topPath = UIBezierPath()
        topPath.moveToPoint(CGPoint(x: 40, y: 0))
        topPath.addLineToPoint(CGPoint(x: 0, y: 0))
        topPath.lineCapStyle = .Square;
        
        currentColor.setStroke()
        topPath.lineWidth = timeLineWidth
        topPath.stroke()
        
        CGContextRestoreGState(context)
    }
    
}
