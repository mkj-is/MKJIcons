
// Animated iOS icons created by Matěj Jirásek
// Open assistant editor to view icons, if you click them, they will animate

import UIKit
import XCPlayground

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))

let checkmark = CheckmarkIcon(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
let burger = BurgerIcon(frame: CGRect(x: 100, y: 0, width: 100, height: 100))
let heart = HeartIcon(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
let star = StarIcon(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
let plus = PlusMinusIcon(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
let settings = SettingsIcon(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
let pin = DropPinIcon(frame: CGRect(x: 0, y: 300, width: 100, height: 100))

view.addSubview(checkmark)
view.addSubview(burger)
view.addSubview(heart)
view.addSubview(star)
view.addSubview(plus)
view.addSubview(settings)
view.addSubview(pin)

XCPlaygroundPage.currentPage.liveView = view


//: [Next](@next)
