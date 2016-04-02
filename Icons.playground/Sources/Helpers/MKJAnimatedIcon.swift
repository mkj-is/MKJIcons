import UIKit

@IBDesignable
public class MKJAnimatedIcon: UIView {
    
    @IBInspectable public var duration = 0.4
    @IBInspectable public var strokeWidth: CGFloat = 2.0
    @IBInspectable public var colorAnimationMode: UIColorMode = .HSB
    
    let maximumAnimationValue: CGFloat = 1.0
    
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
        draw((layer as! MKJAnimationLayer).value)
        UIGraphicsPopContext()
    }
    
    func draw(time: CGFloat = 0) {
        fatalError("Method must be overriden in subclasses. Do not instantiate this class directly.")
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
    
}
