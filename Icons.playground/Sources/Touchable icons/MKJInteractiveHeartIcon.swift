import UIKit

public class MKJInteractiveHeartIcon: MKJHeartIcon {
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        visible = !visible
    }
    
}
