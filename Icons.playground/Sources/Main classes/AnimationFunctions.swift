import UIKit

public class AnimationFunctions {
    
    static let π = CGFloat(M_PI)
    
    class func linear(x: CGFloat) -> CGFloat {
        return x
    }
    
    class func sinEaseIn(x: CGFloat) -> CGFloat {
        if x <= 0 {
            return 0
        } else if x >= 1 {
            return 1
        } else {
            return 1 - sin((x+1) * π / 2)
        }
    }
    
    class func sinEaseOut(x: CGFloat) -> CGFloat {
        if x <= 0 {
            return 0
        } else if x >= 1 {
            return 1
        } else {
            return sin(x * π / 2)
        }
    }
    
    class func sinEaseInOut(x: CGFloat) -> CGFloat {
        if x <= 0 {
            return 0
        } else if x >= 1 {
            return 1
        } else {
            return (1 + sin((-1.0/2.0 + x) * π)) / 2
        }
    }
    
}
