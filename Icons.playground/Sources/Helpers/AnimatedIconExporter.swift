import UIKit

public class AnimatedIconExporter {
    
    var icon: AnimatedIcon
    var count: Int
    var frames: [UIImage]
    var folder: NSURL
    
    public init(icon: AnimatedIcon, folder: NSURL, count: Int = 50) {
        self.icon = icon
        self.count = count
        self.folder = folder
        self.frames = []
    }
    
    public func export() -> [UIImage] {
        frames = []
        for i in 0...count {
            UIGraphicsBeginImageContext(icon.frame.size)
            icon.draw(CGFloat(i) / CGFloat(count))
            frames.append(UIGraphicsGetImageFromCurrentImageContext())
            UIGraphicsEndImageContext()
        }
        return frames
    }
    
    public func save() -> Bool {
        
        var exported = true
        
        let name = NSStringFromClass(icon.dynamicType).componentsSeparatedByString(".").last
        let assetFolder = folder.URLByAppendingPathComponent(name!)
        
        if !NSFileManager.defaultManager().fileExistsAtPath(assetFolder.path!) {
            try! NSFileManager.defaultManager().createDirectoryAtURL(assetFolder, withIntermediateDirectories: true, attributes: nil)
        }
        
        let images = export()
        for i in 0...(images.count - 1) {
            
            let fileName = String(format: "%@_%03d.png", arguments: [name!, i])
            let filePath = assetFolder.URLByAppendingPathComponent(fileName)
            let data = UIImagePNGRepresentation(images[i])
            
            if let data = data {
                exported = exported && data.writeToURL(filePath, atomically: true)
            }
            
        }
        return exported
    }
}
