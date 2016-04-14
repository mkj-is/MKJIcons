import UIKit

public extension UIColor {

    static var iconRedColor: UIColor {
        get {
            return UIColor(red: 1.000, green: 0.270, blue: 0.270, alpha: 1.000)
        }
    }
    static var iconOrangeColor: UIColor {
        get {
            return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.1)
        }
    }
    static var iconLightGreenColor: UIColor {
        get {
            return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.2)
        }
    }
    static var iconCyanColor: UIColor {
        get {
            return iconRedColor.colorWithHueComponent(iconRedColor.hue + 0.4)
        }
    }
    
}
