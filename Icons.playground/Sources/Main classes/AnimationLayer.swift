import UIKit

class AnimationLayer: CALayer {
    
    // MARK: - Properties
    
    @NSManaged var value: CGFloat
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        value = 0.0
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
        
        if let layer = layer as? AnimationLayer {
            value = layer.value
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Animation of the value
    
    override class func needsDisplayForKey(key: (String!)) -> Bool {
        
        if key == "value" {
            return true
        }
        
        return super.needsDisplayForKey(key)
    }
    
    override func actionForKey(event: (String!)) -> (CAAction!) {
        if event == "value" {
            let animation = CABasicAnimation.init(keyPath: event)
            animation.fromValue = presentationLayer()?.valueForKey(event)
            return animation
        }
        
        return super.actionForKey(event)
    }
}
