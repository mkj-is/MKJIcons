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
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0

        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
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
