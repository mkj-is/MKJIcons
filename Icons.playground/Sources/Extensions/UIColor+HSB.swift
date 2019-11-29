import UIKit

public typealias UIColorHSBComponents = (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)

public extension UIColor {

    // MARK: - Getting HSB components

    var hue: CGFloat {
        return hsbComponents.hue
    }

    var saturation: CGFloat {
        return hsbComponents.saturation
    }

    var brightness: CGFloat {
        return hsbComponents.brightness
    }

    var hsbComponents: UIColorHSBComponents {
        var components: UIColorHSBComponents = (0.0, 0.0, 0.0, 0.0)
        getHue(&components.hue, saturation: &components.saturation, brightness: &components.brightness, alpha: &components.alpha)
        return components
    }

    // MARK: - Creating from HSB components

    func colorWithHueComponent(hue: CGFloat) -> UIColor {
        return UIColor(hue: hue.truncatingRemainder(dividingBy: 1), saturation: saturation, brightness: brightness, alpha: alpha)
    }

    func colorWithBrightnessComponent(brightness: CGFloat) -> UIColor {
        return UIColor(hue: hue.truncatingRemainder(dividingBy: 1), saturation: saturation, brightness: brightness, alpha: alpha)
    }

    func colorWithSaturationComponent(saturation: CGFloat) -> UIColor {
        return UIColor(hue: hue.truncatingRemainder(dividingBy: 1), saturation: saturation, brightness: brightness, alpha: alpha)
    }

}
