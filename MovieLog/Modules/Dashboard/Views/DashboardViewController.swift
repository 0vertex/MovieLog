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
    private let dashboardVerticalList = BaseTableView()
    // Featured movies list
    // Upcoming movies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dashboardVerticalList
            .set(identifier: "dashboardVerticalList")
            .add(to: self.view)
            .allSafeEdgeAnchorsSame(on: self.view, margin: UIEdgeInsets(topBottom: 5))

        self.dashboardVerticalList.backgroundColor = .clear
        self.dashboardVerticalList.delegate = self
        self.dashboardVerticalList.dataSource = self
        self.dashboardVerticalList.register(HorizontalListTableViewCell.self)
    }
    
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = self.dashboardVerticalList.dequeue(HorizontalListTableViewCell.self, for: indexPath) {
                cell.viewModel = HorizontalListTableViewCellViewModel(listHeight: 150,
                                                                      layout: CollectionViewBannerLayout())
                cell.setupViews()
                
                return cell
            }
        case 1:
            if let cell = self.dashboardVerticalList.dequeue(HorizontalListTableViewCell.self, for: indexPath) {
                cell.viewModel = HorizontalListTableViewCellViewModel(listHeight: 200,
                                                                      layout: CollectionViewColumnLayout())
                cell.setupViews()
                
                return cell
            }
        case 2:
            if let cell = self.dashboardVerticalList.dequeue(HorizontalListTableViewCell.self, for: indexPath) {
                cell.viewModel = HorizontalListTableViewCellViewModel(listHeight: 200,
                                                                      layout: CollectionViewColumnLayout(cellSizeType: .init(width: .threeFourths, height: .full)))
                cell.setupViews()
                
                return cell
            }
        case 3:
            if let cell = self.dashboardVerticalList.dequeue(HorizontalListTableViewCell.self, for: indexPath) {
                cell.viewModel = HorizontalListTableViewCellViewModel(listHeight: 250,
                                                                      layout: CollectionViewColumnLayout(cellSizeType: .init(width: .full, height: .half)))
                cell.setupViews()
                
                return cell
            }
        default:
            assertionFailure()
            return UITableViewCell()
        }
        
        
        assertionFailure()
        return UITableViewCell()
    }
    
    
}
