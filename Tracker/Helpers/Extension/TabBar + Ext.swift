import UIKit

extension UITabBar {
    func addTopBorder(color: UIColor?, thickness: CGFloat) {
        let subview = UIView()
        subview.backgroundColor = color
        self.addView(subview)
        
        NSLayoutConstraint.activate([
            subview.leftAnchor.constraint(equalTo: self.leftAnchor),
            subview.rightAnchor.constraint(equalTo: self.rightAnchor),
            subview.heightAnchor.constraint(equalToConstant: thickness),
            subview.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
}
