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

    @IBInspectable public var strokeColor: UIColor = .white {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var fillColor: UIColor = .white {
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
        set {
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

        fillColor.withAlphaComponent(fillAlpha).setFill()
        strokeColor.setStroke()

        //// Variable Declarations
        let dotOffset: CGFloat = -dotSize / 2.0
        let yOffset: CGFloat = dotOffset + magnitude * sin(time * 360 * .pi / 180)
        let yCenterOffset: CGFloat = dotOffset + magnitude * sin(1.5 * time * 360 * .pi/180)

        //// Dot 1 Drawing
        context.saveGState()
        context.translateBy(x: 35, y: 50)

        let dot1Path = UIBezierPath(ovalIn: CGRect(x: dotOffset, y: yOffset, width: dotSize, height: dotSize))
        dot1Path.lineWidth = lineWidth
        dot1Path.fill()
        dot1Path.stroke()

        context.restoreGState()

        //// Dot 2 Drawing
        context.saveGState()
        context.translateBy(x: 50, y: 50)

        let dot2Path = UIBezierPath(ovalIn: CGRect(x: dotOffset, y: yCenterOffset, width: dotSize, height: dotSize))
        dot2Path.lineWidth = lineWidth
        dot2Path.fill()
        dot2Path.stroke()

        context.restoreGState()

        //// Dot 3 Drawing
        context.saveGState()
        context.translateBy(x: 65, y: 50)

        let dot3Path = UIBezierPath(ovalIn: CGRect(x: dotOffset, y: yOffset, width: dotSize, height: dotSize))
        dot3Path.lineWidth = lineWidth
        dot3Path.fill()
        dot3Path.stroke()

        context.restoreGState()

    }

}
