import UIKit

public class InteractiveStarIcon: StarIcon {
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        visible = !visible
    }
    
}
