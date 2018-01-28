//
//  FingerprintIcon.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 26/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

@IBDesignable
public class FingerprintIcon: AnimatedIcon {

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
        set (newValue) {
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

        // Variable Declarations
        let line1Dash: CGFloat = time * 14
        let line2Dash: CGFloat = time * 13
        let line3Dash: CGFloat = time * 49
        let line4Dash: CGFloat = time * 19
        let line5Dash: CGFloat = time * 53
        let line6Dash: CGFloat = time * 48
        let line7Dash: CGFloat = time * 31
        let line8Dash: CGFloat = time * 20
        let line9Dash: CGFloat = time * 55
        let line10Dash: CGFloat = time * 4
        let line11Dash: CGFloat = time * 6

        strokeColor.setStroke()

        // Bezier 3 Drawing
        let bezier3Path = UIBezierPath(style: self)
        bezier3Path.move(to: CGPoint(x: 66, y: 55.6))
        bezier3Path.addCurve(to: CGPoint(x: 59.9, y: 50.17), controlPoint1: CGPoint(x: 66, y: 55.6), controlPoint2: CGPoint(x: 61.53, y: 54.26))
        bezier3Path.addCurve(to: CGPoint(x: 45.98, y: 42.3), controlPoint1: CGPoint(x: 58.28, y: 46.08), controlPoint2: CGPoint(x: 54.14, y: 40.19))
        bezier3Path.addCurve(to: CGPoint(x: 38.82, y: 47.69), controlPoint1: CGPoint(x: 43.08, y: 43.17), controlPoint2: CGPoint(x: 40.28, y: 44.95))
        bezier3Path.addCurve(to: CGPoint(x: 37.58, y: 57.61), controlPoint1: CGPoint(x: 37.36, y: 50.44), controlPoint2: CGPoint(x: 36.75, y: 54.6))
        bezier3Path.addCurve(to: CGPoint(x: 34.93, y: 65.68), controlPoint1: CGPoint(x: 38.99, y: 62.72), controlPoint2: CGPoint(x: 37.52, y: 64.84))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line9Dash, 300])
        bezier3Path.stroke()
        context.restoreGState()


        // Bezier 4 Drawing
        let bezier4Path = UIBezierPath(style: self)
        bezier4Path.move(to: CGPoint(x: 37.05, y: 69.57))
        bezier4Path.addCurve(to: CGPoint(x: 41.82, y: 55.64), controlPoint1: CGPoint(x: 41.75, y: 68.04), controlPoint2: CGPoint(x: 43.72, y: 64.65))
        bezier4Path.addCurve(to: CGPoint(x: 46.98, y: 45.96), controlPoint1: CGPoint(x: 40.93, y: 51.42), controlPoint2: CGPoint(x: 42.98, y: 47.15))
        bezier4Path.addCurve(to: CGPoint(x: 56.29, y: 51.32), controlPoint1: CGPoint(x: 50.97, y: 44.77), controlPoint2: CGPoint(x: 55.15, y: 47.16))
        bezier4Path.addCurve(to: CGPoint(x: 64.48, y: 60.26), controlPoint1: CGPoint(x: 56.83, y: 53.54), controlPoint2: CGPoint(x: 58.85, y: 56.94))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line5Dash, 300])
        bezier4Path.stroke()
        context.restoreGState()


        // Bezier 5 Drawing
        let bezier5Path = UIBezierPath(style: self)
        bezier5Path.move(to: CGPoint(x: 61.43, y: 67.24))
        bezier5Path.addCurve(to: CGPoint(x: 49.06, y: 53.48), controlPoint1: CGPoint(x: 59.7, y: 65.45), controlPoint2: CGPoint(x: 50.86, y: 60))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line4Dash, 300])
        bezier5Path.stroke()
        context.restoreGState()


        // Bezier 7 Drawing
        let bezier7Path = UIBezierPath(style: self)
        bezier7Path.move(to: CGPoint(x: 45.67, y: 62.59))
        bezier7Path.addCurve(to: CGPoint(x: 41.86, y: 73.45), controlPoint1: CGPoint(x: 46.57, y: 65.52), controlPoint2: CGPoint(x: 44.88, y: 72.43))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line2Dash, 300])
        bezier7Path.stroke()
        context.restoreGState()


        // Bezier 8 Drawing
        let bezier8Path = UIBezierPath(style: self)
        bezier8Path.move(to: CGPoint(x: 33.12, y: 53.48))
        bezier8Path.addCurve(to: CGPoint(x: 48.58, y: 37.83), controlPoint1: CGPoint(x: 33.12, y: 44.83), controlPoint2: CGPoint(x: 40.04, y: 37.83))
        bezier8Path.addCurve(to: CGPoint(x: 67.06, y: 51.63), controlPoint1: CGPoint(x: 61.38, y: 37.83), controlPoint2: CGPoint(x: 60.86, y: 49.84))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line6Dash, 300])
        bezier8Path.stroke()
        context.restoreGState()


        // Bezier 9 Drawing
        let bezier9Path = UIBezierPath(style: self)
        bezier9Path.move(to: CGPoint(x: 33.12, y: 56.63))
        bezier9Path.addCurve(to: CGPoint(x: 34.06, y: 61.37), controlPoint1: CGPoint(x: 33.12, y: 58.75), controlPoint2: CGPoint(x: 34.06, y: 61.37))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line11Dash, 300])
        bezier9Path.stroke()
        context.restoreGState()


        // Bezier 10 Drawing
        let bezier10Path = UIBezierPath(style: self)
        bezier10Path.move(to: CGPoint(x: 62.19, y: 39.28))
        bezier10Path.addCurve(to: CGPoint(x: 48.67, y: 33.37), controlPoint1: CGPoint(x: 61.19, y: 37.57), controlPoint2: CGPoint(x: 56.5, y: 33.37))
        bezier10Path.addCurve(to: CGPoint(x: 34.9, y: 39.28), controlPoint1: CGPoint(x: 40.85, y: 33.37), controlPoint2: CGPoint(x: 35.9, y: 37.57))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line7Dash, 300])
        bezier10Path.stroke()
        context.restoreGState()


        // Bezier 11 Drawing
        let bezier11Path = UIBezierPath(style: self)
        bezier11Path.move(to: CGPoint(x: 39.13, y: 31.46))
        bezier11Path.addCurve(to: CGPoint(x: 48.57, y: 29.28), controlPoint1: CGPoint(x: 39.13, y: 31.46), controlPoint2: CGPoint(x: 42.77, y: 29.28))
        bezier11Path.addCurve(to: CGPoint(x: 57.96, y: 31.46), controlPoint1: CGPoint(x: 54.75, y: 29.28), controlPoint2: CGPoint(x: 57.96, y: 31.46))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line8Dash, 300])
        bezier11Path.stroke()
        context.restoreGState()


        // Bezier 12 Drawing
        let bezier12Path = UIBezierPath(style: self)
        bezier12Path.move(to: CGPoint(x: 64.48, y: 42.8))
        bezier12Path.addCurve(to: CGPoint(x: 66.36, y: 46.58), controlPoint1: CGPoint(x: 64.48, y: 42.8), controlPoint2: CGPoint(x: 65.89, y: 45.05))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line10Dash, 300])
        bezier12Path.stroke()
        context.restoreGState()


        // Bez 1 Drawing
        let bez1Path = UIBezierPath(style: self)
        bez1Path.move(to: CGPoint(x: 62.95, y: 64.14))
        bez1Path.addCurve(to: CGPoint(x: 52.68, y: 52.4), controlPoint1: CGPoint(x: 58.31, y: 60.43), controlPoint2: CGPoint(x: 54.11, y: 57.47))
        bez1Path.addCurve(to: CGPoint(x: 48.02, y: 49.72), controlPoint1: CGPoint(x: 52.1, y: 50.32), controlPoint2: CGPoint(x: 50.02, y: 49.12))
        bez1Path.addCurve(to: CGPoint(x: 45.44, y: 54.56), controlPoint1: CGPoint(x: 46.02, y: 50.32), controlPoint2: CGPoint(x: 44.87, y: 52.48))
        bez1Path.addCurve(to: CGPoint(x: 58.38, y: 70.34), controlPoint1: CGPoint(x: 47.06, y: 60.4), controlPoint2: CGPoint(x: 52.82, y: 65.77))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line3Dash, 300])
        bez1Path.stroke()
        context.restoreGState()


        // Bezier 6 Drawing
        let bezier6Path = UIBezierPath(style: self)
        bezier6Path.move(to: CGPoint(x: 55.33, y: 73.45))
        bezier6Path.addCurve(to: CGPoint(x: 50, y: 68.79), controlPoint1: CGPoint(x: 54.37, y: 72.45), controlPoint2: CGPoint(x: 52.47, y: 68.79))
        bezier6Path.addCurve(to: CGPoint(x: 47.71, y: 75), controlPoint1: CGPoint(x: 47.53, y: 68.79), controlPoint2: CGPoint(x: 47.71, y: 75))

        context.saveGState()
        context.setLineDash(phase: 0, lengths: [line1Dash, 300])
        bezier6Path.stroke()
        context.restoreGState()

    }

}
