import UIKit

public class InteractiveBurgerIcon: BurgerIcon {
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        open = !open
    }
    
}
