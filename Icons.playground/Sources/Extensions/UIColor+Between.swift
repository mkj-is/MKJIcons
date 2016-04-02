import UIKit

public extension UIColor {
    
    class func rgbColorBetween(color1: UIColor, and color2: UIColor, ratio: CGFloat) -> UIColor {

        let r = color1.red + (color2.red - color1.red) * ratio
        let g = color1.green + (color2.green - color1.green) * ratio
        let b = color1.blue + (color2.blue - color1.blue) * ratio
        let a = color1.alpha + (color2.alpha - color1.alpha) * ratio
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    class func hsbColorBetween(color1: UIColor, and color2: UIColor, ratio: CGFloat) -> UIColor {
        
        let h = color1.hue + (color2.hue - color1.hue) * ratio
        let s = color1.saturation + (color2.saturation - color1.saturation) * ratio
        let b = color1.brightness + (color2.brightness - color1.brightness) * ratio
        let a = color1.alpha + (color2.alpha - color1.alpha) * ratio
        
        return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
    }
    
}
