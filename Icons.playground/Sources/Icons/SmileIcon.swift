//
//  Checkmark.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class SmileIcon: AnimatedIcon {
    
    // MARK: - Inspectable properties
    
    @IBInspectable public var sadColor: UIColor = UIColor.iconRedColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var happyColor: UIColor = UIColor.iconLightGreenColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var eyeMovement: CGFloat = 4 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var mouthMovement: CGFloat = 8 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var showFace: Bool = true {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var sad: Bool {
        get {
            return value.toBool()
        }
        set (newValue) {
            value = newValue.toCGFloat()
        }
    }
    
    // MARK: - Drawing methods
    
    override func draw(time: CGFloat = 0) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        let strokeColor = UIColor(between: happyColor, and: sadColor, using: colorMode, ratio: time)
        strokeColor.setStroke()
        let fillColor = strokeColor.colorWithAlphaComponent(fillAlpha)
        fillColor.setFill()
        
        //// Variable Declarations
        let minusHalfLineWidth: CGFloat = -scaledLineWidth / 2.0
        let eyeOffset: CGFloat = -eyeMovement / 2.0 + eyeMovement * time
        let lipY: CGFloat = -mouthMovement / 2.0 + time * mouthMovement
        
        CGContextTranslateCTM(context, 50, 50)
        
        //// Face Drawing
        if (showFace) {
            let facePath = UIBezierPath(ovalInRect: CGRect(x: -20, y: -20, width: 40, height: 40))
            facePath.lineWidth = scaledLineWidth
            facePath.stroke()
            facePath.fill()
        }
        
        strokeColor.setFill()
        
        //// Right eye Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, -8, (eyeOffset - 9))
        
        let rightEyePath = UIBezierPath(ovalInRect: CGRect(x: minusHalfLineWidth, y: minusHalfLineWidth, width: scaledLineWidth, height: scaledLineWidth))
        rightEyePath.fill()
        
        CGContextRestoreGState(context)
        
        
        //// Left eye Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 8, (eyeOffset - 9))
        
        let leftEyePath = UIBezierPath(ovalInRect: CGRect(x: minusHalfLineWidth, y: minusHalfLineWidth, width: scaledLineWidth, height: scaledLineWidth))
        leftEyePath.fill()
        
        CGContextRestoreGState(context)
        
        
        //// Bezier Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 0, 5)
        
        let mouthPath = UIBezierPath(style: self)
        mouthPath.moveToPoint(CGPoint(x: -10, y: lipY))
        mouthPath.addCurveToPoint(CGPoint(x: 0, y: 0), controlPoint1: CGPoint(x: -10, y: lipY), controlPoint2: CGPoint(x: -7, y: 0))
        mouthPath.addCurveToPoint(CGPoint(x: 10, y: lipY), controlPoint1: CGPoint(x: 7, y: -0), controlPoint2: CGPoint(x: 10, y: lipY))
        
        mouthPath.stroke()
        
    }
    
}
