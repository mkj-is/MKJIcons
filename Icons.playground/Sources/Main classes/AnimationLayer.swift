import UIKit

class AnimationLayer: CALayer {

    // MARK: - Properties

    @NSManaged var value: CGFloat

    // MARK: - Initialization

    override init() {
        super.init()
        value = 0.0
    }

    override init(layer: Any) {
        super.init(layer: layer)

        if let layer = layer as? AnimationLayer {
            value = layer.value
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Animation of the value

    override class func needsDisplay(forKey: String) -> Bool {
        if forKey == "value" {
            return true
        }
        return super.needsDisplay(forKey: forKey)
    }

    override func action(forKey event: String) -> (CAAction!) {
        if event == "value" {
            let animation = CABasicAnimation(keyPath: event)
            animation.fromValue = presentation()?.value(forKey: event)
            return animation
        }
        return super.action(forKey: event)
    }

}
