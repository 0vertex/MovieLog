//
//  RootViewController.swift
//  MovieLog
//
//  Created by Manish on 29/11/21.
//

import UIKit

class RootViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.pushViewController(DashboardViewController(), animated: false)
    }

}

