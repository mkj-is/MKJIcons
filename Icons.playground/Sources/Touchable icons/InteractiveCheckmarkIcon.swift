import UIKit

public class InteractiveCheckmarkIcon: CheckmarkIcon {
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        checked = !checked
    }
    
}
