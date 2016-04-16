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
        var value = (CGFloat(i) / CGFloat(count))
        
        // calculate position of animation on timeline
        if direction == .Backward {
            value = 1 - value
        } else if direction == .ForwardAndBack {
            value = (value % 0.5) * 2 * (value % 1 >= 0.5 ? -1 : 1) + (value % 1 >= 0.5 ? 1 : 0)
        }
        
        // apply animation function
        switch icon.timingFunction {
        case kCAMediaTimingFunctionEaseInEaseOut:
            value = AnimationFunctions.sinEaseInOut(value)
        case kCAMediaTimingFunctionEaseIn:
            value = AnimationFunctions.sinEaseOut(value)
        case kCAMediaTimingFunctionEaseOut:
            value = AnimationFunctions.sinEaseIn(value)
        default:
            value = AnimationFunctions.linear(value)
        }
        
        return value
    }
    
    public func save() -> Bool {
        
        var exported = true
        
        let name = NSStringFromClass(icon.dynamicType).componentsSeparatedByString(".").last
        
        if !NSFileManager.defaultManager().fileExistsAtPath(folder.path!) {
            try! NSFileManager.defaultManager().createDirectoryAtURL(folder, withIntermediateDirectories: true, attributes: nil)
        }

        let formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY-MM-dd_HH-mm-SS"
        let date = formatter.stringFromDate(NSDate())
        
        let images = export()
        for i in 0...(images.count - 1) {
            
            let fileName = String(format: "%@_%@_%03d.png", arguments: [date, name!, i])
            let filePath = folder.URLByAppendingPathComponent(fileName)
            let data = UIImagePNGRepresentation(images[i])
            
            if let data = data {
                exported = exported && data.writeToURL(filePath, atomically: true)
            }
            
        }
        return exported
    }
}
