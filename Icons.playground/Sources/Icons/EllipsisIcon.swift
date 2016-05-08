//
//  EllipsisIcon.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 08/05/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

@IBDesignable
public class EllipsisIcon: AnimatedIcon {

    // MARK: - Inspectable properties

    @IBInspectable public var strokeColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var fillColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var magnitude: CGFloat = 10 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var dotSize: CGFloat = 10 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var progress: Bool {
        get {
            return Bool(value)
        }
        set (newValue) {
            value = CGFloat(newValue)
        }
    }

    // MARK: - Drawing methods

    override func draw(time: CGFloat = 0) {

        // General Declarations
        let context = UIGraphicsGetCurrentContext()

        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        CGContextScaleCTM(context, scale, scale)

        fillColor.colorWithAlphaComponent(fillAlpha).setFill()
        strokeColor.setStroke()

        //// Variable Declarations
        let dotOffset: CGFloat = -dotSize / 2.0
        let yOffset: CGFloat = dotOffset + magnitude * sin(time * 360 * CGFloat(M_PI)/180)
        let yCenterOffset: CGFloat = dotOffset + magnitude * sin(1.5 * time * 360 * CGFloat(M_PI)/180)

        //// Dot 1 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 35, 50)

        let dot1Path = UIBezierPath(ovalInRect: CGRect(x: dotOffset, y: yOffset, width: dotSize, height: dotSize))
        dot1Path.lineWidth = lineWidth
        dot1Path.fill()
        dot1Path.stroke()

        CGContextRestoreGState(context)


        //// Dot 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 50, 50)

        let dot2Path = UIBezierPath(ovalInRect: CGRect(x: dotOffset, y: yCenterOffset, width: dotSize, height: dotSize))
        dot2Path.lineWidth = lineWidth
        dot2Path.fill()
        dot2Path.stroke()

        CGContextRestoreGState(context)


        //// Dot 3 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 65, 50)

        let dot3Path = UIBezierPath(ovalInRect: CGRect(x: dotOffset, y: yOffset, width: dotSize, height: dotSize))
        dot3Path.lineWidth = lineWidth
        dot3Path.fill()
        dot3Path.stroke()
        
        CGContextRestoreGState(context)
        
    }
    
}
