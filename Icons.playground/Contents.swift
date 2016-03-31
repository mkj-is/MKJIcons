
import UIKit
import XCPlayground

let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))

let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let checkmark = MKJCheckmark(frame: rect)
let burger = MKJBurgerIcon(frame: CGRect(x: 0, y: 100, width: 100, height: 100))

view.addSubview(checkmark)
view.addSubview(burger)

XCPlaygroundPage.currentPage.liveView = view



