import UIKit

public enum AnimatedIconExporterDirection {
    case Forward
    case Backward
    case ForwardAndBack
}

public class AnimatedIconExporter {
    
    var icon: AnimatedIcon
    var direction: AnimatedIconExporterDirection
    var count: Int
    var frames: [UIImage]
    var folder: NSURL
    
    public init(icon: AnimatedIcon, folder: NSURL, direction: AnimatedIconExporterDirection = .Forward, count: Int = 50) {
        self.icon = icon
        self.direction = direction
        self.count = count
        self.folder = folder
        self.frames = []
    }
    
    public func export() -> [UIImage] {
        frames = []
        for i in 0...count {
            UIGraphicsBeginImageContext(icon.frame.size)
            icon.draw(position(i))
            frames.append(UIGraphicsGetImageFromCurrentImageContext())
            UIGraphicsEndImageContext()
        }
        return frames
    }
    
    func position(i: Int) -> CGFloat {
        let value = (CGFloat(i) / CGFloat(count)) % 1
        
        switch direction {
        case .Forward:
            return value
        case .Backward:
            return 1 - value
        case .ForwardAndBack:
            return (value % 0.5) * 2 * (value >= 0.5 ? -1 : 1) + (value >= 0.5 ? 1 : 0)
        }
    }
    
    public func save() -> Bool {
        
        var exported = true
        
        let name = NSStringFromClass(icon.dynamicType).componentsSeparatedByString(".").last
        
        if !NSFileManager.defaultManager().fileExistsAtPath(folder.path!) {
            try! NSFileManager.defaultManager().createDirectoryAtURL(folder, withIntermediateDirectories: true, attributes: nil)
        }
        
        let images = export()
        for i in 0...(images.count - 1) {
            
            let fileName = String(format: "%@_%03d.png", arguments: [name!, i])
            let filePath = folder.URLByAppendingPathComponent(fileName)
            let data = UIImagePNGRepresentation(images[i])
            
            if let data = data {
                exported = exported && data.writeToURL(filePath, atomically: true)
            }
            
        }
        return exported
    }
}
