import UIKit

public class InteractivePlusMinusIcon: PlusMinusIcon {
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        minus = !minus
    }
    
}
