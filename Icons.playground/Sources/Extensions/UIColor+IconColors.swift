import UIKit

public extension UIColor {
    
    // MARK: - Basic icon colors

    public static var iconRedColor: UIColor {
        return UIColor(red: 1.000, green: 0.270, blue: 0.270, alpha: 1.000)
    }
    public static var iconOrangeColor: UIColor {
        return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.1)
    }
    public static var iconLightGreenColor: UIColor {
        return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.2)
    }
    public static var iconCyanColor: UIColor {
        return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.4)
    }
    
}
