import UIKit

public extension UIColor {

    public static var iconRedColor: UIColor {
        get {
            return UIColor(red: 1.000, green: 0.270, blue: 0.270, alpha: 1.000)
        }
    }
    public static var iconOrangeColor: UIColor {
        get {
            return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.1)
        }
    }
    public static var iconLightGreenColor: UIColor {
        get {
            return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.2)
        }
    }
    public static var iconCyanColor: UIColor {
        get {
            return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.4)
        }
    }
    
}
