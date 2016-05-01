
//: # Animated icons
//:
//: *Designed and developed by Matěj K. Jirásek ([mkj.is](http://mkj.is))*
//:
//: Full documentation is available here: <http://mkj-is.github.io/MKJIcons>
//:
//: - [**Go to previous chapter.**](@previous)
//: - [**Go to next chapter.**](@next)
//:
//: -----
//:
//: This chapter shows how to configure the icon style and appearance.
//:
//: Properties listed below can be changed for all the icons, but many of them have much more settings. Also,
//: these basic values can be set using `UIAppearance` on the application start. If you choose to use this way,
//: then all the icons created after will inherit these properties.
//:
//: And the best thing is, that the icons are `IBDesignable`. That means if you add the to your `.xib` or `.storyboard`,
//: you can see how they will look in your application and you can prototype the user interface really fast.
//:

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

