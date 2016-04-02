
// Animated iOS icons created by Matěj Jirásek
// Open assistant editor to view icons, if you click them, they will animate

import UIKit
import XCPlayground

let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))

let checkmark = MKJInteractiveCheckmarkIcon(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
let burger = MKJInteractiveBurgerIcon(frame: CGRect(x: 0, y: 100, width: 100, height: 100))

view.addSubview(checkmark)
view.addSubview(burger)

XCPlaygroundPage.currentPage.liveView = view



