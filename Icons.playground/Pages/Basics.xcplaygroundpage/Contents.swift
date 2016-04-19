//: [Previous](@previous)

//: Animated iOS icons created by Matěj Jirásek
//: Open assistant editor to view icons, if you click them, they will animate

import UIKit
import XCPlayground

let icon = StarIcon(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

icon.lineCap = .Round
icon.lineJoin = .Round
icon.lineWidth = 4
icon.animationDuration = 1
icon.colorMode = .HSB

XCPlaygroundPage.currentPage.liveView = icon


//: [Next](@next)
