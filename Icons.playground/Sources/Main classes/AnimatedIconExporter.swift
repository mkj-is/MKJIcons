import UIKit

public enum AnimatedIconExporterDirection {
    case forward, backward, forwardAndBack
}

public class AnimatedIconExporter {

    var icon: AnimatedIcon
    var direction: AnimatedIconExporterDirection
    var count: Int
    var frames: [UIImage]
    var folder: URL

    // MARK: - Initialization

    public init(icon: AnimatedIcon, folder: URL, direction: AnimatedIconExporterDirection = .forward, count: Int = 50) {
        self.icon = icon
        self.direction = direction
        self.count = count
        self.folder = folder
        self.frames = []
    }

    // MARK: - Exporting & saving

    public func export() -> [UIImage] {
        frames = []
        for i in 0...count {
            frames.append(icon.image(at: position(i: i)))
        }
        return frames
    }

    public func save() -> Bool {

        var exported = true

        let name = NSStringFromClass(type(of: icon)).components(separatedBy: ".").last

        if !FileManager.default.fileExists(atPath: folder.path) {
            try! FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true, attributes: nil)
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd_HH-mm-ss"
        let date = formatter.string(from: Date())

        let images = export()
        for i in 0...(images.count - 1) {

            let fileName = String(format: "%@_%@_%03d.png", arguments: [date, name!, i])
            let filePath = folder.appendingPathComponent(fileName)

            if let data = images[i].pngData() {
                do {
                    try data.write(to: filePath)
                } catch {
                    exported = false
                }
            } else {
                exported = false
            }

        }
        return exported
    }

    // MARK: - Helper functions

    func position(i: Int) -> CGFloat {
        var value = CGFloat(i) / CGFloat(count)

        // Calculate position of animation on timeline
        if direction == .backward {
            value = 1 - value
        } else if direction == .forwardAndBack {
            let truncatedByHalf = value.truncatingRemainder(dividingBy: 0.5)
            let truncatedByOne = value.truncatingRemainder(dividingBy: 1)
            value = truncatedByHalf * 2 * (truncatedByOne >= 0.5 ? -1 : 1) + (truncatedByOne >= 0.5 ? 1 : 0)
        }

        // Apply animation function
        switch icon.timingFunctionName {
        case .easeInEaseOut:
            value = AnimationFunctions.sinEaseInOut(x: value)
        case .easeIn:
            value = AnimationFunctions.sinEaseOut(x: value)
        case .easeOut:
            value = AnimationFunctions.sinEaseIn(x: value)
        default:
            value = AnimationFunctions.linear(x: value)
        }

        return value
    }

}
