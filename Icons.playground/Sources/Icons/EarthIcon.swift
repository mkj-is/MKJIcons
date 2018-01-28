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

    @IBInspectable public var fillColor: UIColor = UIColor.iconLightGreenColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var latitudeCount: UInt = 6 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var longitudeCount: UInt = 10 {
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
            return Bool(value)
        }
        set (newValue) {
            value = CGFloat(newValue)
        }
    }

    // MARK: - Drawing methods

    override func draw(time: CGFloat = 0) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        context.clear(CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        context.scaleBy(x: scale, y: scale)

        strokeColor.setStroke()
        fillColor.withAlphaComponent(fillAlpha).setFill()

        context.saveGState()
        context.translateBy(x: 50, y: 50)

        // Circle Drawing

        let circlePath = UIBezierPath(ovalIn: CGRect(x: -20, y: -20, width: 40, height: 40))
        circlePath.lineWidth = lineWidth
        circlePath.stroke()
        circlePath.fill()

        // Draw longitudes
        for i in 0...longitudeCount {

            let delayedTime = -time + (CGFloat(i) / CGFloat(longitudeCount)) * 2
            let offset = delayedTime.constrain(low: 0, high: 1)

            let linePosition: CGFloat = offset.map(min: 0, max: 1, from: 20, to: -20)
            let controlPointPosition: CGFloat = offset.map(min: 0, max: 1, from: 11, to: -11)

            let longitudePath = UIBezierPath(style: self)
            longitudePath.move(to: CGPoint(x: 0, y: -20))
            longitudePath.addCurve(to: CGPoint(x: linePosition, y: 0), controlPoint1: CGPoint(x: controlPointPosition, y: -20), controlPoint2: CGPoint(x: linePosition, y: -11.05))
            longitudePath.addCurve(to: CGPoint(x: 0, y: 20), controlPoint1: CGPoint(x: linePosition, y: 11.05), controlPoint2: CGPoint(x: controlPointPosition, y: 20))

            longitudePath.stroke()

        }

        // Draw latitudes
        let pi: CGFloat = .pi

        for i in 0...latitudeCount {

            let i = CGFloat(i)
            let count = CGFloat(latitudeCount)

            let y = i.map(min: 0, max: count, from: -size / 2.0, to: size / 2.0)
            let x = sin(i/count * pi) * size / 2

            let latitudePath = UIBezierPath(style: self)
            latitudePath.move(to: CGPoint(x: -x, y: y))
            latitudePath.addLine(to: CGPoint(x: x, y: y))
            latitudePath.stroke()
        }

    }

}
