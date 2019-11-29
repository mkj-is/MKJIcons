import UIKit

public extension UIColor {

    // MARK: - Basic icon colors

    static var iconRedColor: UIColor {
        return UIColor(red: 1.000, green: 0.270, blue: 0.270, alpha: 1.000)
    }

    static var iconOrangeColor: UIColor {
        return iconRedColor.colorWithHueComponent(hue: iconRedColor.hue + 0.1)
    }

    static var iconLightGreenColor: UIColor {
        return iconRedColor.colorWithHueComponent(hue: iconRedColor.hue + 0.2)
    }

    static var iconCyanColor: UIColor {
        return iconRedColor.colorWithHueComponent(hue: iconRedColor.hue + 0.4)
    }

}
