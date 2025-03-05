import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupTabBar()
    }
    
    private func setupAppearance() {
        view.backgroundColor = R.ColorYP.whiteDynamic
        tabBar.isTranslucent = false
        tabBar.tintColor = R.ColorYP.blue
        tabBar.addTopBorder(color: R.ColorYP.gray, thickness: 0.5)
    }
    
    private func setupTabBar() {
        let trackers = UIViewController()
        let trackersNav = UINavigationController(rootViewController: trackers)
        trackersNav.tabBarItem = UITabBarItem(
            title: R.Text.TabBar.tracker,
            image: R.ImagesYP.TabBar.tracker,
            selectedImage: nil
        )
        
        let statistic = UIViewController()
        let statisticNav = UINavigationController(rootViewController: statistic)
        statisticNav.tabBarItem = UITabBarItem(
            title: R.Text.TabBar.statistic,
            image: R.ImagesYP.TabBar.statistic,
            selectedImage: nil
        )
        
        viewControllers  = [trackersNav, statisticNav]
    }
}


