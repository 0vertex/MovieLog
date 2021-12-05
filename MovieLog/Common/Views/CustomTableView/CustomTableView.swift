//
//  CustomTableView.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import CoreUIKit
import UIKit
import CoreFoundationKit


class CustomTableView: UIView, BaseView {
    
    // MARK: - Properties
    var viewModel: CustomTableViewModel? {
        didSet {
            self.tableView.reloadData()
        }
    }

    let tableView = BaseTableView()
    
    // MARK: - Setups
    func setupViews() {
        self.tableView
            .set(identifier: "CustomTableView.tableView")
            .add(to: self)
            .allAnchorsSame(on: self)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.viewModel?.cellData.forEach {
            self.tableView.register($0.cellType)
        }
    }
    
    func setupData() {
        
    }
    
}

extension CustomTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return safe(self.viewModel?.cellData.count)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellData = self.viewModel?.cellData[indexPath.row] else {
            assertionFailure()
            return UITableViewCell()
        }
        
        switch cellData {
        case .horizontalList(let data):
            if let cell = self.tableView.dequeue(HorizontalListTableViewCell.self, for: indexPath) {
                cell.viewModel = HorizontalListTableViewCellViewModel(listHeight: data.listHeight,
                                                                      layout: data.layout)
                cell.setupViews()
                
                return cell
            } else {
                assertionFailure()
            }
        }
        
        
        assertionFailure()
        return UITableViewCell()
    }
    
    
}

