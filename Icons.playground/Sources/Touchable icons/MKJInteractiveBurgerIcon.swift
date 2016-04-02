import UIKit

public class MKJInteractiveBurgerIcon: MKJBurgerIcon {
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        open = !open
    }
    
}
