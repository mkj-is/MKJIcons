//:
//: # Animated icons
//:
//: *Designed and developed by Matěj K. Jirásek ([mkj.is](http://mkj.is))*
//:
//: [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.png)](https://github.com/Carthage/Carthage)
//: [![Code Climate](https://img.shields.io/codeclimate/github/kabisaict/flow.svg)](https://codeclimate.com/github/mkj-is/MKJIcons)
//:
//: Full documentation is available here: <http://mkj-is.github.io/MKJIcons>
//:
//: - [**Go to next chapter.**](@next)
//:
//: -----
//:
//: ![Animated star](AnimatedStar.gif)
//:
//: An icon set usable as an iOS framework. This first documentation page
//: serves as an reference and showcase of all available icons.
//:
//: The icons feature:
//:
//: - Vector rendering.
//: - Independent on size.
//: - Colours can be set to your liking.
//: - Line width, caps and joins can all be configured.
//: - Animation duration and color changes can be fully configured too.
//: - Using the playground you can export PNG sequences if you like bitmaps too.
//: - Each icon has its setting for most values.
//: - Icons can be used as buttons or checkboxes,
//:   they are controls and you can bind actions to them
//:   and listen to “value changed” event.
//: - The icons are designable in the interface builder, so you can view how they will
//:   look in the final application and design them in Xcode!
//:
//: **You need to have the assistant editor with timeline open to view the icons.
//: If you click them, then they will animate. Some of them are invisible
//: by default. Do not forget to click the empty places too!**
//:

// We need to import basic frameworks so this example can work
import UIKit
import PlaygroundSupport

// These are all the icons available
let checkmark = CheckmarkIcon(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
let burger = BurgerIcon(frame: CGRect(x: 100, y: 0, width: 100, height: 100))
let heart = HeartIcon(frame: CGRect(x: 200, y: 0, width: 100, height: 100))
let star = StarIcon(frame: CGRect(x: 300, y: 0, width: 100, height: 100))
let plus = PlusMinusIcon(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
let settings = SettingsIcon(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
let pin = DropPinIcon(frame: CGRect(x: 200, y: 100, width: 100, height: 100))
let play = PlayPauseIcon(frame: CGRect(x: 300, y: 100, width: 100, height: 100))
let stop = PlayStopIcon(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
let smile = SmileIcon(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
let fingerprint = FingerprintIcon(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
let clip = PaperclipIcon(frame: CGRect(x: 300, y: 200, width: 100, height: 100))
let wave = SoundwaveIcon(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
let bike = BikeIcon(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
let earth = EarthIcon(frame: CGRect(x: 200, y: 300, width: 100, height: 100))
let textAlign = TextAlignIcon(frame: CGRect(x: 300, y: 300, width: 100, height: 100))
let ellipsis = EllipsisIcon(frame: CGRect(x: 0, y: 400, width: 100, height: 100))

// We create a view to contain all the icons
let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 500))

// Then we add them to the large parent view
let icons = [
    checkmark, burger, heart, star, plus,
    settings, pin, play, stop, smile,
    fingerprint, clip, wave, bike, earth,
    textAlign, ellipsis
]
icons.forEach(view.addSubview)

// At last we assign the parent view with the icons to assistant editor
PlaygroundPage.current.liveView = view
