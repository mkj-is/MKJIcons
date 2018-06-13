import UIKit

struct AnimationFunctions {

    // MARK: - Simple functions

    static func linear(x: CGFloat) -> CGFloat {
        return x
    }

    // MARK: - Sinusoidal functions

    static func sinEaseIn(x: CGFloat) -> CGFloat {
        if x <= 0 {
            return 0
        } else if x >= 1 {
            return 1
        } else {
            return 1 - sin((x+1) * .pi / 2)
        }
    }

    static func sinEaseOut(x: CGFloat) -> CGFloat {
        if x <= 0 {
            return 0
        } else if x >= 1 {
            return 1
        } else {
            return sin(x * .pi / 2)
        }
    }

    static func sinEaseInOut(x: CGFloat) -> CGFloat {
        if x <= 0 {
            return 0
        } else if x >= 1 {
            return 1
        } else {
            return (1 + sin((-1.0/2.0 + x) * .pi)) / 2
        }
    }

}
