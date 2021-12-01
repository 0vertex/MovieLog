//
//  DashboardViewController.swift
//  MovieLog
//
//  Created by Manish on 01/12/21.
//

import CoreUIKit
import UIKit

class DashboardViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var horizontalListView = HorizontalListView(isPagingEnabled: true,
                                                             cellSize: CGSize(width: view.bounds.width - 10, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.horizontalListView
            .set(identifier: "HorizontalListView")
            .add(to: self.view)
            .top(with: self.view.safeAreaLayoutGuide.topAnchor)
            .leading(with: self.view.leadingAnchor)
            .trailing(with: self.view.trailingAnchor)
            .with(height: 200)
        self.horizontalListView.setupViews()
    }
    
}
