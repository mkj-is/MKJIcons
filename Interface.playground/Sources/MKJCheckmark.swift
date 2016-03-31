//
//  MKJCheckmark.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class MKJCheckmark: UIView {
    
    @IBInspectable public var checkmarkColor = UIColor.greenColor()
    @IBInspectable public var crossColor = UIColor.redColor()
    @IBInspectable public var strokeWidth: CGFloat = 2.0
    
    @IBInspectable public var duration = 0.4
    
    let maximumAnimationValue: CGFloat = 100.0
    
    @IBInspectable public var checked = false {
        willSet {
            
            if newValue != checked
            {
                animateTo(checked ? maximumAnimationValue : 0.0)
            }
        }
    }
    
    public func animateTo(goal: CGFloat) {

        let timing: CAMediaTimingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        let animation = CABasicAnimation(keyPath: "value")
        animation.duration = duration
        animation.fillMode = kCAFillModeBoth
        animation.timingFunction = timing
        animation.fromValue = (layer as! MKJAnimationLayer).value
        animation.toValue = goal
        layer.addAnimation(animation, forKey: nil)
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        (layer as! MKJAnimationLayer).value = goal
        CATransaction.commit()
    }
    
    override public class func layerClass() -> AnyClass
    {
        return MKJAnimationLayer.self
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        layer.setNeedsDisplay()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.setNeedsDisplay()
    }
    
    override public func drawLayer(layer: CALayer, inContext ctx: CGContext)
    {
        UIGraphicsPushContext(ctx)
        drawCheckmark(time: (layer as! MKJAnimationLayer).value)
        UIGraphicsPopContext()
    }
    
    func drawCheckmark(time time: CGFloat = 0) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        // Calculate color
        let r = crossColor.red + (checkmarkColor.red - crossColor.red) / maximumAnimationValue * time
        let g = crossColor.green + (checkmarkColor.green - crossColor.green) / maximumAnimationValue * time
        let b = crossColor.blue + (checkmarkColor.blue - crossColor.blue) / maximumAnimationValue * time
        let a = crossColor.alpha + (checkmarkColor.alpha - crossColor.alpha) / maximumAnimationValue * time
        
        let currentColor = UIColor(red: r, green: g, blue: b, alpha: a)
        
        
        //// Variable Declarations
        let phase: CGFloat = -time * 1.11
        let dash: CGFloat = 57 - time / 100.0 / 2.0 * 57
        
        //// Static line Drawing
        let staticLinePath = UIBezierPath()
        staticLinePath.moveToPoint(CGPoint(x: 70, y: 30))
        staticLinePath.addLineToPoint(CGPoint(x: 30, y: 70))
        staticLinePath.lineCapStyle = .Square;
        
        currentColor.setStroke()
        staticLinePath.lineWidth = strokeWidth
        staticLinePath.stroke()
        
        
        //// Animated line Drawing
        let animatedLinePath = UIBezierPath()
        animatedLinePath.moveToPoint(CGPoint(x: 30, y: 30))
        animatedLinePath.addCurveToPoint(CGPoint(x: 70, y: 70), controlPoint1: CGPoint(x: 30, y: 30), controlPoint2: CGPoint(x: 56.58, y: 56.58))
        animatedLinePath.addCurveToPoint(CGPoint(x: 30, y: 70), controlPoint1: CGPoint(x: 83.42, y: 83.42), controlPoint2: CGPoint(x: 46.03, y: 86.03))
        animatedLinePath.addCurveToPoint(CGPoint(x: 10, y: 50), controlPoint1: CGPoint(x: 13.97, y: 53.97), controlPoint2: CGPoint(x: 10, y: 50))
        animatedLinePath.lineCapStyle = .Square;
        
        animatedLinePath.lineWidth = strokeWidth
        CGContextSaveGState(context)
        CGContextSetLineDash(context, phase, [dash, 200], 2)
        animatedLinePath.stroke()
        CGContextRestoreGState(context)
    }
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        checked = !checked
    }
    
    
}
