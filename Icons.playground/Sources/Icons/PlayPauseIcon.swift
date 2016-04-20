//
//  Checkmark.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class PlayPauseIcon: AnimatedIcon {
    
    @IBInspectable public var width: CGFloat = 10 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var height: CGFloat = 40 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var playColor: UIColor = UIColor.iconLightGreenColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var pauseColor: UIColor = UIColor.iconOrangeColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var fillAlpha: CGFloat = 0.5 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var playing: Bool = false {
        willSet {
            
            if newValue != playing {
                animateTo(playing ? 0 : 1)
            }
        }
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        if enabled {
            playing = !playing
            internalValue = playing ? 1 : 0
        }
    }
    
    override func draw(time: CGFloat = 0) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        let strokeColor = UIColor(between: playColor, and: pauseColor, using: colorMode, ratio: time)
        strokeColor.setStroke()
        
        let fillColor = strokeColor.colorWithAlphaComponent(fillAlpha)
        fillColor.setFill()
        
        //// Variable Declarations
        let invertedTime: CGFloat = 1 - time
        let offsetX: CGFloat = width / 2.0
        let offsetMinusX: CGFloat = -width / 2.0
        let offsetY: CGFloat = height / 2.0
        let decreasingOffset: CGFloat = offsetY * time
        let decreasingMinusOffset: CGFloat = -decreasingOffset
        let offsetMinusY: CGFloat = -height / 2.0
        let topPoint = CGPoint(x: offsetX + height / 2.0 * invertedTime, y: -offsetY * time)
        let bottomPoint = CGPoint(x: offsetX + height / 2.0 * invertedTime, y: -offsetMinusY * time)
        
        //// Right line Drawing
        if time > 0 {
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, 60 * scale, 50 * scale)
            
            let rightLinePath = UIBezierPath()
            rightLinePath.moveToPoint(CGPoint(x: offsetMinusX, y: decreasingOffset))
            rightLinePath.addLineToPoint(CGPoint(x: offsetX, y: decreasingOffset))
            rightLinePath.addLineToPoint(CGPoint(x: offsetX, y: decreasingMinusOffset))
            rightLinePath.addLineToPoint(CGPoint(x: offsetMinusX, y: decreasingMinusOffset))
            rightLinePath.addLineToPoint(CGPoint(x: offsetMinusX, y: decreasingOffset))
            rightLinePath.closePath()
            
            rightLinePath.lineWidth = lineWidth
            rightLinePath.lineJoinStyle = lineJoin
            rightLinePath.lineCapStyle = lineCap
            
            rightLinePath.stroke()
            rightLinePath.fill()
            
            CGContextRestoreGState(context)
        }
        
        
        //// Left line Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 40 * scale, 50 * scale)
        
        let leftLinePath = UIBezierPath()
        leftLinePath.moveToPoint(CGPoint(x: offsetMinusX, y: offsetY))
        leftLinePath.addLineToPoint(bottomPoint)
        leftLinePath.addLineToPoint(topPoint)
        leftLinePath.addLineToPoint(CGPoint(x: offsetMinusX, y: offsetMinusY))
        leftLinePath.addLineToPoint(CGPoint(x: offsetMinusX, y: offsetY))
        leftLinePath.closePath()
        
        leftLinePath.lineWidth = lineWidth
        leftLinePath.lineJoinStyle = lineJoin
        leftLinePath.lineCapStyle = lineCap
        
        leftLinePath.stroke()
        leftLinePath.fill()
        
        CGContextRestoreGState(context)
    }
    
}
