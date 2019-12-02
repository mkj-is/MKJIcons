//
//  Checkmark.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class PlayStopIcon: AnimatedIcon {

    // MARK: - Inspectable properties

    @IBInspectable public var size: CGFloat = 40 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var playColor: UIColor = .iconLightGreenColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var stopColor: UIColor = .iconRedColor {
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

        let strokeColor = UIColor(between: playColor, and: stopColor, using: colorMode, ratio: time)
        strokeColor.setStroke()

        let fillColor = strokeColor.withAlphaComponent(fillAlpha)
        fillColor.setFill()

        // Variable Declarations
        let halfSize = size / 2.0

        context.scaleBy(x: scale, y: scale)

        // Left line Drawing
        context.saveGState()
        context.translateBy(x: 50, y: 50)

        let leftLinePath = UIBezierPath(style: self)
        leftLinePath.move(to: CGPoint(x: -halfSize, y: halfSize))
        leftLinePath.addLine(to: CGPoint(x: halfSize, y: halfSize * time))
        leftLinePath.addLine(to: CGPoint(x: halfSize, y: -halfSize * time))
        leftLinePath.addLine(to: CGPoint(x: -halfSize, y: -halfSize))
        leftLinePath.addLine(to: CGPoint(x: -halfSize, y: halfSize))
        leftLinePath.close()

        leftLinePath.stroke()
        leftLinePath.fill()

        context.restoreGState()
    }

}
