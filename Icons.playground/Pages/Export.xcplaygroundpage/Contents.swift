
// For exporting files you need to have "Shared Playground Data" folder in your user Documents folder

import UIKit
import XCPlayground

let icon = InteractiveCheckmarkIcon(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

let exporter = AnimatedIconExporter(icon: icon, folder: XCPlaygroundSharedDataDirectoryURL)

exporter.save()
