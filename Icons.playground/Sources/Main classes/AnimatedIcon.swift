import UIKit

@IBDesignable
public class AnimatedIcon: UIControl {
    
    @IBInspectable public var duration = 0.4
    @IBInspectable public var colorAnimationMode: UIColorMode = .HSB
    
    @IBInspectable public var lineCapStyle: CGLineCap = .Square {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var lineJoinStyle: CGLineJoin = .Miter {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    @IBInspectable public var lineWidth: CGFloat = 2.0 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    public var value = 0.0 {
        didSet {
            if enabled {
                self.sendActionsForControlEvents(.ValueChanged)
            }
            layer.setNeedsDisplay()
        }
    }
    
    public var scale: CGFloat {
        get {
            return min(frame.size.width, frame.size.height) / 100
        }
    }
    public let timingFunction = kCAMediaTimingFunctionEaseInEaseOut
    
    let maximumAnimationValue: CGFloat = 1.0
    
    override public class func layerClass() -> AnyClass
    {
        return AnimationLayer.self
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        layer.setNeedsDisplay()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.setNeedsDisplay()
    }
    
    override public func drawLayer(layer: CALayer, inContext ctx: CGContext)
    {
        UIGraphicsPushContext(ctx)
        draw((layer as! AnimationLayer).value)
        UIGraphicsPopContext()
    }
    
    func draw(time: CGFloat = 0) {
        fatalError("Method must be overriden in subclasses. Do not instantiate this class directly.")
    }
    
    public func animateTo(goal: CGFloat) {
        
        let timing: CAMediaTimingFunction = CAMediaTimingFunction(name: timingFunction)
        let animation = CABasicAnimation(keyPath: "value")
        animation.duration = duration
        animation.fillMode = kCAFillModeBoth
        animation.timingFunction = timing
        animation.fromValue = (layer as! AnimationLayer).value
        animation.toValue = goal
        layer.addAnimation(animation, forKey: nil)
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        (layer as! AnimationLayer).value = goal
        CATransaction.commit()
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        if enabled {
            value = (value == 0 ? 1 : 0)
        }
    }
    
}
