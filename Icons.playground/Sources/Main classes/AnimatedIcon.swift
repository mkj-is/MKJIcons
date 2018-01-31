import UIKit

@IBDesignable
public class AnimatedIcon: UIControl {

    // MARK: - Inspectable properties

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
                animateTo(goal: CGFloat(!Bool(value)))
            }
            layer.setNeedsDisplay()
        }
    }

    @IBInspectable public var animationAutoreverses: Bool = true {
        didSet {
            if animationRepeat {
                animateTo(goal: CGFloat(!Bool(value)))
            }
            layer.setNeedsDisplay()
        }
    }

    // MARK: - Properties

    public var colorMode: UIColorMode = .hsb {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    public var lineCap: CGLineCap = .round {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    public var lineJoin: CGLineJoin = .round {
        didSet {
            layer.setNeedsDisplay()
        }
    }

    public var timingFunction = kCAMediaTimingFunctionEaseInEaseOut

    public var value: CGFloat = 0 {
        didSet {
            if oldValue != value {
                animateTo(goal: value)
            }

            if isEnabled {
                self.sendActions(for: .valueChanged)
            }

            layer.setNeedsDisplay()
        }
    }

    // MARK: - Internal properties

    var scale: CGFloat {
        return min(frame.size.width, frame.size.height) / 100
    }

    var scaledLineWidth: CGFloat {
        return lineWidth / scale
    }

    // MARK: - Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear

        setContentsScale()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setContentsScale()
    }

    // MARK: - Internal helper methods

    func setContentsScale() {
        layer.setNeedsDisplay()

        let scale = UIScreen.main.scale
        layer.contentsScale = scale
        contentScaleFactor = scale
    }

    // MARK: - Drawing methods

    override public class var layerClass: AnyClass {
        return AnimationLayer.self
    }

    override public func draw(_ layer: CALayer, in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        if let layer = layer as? AnimationLayer {
            draw(time: layer.value)
        }
        UIGraphicsPopContext()
    }

    public func image(at: CGFloat = 0) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, contentScaleFactor)
        defer {
            UIGraphicsEndImageContext()
        }
        draw(time: at)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }

    /**
        Draws the content of the icons. Needs to be overriden in subclasses of `AnimatedIcon`.

        - Parameter time: The position of animation, start of the animation will be 0 and the end will be 1. If the animation is reverted the value will be changing from 1 to 0.
    */
    func draw(time: CGFloat = 0) {
        fatalError("Method must be overriden in subclasses. Do not instantiate this class directly.")
    }

    public func animateTo(goal: CGFloat) {

        if let layer = layer as? AnimationLayer {

            #if TARGET_INTERFACE_BUILDER

                layer.value = goal
                layer.setNeedsDisplay()

            #else

                layer.removeAllAnimations()

                let timing: CAMediaTimingFunction = CAMediaTimingFunction(name: timingFunction)
                let animation = CABasicAnimation(keyPath: "value")
                animation.duration = animationDuration
                animation.fillMode = kCAFillModeBoth
                animation.timingFunction = timing
                animation.fromValue = layer.value
                animation.toValue = goal

                if animationRepeat {
                    animation.repeatCount = .infinity
                    animation.autoreverses = animationAutoreverses
                }

                layer.add(animation, forKey: nil)

                CATransaction.begin()
                CATransaction.setDisableActions(true)
                layer.value = goal
                CATransaction.commit()

            #endif
        }
    }

    // MARK: - Interaction

    public override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if isEnabled {
            value = (value == 0 ? 1 : 0)
        }
    }

}
