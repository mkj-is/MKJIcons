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

        let strokeColor = UIColor(between: happyColor, and: sadColor, using: colorMode, ratio: time)
        strokeColor.setStroke()
        let fillColor = strokeColor.withAlphaComponent(fillAlpha)
        fillColor.setFill()

        // Variable Declarations
        let minusHalfLineWidth: CGFloat = -scaledLineWidth / 2.0
        let eyeOffset: CGFloat = -eyeMovement / 2.0 + eyeMovement * time
        let lipY: CGFloat = -mouthMovement / 2.0 + time * mouthMovement

        context.translateBy(x: 50, y: 50)

        // Face Drawing
        if showFace {
            let facePath = UIBezierPath(ovalIn: CGRect(x: -20, y: -20, width: 40, height: 40))
            facePath.lineWidth = scaledLineWidth
            facePath.stroke()
            facePath.fill()
        }

        strokeColor.setFill()

        // Right eye Drawing
        context.saveGState()
        context.translateBy(x: -8, y: (eyeOffset - 9))

        let rightEyePath = UIBezierPath(ovalIn: CGRect(x: minusHalfLineWidth, y: minusHalfLineWidth, width: scaledLineWidth, height: scaledLineWidth))
        rightEyePath.fill()

        context.restoreGState()


        // Left eye Drawing
        context.saveGState()
        context.translateBy(x: 8, y: (eyeOffset - 9))

        let leftEyePath = UIBezierPath(ovalIn: CGRect(x: minusHalfLineWidth, y: minusHalfLineWidth, width: scaledLineWidth, height: scaledLineWidth))
        leftEyePath.fill()

        context.restoreGState()


        // Bezier Drawing
        context.saveGState()
        context.translateBy(x: 0, y: 5)

        let mouthPath = UIBezierPath(style: self)
        mouthPath.move(to: CGPoint(x: -10, y: lipY))
        mouthPath.addCurve(to: CGPoint(x: 0, y: 0), controlPoint1: CGPoint(x: -10, y: lipY), controlPoint2: CGPoint(x: -7, y: 0))
        mouthPath.addCurve(to: CGPoint(x: 10, y: lipY), controlPoint1: CGPoint(x: 7, y: -0), controlPoint2: CGPoint(x: 10, y: lipY))

        mouthPath.stroke()

    }

}
