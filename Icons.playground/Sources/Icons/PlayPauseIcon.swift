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

    // MARK: - Inspectable properties

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

    @IBInspectable public var playing: Bool {
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

        let strokeColor = UIColor(between: playColor, and: pauseColor, using: colorMode, ratio: time)
        strokeColor.setStroke()

        let fillColor = strokeColor.withAlphaComponent(fillAlpha)
        fillColor.setFill()

        // Variable Declarations
        let invertedTime: CGFloat = 1 - time
        let offsetX: CGFloat = width / 2.0
        let offsetMinusX: CGFloat = -width / 2.0
        let offsetY: CGFloat = height / 2.0
        let decreasingOffset: CGFloat = offsetY * time
        let decreasingMinusOffset: CGFloat = -decreasingOffset
        let offsetMinusY: CGFloat = -height / 2.0
        let topPoint = CGPoint(x: offsetX + height / 2.0 * invertedTime, y: -offsetY * time)
        let bottomPoint = CGPoint(x: offsetX + height / 2.0 * invertedTime, y: -offsetMinusY * time)

        context.scaleBy(x: scale, y: scale)

        // Right line Drawing
        if time > 0 {
            context.saveGState()
            context.translateBy(x: 60, y: 50)

            let rightLinePath = UIBezierPath(style: self)
            rightLinePath.move(to: CGPoint(x: offsetMinusX, y: decreasingOffset))
            rightLinePath.addLine(to: CGPoint(x: offsetX, y: decreasingOffset))
            rightLinePath.addLine(to: CGPoint(x: offsetX, y: decreasingMinusOffset))
            rightLinePath.addLine(to: CGPoint(x: offsetMinusX, y: decreasingMinusOffset))
            rightLinePath.addLine(to: CGPoint(x: offsetMinusX, y: decreasingOffset))
            rightLinePath.close()

            rightLinePath.stroke()
            rightLinePath.fill()

            context.restoreGState()
        }

        // Left line Drawing
        context.saveGState()
        context.translateBy(x: 40, y: 50)

        let leftLinePath = UIBezierPath(style: self)
        leftLinePath.move(to: CGPoint(x: offsetMinusX, y: offsetY))
        leftLinePath.addLine(to: bottomPoint)
        leftLinePath.addLine(to: topPoint)
        leftLinePath.addLine(to: CGPoint(x: offsetMinusX, y: offsetMinusY))
        leftLinePath.addLine(to: CGPoint(x: offsetMinusX, y: offsetY))
        leftLinePath.close()

        leftLinePath.stroke()
        leftLinePath.fill()

        context.restoreGState()
    }

}
