//
//  PaperclipIcon.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 27/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

@IBDesignable
public class PaperclipIcon: AnimatedIcon {

    // MARK: - Inspectable properties

    @IBInspectable public var strokeColor: UIColor = .white {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var visible: Bool {
        get {
            return Bool(value)
        }
        set {
            value = CGFloat(newValue)
        }
    }

    // MARK: - Drawing methods

    override func draw(time: CGFloat = 0) {
        guard time > 0, let context = UIGraphicsGetCurrentContext() else {
            return
        }

        context.clear(CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        context.scaleBy(x: scale, y: scale)

        strokeColor.setStroke()

        // Bezier Drawing
        let bezierPath = UIBezierPath(style: self)
        bezierPath.move(to: CGPoint(x: 41.28, y: 51.66))
        bezierPath.addCurve(to: CGPoint(x: 55, y: 37.44), controlPoint1: CGPoint(x: 43.98, y: 48.87), controlPoint2: CGPoint(x: 52.76, y: 39.57))
        bezierPath.addCurve(to: CGPoint(x: 60.49, y: 35.61), controlPoint1: CGPoint(x: 56.56, y: 35.96), controlPoint2: CGPoint(x: 58.52, y: 35.22))
        bezierPath.addCurve(to: CGPoint(x: 62.91, y: 45.52), controlPoint1: CGPoint(x: 65.06, y: 36.5), controlPoint2: CGPoint(x: 65.93, y: 42.4))
        bezierPath.addCurve(to: CGPoint(x: 60.59, y: 47.93), controlPoint1: CGPoint(x: 62.14, y: 46.33), controlPoint2: CGPoint(x: 61.36, y: 47.12))
        bezierPath.addCurve(to: CGPoint(x: 49.5, y: 59.4), controlPoint1: CGPoint(x: 56.89, y: 51.75), controlPoint2: CGPoint(x: 53.19, y: 55.58))
        bezierPath.addCurve(to: CGPoint(x: 40.98, y: 67.43), controlPoint1: CGPoint(x: 46.98, y: 62), controlPoint2: CGPoint(x: 44.25, y: 65.79))
        bezierPath.addCurve(to: CGPoint(x: 29.39, y: 64.15), controlPoint1: CGPoint(x: 36.92, y: 69.48), controlPoint2: CGPoint(x: 31.79, y: 68.2))
        bezierPath.addCurve(to: CGPoint(x: 30.96, y: 52.38), controlPoint1: CGPoint(x: 27.17, y: 60.39), controlPoint2: CGPoint(x: 28, y: 55.44))
        bezierPath.addCurve(to: CGPoint(x: 48.95, y: 33.76), controlPoint1: CGPoint(x: 36.95, y: 46.17), controlPoint2: CGPoint(x: 42.95, y: 39.97))
        bezierPath.addCurve(to: CGPoint(x: 52.73, y: 30.4), controlPoint1: CGPoint(x: 50.14, y: 32.54), controlPoint2: CGPoint(x: 51.28, y: 31.31))
        bezierPath.addCurve(to: CGPoint(x: 64.59, y: 29.62), controlPoint1: CGPoint(x: 56.28, y: 28.18), controlPoint2: CGPoint(x: 60.81, y: 27.82))
        bezierPath.addCurve(to: CGPoint(x: 67.67, y: 50.58), controlPoint1: CGPoint(x: 72.55, y: 33.41), controlPoint2: CGPoint(x: 73.63, y: 44.42))
        bezierPath.addCurve(to: CGPoint(x: 50.09, y: 68.77), controlPoint1: CGPoint(x: 61.81, y: 56.65), controlPoint2: CGPoint(x: 55.95, y: 62.71))

        context.setLineDash(phase: 0, lengths: [188 * time, 200])
        bezierPath.stroke()

    }

}
