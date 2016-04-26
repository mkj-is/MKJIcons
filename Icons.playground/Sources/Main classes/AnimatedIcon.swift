import UIKit

@IBDesignable
public class AnimatedIcon: UIControl {
    
    // MARK: - Basic inspectable properties
    
    @IBInspectable public var animationDuration: Double = 0.4
    
    @IBInspectable public var lineWidth: CGFloat = 2.0 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var fillAlpha: CGFloat = 0.5 {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var animationRepeat: Bool = false {
        didSet {
            
            if animationRepeat {
                animateTo((!value.toBool()).toCGFloat())
            }
            
            layer.setNeedsDisplay()
        }
    }
    
    // MARK: - Standard properties
    
    public var colorMode: UIColorMode = .HSB {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    public var lineCap: CGLineCap = .Round {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    public var lineJoin: CGLineJoin = .Round {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    public var timingFunction = kCAMediaTimingFunctionEaseInEaseOut
    
    public var value: CGFloat = 0 {
        didSet {
            
            if oldValue != value {
                animateTo(value)
            }
            
            if enabled {
                self.sendActionsForControlEvents(.ValueChanged)
            }
            
            layer.setNeedsDisplay()
        }
    }
    
    // MARK: - Internal properties
    
    internal var scale: CGFloat {
        get {
            return min(frame.size.width, frame.size.height) / 100
        }
    }
    
    internal var scaledLineWidth: CGFloat {
        get {
            return lineWidth / scale
        }
    }
    
    // MARK: - Initialization
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        
        setContentsScale()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setContentsScale()
    }
    
    internal func setContentsScale() {
        layer.setNeedsDisplay()
        
        let scale = UIScreen.mainScreen().scale
        layer.contentsScale = scale
        contentScaleFactor = scale
    }
    
    // MARK: - Drawing methods
    
    override public class func layerClass() -> AnyClass
    {
        return AnimationLayer.self
    }
    
    override public func drawLayer(layer: CALayer, inContext ctx: CGContext)
    {
        UIGraphicsPushContext(ctx)
        draw((layer as! AnimationLayer).value)
        UIGraphicsPopContext()
    }
    
    public func image(at: CGFloat = 0) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, contentScaleFactor)
        draw(at)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func draw(time: CGFloat = 0) {
        fatalError("Method must be overriden in subclasses. Do not instantiate this class directly.")
    }
    
    public func animateTo(goal: CGFloat) {
        
        #if TARGET_INTERFACE_BUILDER
 
            (layer as! AnimationLayer).value = goal
            layer.setNeedsDisplay()
        
        #else
            
            layer.removeAllAnimations()
        
            let timing: CAMediaTimingFunction = CAMediaTimingFunction(name: timingFunction)
            let animation = CABasicAnimation(keyPath: "value")
            animation.duration = animationDuration
            animation.fillMode = kCAFillModeBoth
            animation.timingFunction = timing
            animation.fromValue = (layer as! AnimationLayer).value
            animation.toValue = goal
            
            if animationRepeat {
                animation.repeatCount = Float.infinity
                animation.autoreverses = true
            }
            
            layer.addAnimation(animation, forKey: nil)
            
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            (layer as! AnimationLayer).value = goal
            CATransaction.commit()
        
        #endif
    }
    
    // MARK: - Interaction
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        if enabled {
            value = (value == 0 ? 1 : 0)
        }
    }
}
