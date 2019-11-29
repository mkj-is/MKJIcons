import UIKit

public typealias UIColorRGBComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

public extension UIColor {

    // MARK: - Getting RGB components

    var red: CGFloat {
        return rgbComponents.red
    }

    var green: CGFloat {
        return rgbComponents.green
    }

    var blue: CGFloat {
        return rgbComponents.blue
    }

    var alpha: CGFloat {
        return rgbComponents.alpha
    }

    var rgbComponents: UIColorRGBComponents {
        var components: UIColorRGBComponents = (0.0, 0.0, 0.0, 0.0)
        getRed(&components.red, green: &components.green, blue: &components.blue, alpha: &components.alpha)
        return components
    }

    // MARK: - Creating from RGB components

    func colorWithRedComponent(red: CGFloat) -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    func colorWithGreenComponent(green: CGFloat) -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    func colorWithBlueComponent(blue: CGFloat) -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}
