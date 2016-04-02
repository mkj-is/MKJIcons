import UIKit

public extension UIColor {
    
    var red: CGFloat {
        get {
            return rgbComponents.red
        }
    }
    
    var green: CGFloat {
        get {
            return rgbComponents.green
        }
    }
    
    var blue: CGFloat {
        get {
            return rgbComponents.blue
        }
    }
    
    var alpha: CGFloat {
        get {
            return rgbComponents.alpha
        }
    }
    
    var rgbComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        get {
            var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
            
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            return (red, green, blue, alpha)
        }
    }
    
}
