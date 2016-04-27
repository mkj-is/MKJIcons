//
//  BikeIcon.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 27/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

@IBDesignable
public class BikeIcon: AnimatedIcon {
    
    // MARK: - Inspectable properties
    
    @IBInspectable public var strokeColor: UIColor = UIColor.iconOrangeColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var visible: Bool {
        get {
            return value.toBool()
        }
        set (newValue) {
            value = newValue.toCGFloat()
        }
    }
    
    // MARK: - Drawing methods
    
    override func draw(time: CGFloat = 0) {
        
        if time == 0 {
            return
        }
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        CGContextScaleCTM(context, scale, scale)
        
        strokeColor.setStroke()
        
        //// Variable Declarations
        let firstDraw: CGFloat = time * 3
        let one: CGFloat = firstDraw < 0 ? 0 : (firstDraw > 1 ? 1 : firstDraw)
        let secondDraw: CGFloat = time * 3 - 1
        let two: CGFloat = secondDraw < 0 ? 0 : (secondDraw > 1 ? 1 : secondDraw)
        let thirdDraw: CGFloat = time * 3 - 2
        let three: CGFloat = thirdDraw < 0 ? 0 : (thirdDraw > 1 ? 1 : thirdDraw)
        
        let frameLine: CGFloat = two * 88
        let bikeLine: CGFloat = one * 69
        let barLine: CGFloat = three * 33
        let seatLine: CGFloat = three * 38
        
        //// First wheel
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 29.5, 64.5)
        CGContextRotateCTM(context, 90 * CGFloat(M_PI) / 180)
        
        let firstWheel = UIBezierPath()
        firstWheel.moveToPoint(CGPoint(x: -11, y: 0))
        firstWheel.addCurveToPoint(CGPoint(x: 0, y: 11), controlPoint1: CGPoint(x: -11, y: 6.08), controlPoint2: CGPoint(x: -6.08, y: 11))
        firstWheel.addCurveToPoint(CGPoint(x: 11, y: 0), controlPoint1: CGPoint(x: 6.08, y: 11), controlPoint2: CGPoint(x: 11, y: 6.08))
        firstWheel.addCurveToPoint(CGPoint(x: 0, y: -11), controlPoint1: CGPoint(x: 11, y: -6.08), controlPoint2: CGPoint(x: 6.08, y: -11))
        firstWheel.addCurveToPoint(CGPoint(x: -11, y: 0), controlPoint1: CGPoint(x: -6.08, y: -11), controlPoint2: CGPoint(x: -11, y: -6.08))
        firstWheel.closePath()
        
        firstWheel.lineWidth = lineWidth
        firstWheel.lineCapStyle = lineCap
        firstWheel.lineJoinStyle = lineJoin
        
        CGContextSaveGState(context)
        CGContextSetLineDash(context, 0, [bikeLine, 100], 2)
        firstWheel.stroke()
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)
        

        // Second wheel
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 70.5, 64.5)
        CGContextRotateCTM(context, -90 * CGFloat(M_PI) / 180)
        
        let secondWheel = UIBezierPath()
        secondWheel.moveToPoint(CGPoint(x: 11, y: 0))
        secondWheel.addCurveToPoint(CGPoint(x: 0, y: 11), controlPoint1: CGPoint(x: 11, y: 6.08), controlPoint2: CGPoint(x: 6.08, y: 11))
        secondWheel.addCurveToPoint(CGPoint(x: -11, y: 0), controlPoint1: CGPoint(x: -6.08, y: 11), controlPoint2: CGPoint(x: -11, y: 6.08))
        secondWheel.addCurveToPoint(CGPoint(x: 0, y: -11), controlPoint1: CGPoint(x: -11, y: -6.08), controlPoint2: CGPoint(x: -6.08, y: -11))
        secondWheel.addCurveToPoint(CGPoint(x: 11, y: 0), controlPoint1: CGPoint(x: 6.08, y: -11), controlPoint2: CGPoint(x: 11, y: -6.08))
        secondWheel.closePath()
        
        secondWheel.lineWidth = lineWidth
        secondWheel.lineCapStyle = lineCap
        secondWheel.lineJoinStyle = lineJoin
        
        CGContextSaveGState(context)
        CGContextSetLineDash(context, 0, [bikeLine, 100], 2)
        secondWheel.stroke()
        CGContextRestoreGState(context)
        
        CGContextRestoreGState(context)
        
        // Frame
        if two > 0 {
            let framePath = UIBezierPath()
            framePath.moveToPoint(CGPoint(x: 61.5, y: 46.5))
            framePath.addLineToPoint(CGPoint(x: 37.5, y: 46.5))
            framePath.addLineToPoint(CGPoint(x: 53.5, y: 65.5))
            framePath.addLineToPoint(CGPoint(x: 70.5, y: 65.5))
            framePath.addLineToPoint(CGPoint(x: 61.5, y: 46.5))
            framePath.closePath()
            
            framePath.lineWidth = lineWidth
            framePath.lineCapStyle = lineCap
            framePath.lineJoinStyle = lineJoin
            
            CGContextSaveGState(context)
            CGContextSetLineDash(context, 0, [frameLine, 400], 2)
            framePath.stroke()
            CGContextRestoreGState(context)
        }
        
        // Seat and bars
        if three > 0 {
            let bars = UIBezierPath()
            bars.moveToPoint(CGPoint(x: 30.5, y: 63.5))
            bars.addLineToPoint(CGPoint(x: 39.5, y: 41.5))
            bars.addLineToPoint(CGPoint(x: 30.5, y: 41.5))
            
            bars.lineWidth = lineWidth
            bars.lineCapStyle = lineCap
            bars.lineJoinStyle = lineJoin
            
            CGContextSaveGState(context)
            CGContextSetLineDash(context, 0, [barLine, 100], 2)
            bars.stroke()
            CGContextRestoreGState(context)
            
            let seat = UIBezierPath()
            seat.moveToPoint(CGPoint(x: 53.5, y: 65.5))
            seat.addLineToPoint(CGPoint(x: 64.5, y: 38.5))
            seat.addLineToPoint(CGPoint(x: 56.5, y: 38.5))
            
            seat.lineWidth = lineWidth
            seat.lineCapStyle = lineCap
            seat.lineJoinStyle = lineJoin
            
            CGContextSaveGState(context)
            CGContextSetLineDash(context, 0, [seatLine, 100], 2)
            seat.stroke()
            CGContextRestoreGState(context)
        }
        
    }
    
}
