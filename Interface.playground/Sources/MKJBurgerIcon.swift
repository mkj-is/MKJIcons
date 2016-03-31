//
//  MKJBurgerIcon.swift
//
//
//  Created by Matěj Jirásek on 31/03/16.
//
//

import UIKit

@IBDesignable
public class MKJBurgerIcon: UIView {
    
    @IBInspectable public var burgerColor = UIColor.whiteColor()
    @IBInspectable public var crossColor = UIColor.redColor()
    @IBInspectable public var strokeWidth: CGFloat = 2.0
    
    @IBInspectable public var duration = 0.4
    
    let maximumAnimationValue: CGFloat = 1.0
    
    @IBInspectable public var open = false {
        willSet {
            
            if newValue != open
            {
                animateTo(open ? 0.0 : maximumAnimationValue)
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
        drawIcon(time: (layer as! MKJAnimationLayer).value)
        UIGraphicsPopContext()
    }
    
    func drawIcon(time time: CGFloat = 0) {
        
        let offset: CGFloat = 5
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        CGContextClearRect(context, CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        // Calculate color
        let r = burgerColor.red + (crossColor.red - burgerColor.red) / maximumAnimationValue * time
        let g = burgerColor.green + (crossColor.green - burgerColor.green) / maximumAnimationValue * time
        let b = burgerColor.blue + (crossColor.blue - burgerColor.blue) / maximumAnimationValue * time
        let a = burgerColor.alpha + (crossColor.alpha - burgerColor.alpha) / maximumAnimationValue * time
        
        let currentColor = UIColor(red: r, green: g, blue: b, alpha: a)
        
        //// Variable Declarations
        let angle: CGFloat = time * 45
        let negativeAngle: CGFloat = -angle
        let scale: CGFloat = 1 + time * 0.414
        let opacity = UIColor(red: burgerColor.red, green: burgerColor.green, blue: burgerColor.blue, alpha: burgerColor.alpha - time * burgerColor.alpha)
        let timedOffset: CGFloat = time * offset
        let negativeTimedOffset: CGFloat = -timedOffset
        let timeLineWidth: CGFloat = strokeWidth / scale
        
        //// Bottom Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 30, (timedOffset + 65))
        CGContextRotateCTM(context, -angle * CGFloat(M_PI) / 180)
        CGContextScaleCTM(context, scale, scale)
        
        let bottomPath = UIBezierPath()
        bottomPath.moveToPoint(CGPoint(x: 40, y: 0))
        bottomPath.addLineToPoint(CGPoint(x: 0, y: 0))
        bottomPath.lineCapStyle = .Square;
        
        currentColor.setStroke()
        bottomPath.lineWidth = timeLineWidth
        bottomPath.stroke()
        
        CGContextRestoreGState(context)
        
        
        //// Middle Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 50, 50)
        
        let middlePath = UIBezierPath()
        middlePath.moveToPoint(CGPoint(x: 20, y: 0))
        middlePath.addLineToPoint(CGPoint(x: -20, y: 0))
        middlePath.lineCapStyle = .Square;
        
        opacity.setStroke()
        middlePath.lineWidth = strokeWidth
        middlePath.stroke()
        
        CGContextRestoreGState(context)
        
        
        //// Top Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 30, (negativeTimedOffset + 35))
        CGContextRotateCTM(context, -negativeAngle * CGFloat(M_PI) / 180)
        CGContextScaleCTM(context, scale, scale)
        
        let topPath = UIBezierPath()
        topPath.moveToPoint(CGPoint(x: 40, y: 0))
        topPath.addLineToPoint(CGPoint(x: 0, y: 0))
        topPath.lineCapStyle = .Square;
        
        currentColor.setStroke()
        topPath.lineWidth = timeLineWidth
        topPath.stroke()
        
        CGContextRestoreGState(context)
    }

    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        open = !open
    }
    
    
}
