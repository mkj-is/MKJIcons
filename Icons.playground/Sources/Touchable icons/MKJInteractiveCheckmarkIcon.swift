import UIKit

public class MKJInteractiveCheckmarkIcon: MKJCheckmarkIcon {
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        checked = !checked
    }
    
}
