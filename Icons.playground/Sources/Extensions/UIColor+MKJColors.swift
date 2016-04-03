import UIKit

public extension UIColor {

    static var mkjRedColor: UIColor {
        get {
            return UIColor(red: 1.000, green: 0.270, blue: 0.270, alpha: 1.000)
        }
    }
    static var mkjOrangeColor: UIColor {
        get {
            return mkjRedColor.colorWithHueComponent(mkjRedColor.hue + 0.1)
        }
    }
    static var mkjLightGreenColor: UIColor {
        get {
            return mkjRedColor.colorWithHueComponent(mkjRedColor.hue + 0.2)
        }
    }
    static var mkjCyanColor: UIColor {
        get {
            return mkjRedColor.colorWithHueComponent(mkjRedColor.hue + 0.4)
        }
    }
    
}
