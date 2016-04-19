//
//  Checkmark.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class SettingsIcon: AnimatedIcon {
    
    @IBInspectable public var primaryColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var secondaryColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var handleSize: CGFloat = 6 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var roundedHandle: Bool = true {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var changed: Bool = false {
        willSet {
            
            if newValue != changed {
                animateTo(changed ? 0 : 1)
            }
        }
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        if enabled {
            changed = !changed
            internalValue = changed ? 1 : 0
        }
    }
    
    override func draw(time: CGFloat = 0) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        let color = UIColor(between: primaryColor, and: secondaryColor, using: .HSB, ratio: time)
        color.setStroke()
        
        //// Slider 1 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 50 * scale, 50 * scale)
        CGContextRotateCTM(context, -180 * CGFloat(M_PI) / 180)
        
        let slider1Rect = CGRect(x: -10 * scale, y: -25 * scale, width: 20 * scale, height: 50 * scale)
        CGContextSaveGState(context)
        UIRectClip(slider1Rect)
        CGContextTranslateCTM(context, slider1Rect.origin.x, slider1Rect.origin.y)
        
        drawSlider(time: time)
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)
        
        
        //// Slider 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 65 * scale, 50 * scale)
        
        let slider2Rect = CGRect(x: -10 * scale, y: -25 * scale, width: 20 * scale, height: 50 * scale)
        CGContextSaveGState(context)
        UIRectClip(slider2Rect)
        CGContextTranslateCTM(context, slider2Rect.origin.x, slider2Rect.origin.y)
        
        drawSlider(time: time)
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)
        
        
        //// Slider 3 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 35 * scale, 50 * scale)
        
        let slider3Rect = CGRect(x: -10 * scale, y: -25 * scale, width: 20 * scale, height: 50 * scale)
        CGContextSaveGState(context)
        UIRectClip(slider3Rect)
        CGContextTranslateCTM(context, slider3Rect.origin.x, slider3Rect.origin.y)
        
        drawSlider(time: time)
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)
    }
    
    public func drawSlider(time time: CGFloat = 1) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Variable Declarations
        let handlePosition: CGFloat = (12 + time * 26) * scale
        let halfHandleSize: CGFloat = handleSize / 2.0
        let negativeHalfHandleSize: CGFloat = -halfHandleSize
        let longLineLength: CGFloat = -halfHandleSize + time * 26 * scale
        let shortLineLength: CGFloat = -halfHandleSize + (1 - time) * 26 * scale
        let cornerRadius: CGFloat = roundedHandle ? halfHandleSize : 0
        
        //// Handle Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 10 * scale, handlePosition)
        
        let handlePath = UIBezierPath(roundedRect: CGRect(x: negativeHalfHandleSize, y: negativeHalfHandleSize, width: handleSize, height: handleSize), cornerRadius: cornerRadius)
        
        handlePath.lineWidth = lineWidth
        handlePath.lineCapStyle = lineCap
        handlePath.lineJoinStyle = lineJoin
        
        handlePath.stroke()
        
        CGContextRestoreGState(context)
        
        
        //// Top line Drawing
        let topLinePath = UIBezierPath()
        topLinePath.moveToPoint(CGPoint(x: 10 * scale, y: 5 * scale))
        topLinePath.addLineToPoint(CGPoint(x: 10 * scale, y: (longLineLength + 12 * scale)))
        
        topLinePath.lineWidth = lineWidth
        topLinePath.lineCapStyle = lineCap
        topLinePath.lineJoinStyle = lineJoin
        
        topLinePath.stroke()
        
        
        //// Bottom line Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 10 * scale, 45 * scale)
        CGContextRotateCTM(context, -180 * CGFloat(M_PI) / 180)
        
        let bottomLine = UIBezierPath()
        bottomLine.moveToPoint(CGPoint(x: 0, y: 0))
        bottomLine.addLineToPoint(CGPoint(x: 0, y: (shortLineLength + 7 * scale)))
        
        bottomLine.lineWidth = lineWidth
        bottomLine.lineCapStyle = lineCap
        bottomLine.lineJoinStyle = lineJoin
        
        bottomLine.stroke()
        
        CGContextRestoreGState(context)
    }
    
}
