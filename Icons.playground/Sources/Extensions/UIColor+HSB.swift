import UIKit

public extension UIColor {
    
    var hue: CGFloat {
        get {
            return hsbComponents.hue
        }
    }
    
    var saturation: CGFloat {
        get {
            return hsbComponents.saturation
        }
    }
    
    var brightness: CGFloat {
        get {
            return hsbComponents.brightness
        }
    }
    
    var hsbComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        get {
            var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
            
            self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            
            return (hue, saturation, brightness, alpha)
        }
    }
    
}
