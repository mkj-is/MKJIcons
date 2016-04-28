//
//  EarthIcon.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 28/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

@IBDesignable
public class EarthIcon: AnimatedIcon {
    
    // MARK: - Inspectable properties
    
    @IBInspectable public var strokeColor: UIColor = UIColor.iconLightGreenColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var latitudeCount: Int = 6 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var longitudeCount: Int = 10 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var size: CGFloat = 40 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var progress: Bool {
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
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        CGContextScaleCTM(context, scale, scale)
        
        strokeColor.setStroke()
        
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 50, 50)
        
        //// Circle Drawing
        
        let circlePath = UIBezierPath(ovalInRect: CGRect(x: -20, y: -20, width: 40, height: 40))
        circlePath.lineWidth = lineWidth
        circlePath.stroke()
        
        // Draw longitudes
        for i in 0...longitudeCount {
            
            let delayedTime = -time + (CGFloat(i) / CGFloat(longitudeCount)) * 2
            let offset = delayedTime.cut(from: 0, to: 1)

            let linePosition: CGFloat = offset.map(min: 0, max: 1, from: 20, to: -20)
            let controlPointPosition: CGFloat = offset.map(min: 0, max: 1, from: 11, to: -11)
            
            let longitudePath = UIBezierPath(style: self)
            longitudePath.moveToPoint(CGPoint(x: 0, y: -20))
            longitudePath.addCurveToPoint(CGPoint(x: linePosition, y: 0), controlPoint1: CGPoint(x: controlPointPosition, y: -20), controlPoint2: CGPoint(x: linePosition, y: -11.05))
            longitudePath.addCurveToPoint(CGPoint(x: 0, y: 20), controlPoint1: CGPoint(x: linePosition, y: 11.05), controlPoint2: CGPoint(x: controlPointPosition, y: 20))

            longitudePath.stroke()
            
        }
        
        // Draw latitudes
        let pi = CGFloat(M_PI)
        
        for i in 0...latitudeCount {
            
            let i = CGFloat(i)
            let count = CGFloat(latitudeCount)
            
            let y = i.map(min: 0, max: count, from: -size / 2.0, to: size / 2.0)
            let x = sin(i/count * pi) * size / 2
            
            let latitudePath = UIBezierPath(style: self)
            latitudePath.moveToPoint(CGPoint(x: -x, y: y))
            latitudePath.addLineToPoint(CGPoint(x: x, y: y))
            latitudePath.stroke()
        }
        
    }
    
}