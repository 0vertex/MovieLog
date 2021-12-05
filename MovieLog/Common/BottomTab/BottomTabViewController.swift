//
//  BottomTabViewController.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import UIKit

class BottomTabViewController: UITabBarController {
    
    // MARK: - Properties
    private let dashboardVC = DashboardViewController()
    private let favoritiesVC = FavoritesViewController()
    private let settingsVC = SettingsViewController()
    
    // MARK: - VC Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        let dashboardTabItem = UITabBarItem(title: StringConstants.dashboardTitle,
                                            image: ImageConstants.getImage(of: .dashboard), tag: 0)
        self.dashboardVC.tabBarItem = dashboardTabItem
        
        let favoritiesVCTabItem = UITabBarItem(title: StringConstants.favoritiesTitle,
                                               image: ImageConstants.getImage(of: .favourite), tag: 1)
        self.favoritiesVC.tabBarItem = favoritiesVCTabItem
        
        let settingsVCTabItem = UITabBarItem(title: StringConstants.settingsTitle,
                                             image: ImageConstants.getImage(of: .settings), tag: 2)
        self.settingsVC.tabBarItem = settingsVCTabItem
        
        self.viewControllers = [self.dashboardVC, self.favoritiesVC, self.settingsVC]
    }
}
