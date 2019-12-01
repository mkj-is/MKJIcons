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

    @IBInspectable public var burgerColor: UIColor = .iconDefault {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var crossColor: UIColor = .iconRedColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var open: Bool {
        get {
            return Bool(value)
        }
        set {
            value = CGFloat(newValue)
        }
    }

    // MARK: - Drawing methods

    override func draw(time: CGFloat = 0) {

        let offset: CGFloat = 5

        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        context.clear(CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))

        let currentColor = UIColor(between: burgerColor, and: crossColor, using: colorMode, ratio: time)

        // Variable Declarations
        let angle: CGFloat = time * 45
        let negativeAngle: CGFloat = -angle
        let localScale: CGFloat = 1 + time * 0.414
        let opacity = UIColor(red: burgerColor.red, green: burgerColor.green, blue: burgerColor.blue, alpha: burgerColor.alpha - time * burgerColor.alpha)
        let timedOffset: CGFloat = time * offset
        let negativeTimedOffset: CGFloat = -timedOffset
        let timeLineWidth: CGFloat = scaledLineWidth / localScale

        context.scaleBy(x: scale, y: scale)

        // Bottom Drawing
        context.saveGState()
        context.translateBy(x: 30, y: (timedOffset + 65))
        context.rotate(by: -angle * .pi / 180)
        context.scaleBy(x: localScale, y: localScale)

        let bottomPath = UIBezierPath(style: self)
        bottomPath.move(to: CGPoint(x: 40, y: 0))
        bottomPath.addLine(to: CGPoint(x: 0, y: 0))

        currentColor.setStroke()
        bottomPath.lineWidth = timeLineWidth
        bottomPath.stroke()

        context.restoreGState()

        // Middle Drawing
        context.saveGState()
        context.translateBy(x: 50, y: 50)

        let middlePath = UIBezierPath(style: self)
        middlePath.move(to: CGPoint(x: 20, y: 0))
        middlePath.addLine(to: CGPoint(x: -20, y: 0))

        opacity.setStroke()
        middlePath.stroke()

        context.restoreGState()

        // Top Drawing
        context.saveGState()
        context.translateBy(x: 30, y: (negativeTimedOffset + 35))
        context.rotate(by: -negativeAngle * .pi / 180)
        context.scaleBy(x: localScale, y: localScale)

        let topPath = UIBezierPath(style: self)
        topPath.move(to: CGPoint(x: 40, y: 0))
        topPath.addLine(to: CGPoint(x: 0, y: 0))

        currentColor.setStroke()
        topPath.lineWidth = timeLineWidth
        topPath.stroke()

        context.restoreGState()
    }

}
