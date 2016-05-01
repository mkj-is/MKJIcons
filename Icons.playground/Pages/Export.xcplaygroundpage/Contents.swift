
//: # Animated icons
//:
//: *Designed and developed by Matěj K. Jirásek ([mkj.is](http://mkj.is))*
//:
//: Full documentation is available here: <http://mkj-is.github.io/MKJIcons>
//:
//: [**Go to previous chapter.**](@previous)
//:
//: -----
//:
//: This chapter shows us how to export bitmap image sequences.
//:
//: In the framework there is a special class for exporting images
//: and their sequences from icons. You assign the icon to the exporter
//: and then save the result and that is all!
//:
//: **If you are view this documentation in the playground and want to export the icons, then you need to have
//: *Shared Playground Data* folder in your user *Documents* folder.**
//:

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
