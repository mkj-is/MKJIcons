//
//  StarIcon.swift
//
//
//  Created by Matěj Jirásek on 15/04/16.
//
//

import UIKit

@IBDesignable
public class StarIcon: AnimatedIcon {

    // MARK: - Inspectable properties

    @IBInspectable public var strokeColor: UIColor = .iconOrangeColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var fillColor: UIColor = .iconOrangeColor {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var doubleLines: Bool = true {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var animationInsideDirection: Bool = true {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var animationCenteredOnCorners: Bool = true {
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

        // Variable Declarations
        let lineLength: CGFloat = 18.2
        let dash: CGFloat = time * lineLength
        let doubleDash: CGFloat = 2 * dash
        let outerPhase: CGFloat = dash
        let gap: CGFloat = (1 - time) * lineLength
        let doubleGap: CGFloat = 2 * gap
        let innerPhase: CGFloat = lineLength + dash
        let varyingGap: CGFloat = doubleLines ? doubleGap : gap
        let varyingDash: CGFloat = doubleLines ? doubleDash : dash
        let inOutPhase = animationInsideDirection ? outerPhase : innerPhase
        let linePhase = animationInsideDirection ? 0 : lineLength

        context.scaleBy(x: scale, y: scale)

        // Path Drawing
        let path = UIBezierPath(style: self)
        path.move(to: CGPoint(x: 50, y: 27.15))
        path.addLine(to: CGPoint(x: 55.58, y: 44.46))
        path.addLine(to: CGPoint(x: 73.78, y: 44.42))
        path.addLine(to: CGPoint(x: 59.04, y: 55.09))
        path.addLine(to: CGPoint(x: 64.69, y: 72.38))
        path.addLine(to: CGPoint(x: 50, y: 61.65))
        path.addLine(to: CGPoint(x: 35.31, y: 72.38))
        path.addLine(to: CGPoint(x: 40.96, y: 55.09))
        path.addLine(to: CGPoint(x: 26.22, y: 44.42))
        path.addLine(to: CGPoint(x: 44.42, y: 44.46))
        path.close()

        strokeColor.setStroke()
        fillColor.withAlphaComponent(time * fillAlpha).setFill()

        context.saveGState()

        if time < 1 {
            let calculatedDash = animationCenteredOnCorners ? doubleDash : varyingDash
            let calculatedGap = animationCenteredOnCorners ? doubleGap : varyingGap
            context.setLineDash(phase: animationCenteredOnCorners ? inOutPhase : linePhase, lengths: [
                calculatedDash < 0 ? 0 : calculatedDash,
                calculatedGap < 0 ? 0 : calculatedGap
            ])
        }
        path.fill()
        path.stroke()
        context.restoreGState()

    }

}
