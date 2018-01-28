//
//  SoundwaveIcon.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 27/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

@IBDesignable
public class SoundwaveIcon: AnimatedIcon {

    // MARK: - Inspectable properties

    @IBInspectable public var strokeColor: UIColor = UIColor.iconOrangeColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var lineCount: UInt = 9 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var sinLineLength: CGFloat = 14 {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var multiplier: CGFloat = 4 {
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

    // MARK: - Helper properties
    var baseLineLength: CGFloat {
        get {
            return 20 - sinLineLength
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

        // Draw lines

        let spaces: CGFloat = CGFloat(lineCount) - 1
        let pi = CGFloat.pi
        let baseLength = (size / 2 - sinLineLength) * 2.0
        let offset = (100 - size) / 2

        for i in 0...lineCount {

            let iterator = CGFloat(i)
            let x: CGFloat = offset + size / spaces * iterator
            let y: CGFloat = offset + (1 - sin((time + iterator / spaces) * multiplier * pi)) / 2.0 * sinLineLength
            let length: CGFloat = baseLength + (1 + sin((time + iterator / spaces) * multiplier * pi)) * sinLineLength

            // Bezier Drawing
            context.saveGState()
            context.translateBy(x: x, y: y)

            let bezierPath = UIBezierPath(style: self)
            bezierPath.move(to: CGPoint.zero)
            bezierPath.addLine(to: CGPoint(x: 0, y: length))

            bezierPath.stroke()

            context.restoreGState()
        }

    }

}
