import UIKit

class MainTabBarViewController: UITabBarController {
    
    private let homeViewController: UINavigationController = {
        let homeViewController = HomeViewController()
        homeViewController.title = "Home"
        return UINavigationController(rootViewController: homeViewController)
    }()
    
    private let upcomingViewController: UINavigationController = {
        let upcomingViewController = UpcomingViewController()
        upcomingViewController.title = "Coming Soon"
        return UINavigationController(rootViewController: upcomingViewController)
    }()
    
    private let searchViewController: UINavigationController = {
        let searchViewController = SearchViewController()
        searchViewController.title = "Top Search"
        return UINavigationController(rootViewController: searchViewController)
    }()
    
    private let downloadViewController: UINavigationController = {
        let downloadViewController = DownloadsViewController()
        downloadViewController.title = "Downloads"
        return UINavigationController(rootViewController: downloadViewController)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarIcons()
        self.insertControllersToTabBar()
    }
    
    //MARK: Private methods
    private func insertControllersToTabBar(){
        self.setViewControllers([homeViewController,
                                 upcomingViewController,
                                 searchViewController,
                                 downloadViewController], animated: true)
    }
    
    private func setupTabBarIcons(){
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        upcomingViewController.tabBarItem.image = UIImage(systemName: "play.circle")
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        self.tabBar.tintColor = UIColor.label
    }
}
