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
    // Featured movies list
    private let horizontalListViewHeight: CGFloat = 150
    private let horizontalListViewSpaceBetweenCells: CGFloat = 5
    private var horizontalListViewCellWidth: CGFloat { self.view.bounds.width - (50 + self.horizontalListViewSpaceBetweenCells) }
    private lazy var horizontalListView = HorizontalListView(isPagingEnabled: true,
                                                             spaceBetweenCells: self.horizontalListViewSpaceBetweenCells,
                                                             cellSize: CGSize(width: self.horizontalListViewCellWidth,
                                                                              height: self.horizontalListViewHeight))
    
    // Upcoming movies
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.horizontalListView
            .set(identifier: "HorizontalListView")
            .add(to: self.view)
            .top(with: self.view.safeAreaLayoutGuide.topAnchor)
            .leading(with: self.view.leadingAnchor)
            .trailing(with: self.view.trailingAnchor)
            .with(height: self.horizontalListViewHeight)
        self.horizontalListView.setupViews()
    }
    
}
