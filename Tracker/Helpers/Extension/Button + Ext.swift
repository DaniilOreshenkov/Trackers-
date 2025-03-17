import UIKit

extension UIButton {
    func animateTouchDown1() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.85
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1.0
            })
        }
    }
}
