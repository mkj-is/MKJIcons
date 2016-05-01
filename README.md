
# Animated icons

*Designed and developed by Matěj K. Jirásek ([mkj.is](http://mkj.is))*

Full documentation is available here: <http://mkj-is.github.io/MKJIcons>




## Table of contents

* [Showcase](#showcase)
* [Basics](#basics)
* [Export](#export)



## Showcase


![Animated star](Icons.playground/Pages/Showcase.xcplaygroundpage/Resources/AnimatedStar.gif)

An icon set usable as an iOS framework. This first documentation page
serves as an reference and showcase of all available icons.

The icons feature:

- Vector rendering.
- Independent on size.
- Colours can be set to your liking.
- Line width, caps and joins can all be configured.
- Animation duration and color changes can be fully configured too.
- Using the playground you can export PNG sequences if you like bitmaps too.
- Each icon has its setting for most values.
- Icons can be used as buttons or checkboxes,
  they are controls and you can bind actions to them
  and listen to “value changed” event.
- The icons are designable in the interface builder, so you can view how they will
  look in the final application and design them in Xcode!

**You need to have the assistant editor with timeline open to view the icons.
If you click them, then they will animate. Some of them are invisible
by default. Do not forget to click the empty places too!**


```swift


// We need to import basic frameworks so this example can work
import UIKit
import XCPlayground

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

// We create a view to contain all the icons
let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

// Then we add them to the large parent view
view.addSubview(checkmark)
view.addSubview(burger)
view.addSubview(heart)
view.addSubview(star)
view.addSubview(plus)
view.addSubview(settings)
view.addSubview(pin)
view.addSubview(play)
view.addSubview(stop)
view.addSubview(smile)
view.addSubview(fingerprint)
view.addSubview(clip)
view.addSubview(wave)
view.addSubview(bike)
view.addSubview(earth)
view.addSubview(textAlign)

// At last we assign the parent view with the icons to assistant editor
XCPlaygroundPage.currentPage.liveView = view



```



## Basics


This chapter shows how to configure the icon style and appearance.

Properties listed below can be changed for all the icons, but many of them have much more settings. Also,
these basic values can be set using `UIAppearance` on the application start. If you choose to use this way,
then all the icons created after will inherit these properties.

And the best thing is, that the icons are `IBDesignable`. That means if you add the to your `.xib` or `.storyboard`,
you can see how they will look in your application and you can prototype the user interface really fast.


```swift


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



```



## Export


This chapter shows us how to export bitmap image sequences.

In the framework there is a special class for exporting images
and their sequences from icons. You assign the icon to the exporter
and then save the result and that is all!

**If you are view this documentation in the playground and want to export the icons, then you need to have
*Shared Playground Data* folder in your user *Documents* folder.**


```swift


import UIKit
import XCPlayground

// We create the icon which will be 100x100 pixels
let icon = CheckmarkIcon(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

// Then we tell where we would like the sequence to be stored
let folder = XCPlaygroundSharedDataDirectoryURL
    .URLByAppendingPathComponent("checkmark_forward")

// We can tell the exporter how many frames the animation has
let frameCount = 50

// Also, there is an option to export animation going once forward,
// once backward or forward and back in one export
let direction = AnimatedIconExporterDirection.ForwardAndBack

// Then we create the exporter and save the result!
let exporter = AnimatedIconExporter(icon: icon, folder: folder, direction: direction, count: frameCount)

exporter.save()


```

