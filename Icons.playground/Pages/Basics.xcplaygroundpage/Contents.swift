
//: # Animated icons
//:
//: *Designed and developed by Matěj K. Jirásek ([mkj.is](http://mkj.is))*
//:
//: [**Go to previous chapter.**](@previous)
//:
//: An icon set usable as an iOS framework. This first documentation page
//: serves as an reference and showcase of all available icons.
//:
//: **You need to have the assistant editor with timeline open to view the icons.
//: If you click them, then they will animate. Some of them are invisible
//: by default. Do not forget to click the empty places too!**
//:
//: The next chapter shows us how to export bitmap image sequences.
//:
//: [**Go to next chapter.**](@next)

// We need to import basic frameworks so this example can work
import UIKit
import XCPlayground

// Then we create the icon
let icon = BikeIcon(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

// We can set the line parameters
icon.lineCap = .Round
icon.lineJoin = .Round
icon.lineWidth = 6

// We make the icon to animate longer so we can see the animation in more detail
icon.animationDuration = 2

// If you animate using HSB the animation will be really colorful
// (Or you can of course stock with RGB, if you are conservative)
icon.colorMode = .HSB

// We make the icon visible by default, the icon will animate at the beginning!
icon.visible = true

// Then we assign the icon to assistant editor
XCPlaygroundPage.currentPage.liveView = icon

