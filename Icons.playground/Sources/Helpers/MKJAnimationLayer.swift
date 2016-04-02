import UIKit

class MKJAnimationLayer: CALayer {
    
    @NSManaged var value: CGFloat
    
    override init() {
        super.init()
        value = 0.0
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
        
        if let layer = layer as? MKJAnimationLayer {
            value = layer.value
        }
        
    }
    
    
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
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
