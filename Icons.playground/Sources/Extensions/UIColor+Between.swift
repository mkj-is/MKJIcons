import UIKit

public enum UIColorMode {
    case RGB
    case HSB
}

typealias UIColorComponents = (CGFloat, CGFloat, CGFloat, CGFloat)

public extension UIColor {

    // MARK: - Color between two other colors

    convenience init(between color1: UIColor, and color2: UIColor, using: UIColorMode, ratio: CGFloat) {
        let components1: UIColorComponents = using == .RGB ? color1.rgbComponents : color1.hsbComponents
        let components2: UIColorComponents = using == .RGB ? color2.rgbComponents : color2.hsbComponents

        let c0 = components1.0 + (components2.0 - components1.0) * ratio
        let c1 = components1.1 + (components2.1 - components1.1) * ratio
        let c2 = components1.2 + (components2.2 - components1.2) * ratio
        let c3 = components1.3 + (components2.3 - components1.3) * ratio

        if using == .RGB {
            self.init(red: c0, green: c1, blue: c2, alpha: c3)
        } else {
            self.init(hue: c0, saturation: c1, brightness: c2, alpha: c3)
        }
    }

}
