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
    
    // MARK: - Inspectable properties
    
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
    
    @IBInspectable public var open: Bool {
        get {
            return value.toBool()
        }
        set (newValue) {
            value = newValue.toCGFloat()
        }
    }
    
    // MARK: - Drawing methods
    
    override func draw(time: CGFloat = 0) {
        
        let offset: CGFloat = 5
        
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
        let timeLineWidth: CGFloat = scaledLineWidth / localScale
        
        CGContextScaleCTM(context, scale, scale)
        
        //// Bottom Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 30, (timedOffset + 65))
        CGContextRotateCTM(context, -angle * CGFloat(M_PI) / 180)
        CGContextScaleCTM(context, localScale, localScale)
        
        let bottomPath = UIBezierPath()
        bottomPath.moveToPoint(CGPoint(x: 40, y: 0))
        bottomPath.addLineToPoint(CGPoint(x: 0, y: 0))
        bottomPath.lineCapStyle = lineCap;
        
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
        middlePath.lineCapStyle = lineCap
        
        opacity.setStroke()
        middlePath.lineWidth = scaledLineWidth
        middlePath.stroke()
        
        CGContextRestoreGState(context)
        
        
        //// Top Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 30, (negativeTimedOffset + 35))
        CGContextRotateCTM(context, -negativeAngle * CGFloat(M_PI) / 180)
        CGContextScaleCTM(context, localScale, localScale)
        
        let topPath = UIBezierPath()
        topPath.moveToPoint(CGPoint(x: 40, y: 0))
        topPath.addLineToPoint(CGPoint(x: 0, y: 0))
        topPath.lineCapStyle = lineCap
        
        currentColor.setStroke()
        topPath.lineWidth = timeLineWidth
        topPath.stroke()
        
        CGContextRestoreGState(context)
    }
    
}
