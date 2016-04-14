import UIKit

public class InteractiveHeartIcon: HeartIcon {
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        visible = !visible
    }
    
}
