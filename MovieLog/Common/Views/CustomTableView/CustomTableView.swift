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
        // Reset top padding
        if #available(iOS 15.0, *) {
            self.tableView.sectionHeaderTopPadding = 0
        }
        
        self.tableView
            .set(identifier: "CustomTableView.tableView")
            .add(to: self)
            .allAnchorsSame(on: self)
        
        self.viewModel?.sectionData.forEach { section in
            // Register headers
            if let safeHeaderType = section.type.viewType {
                self.tableView.register(safeHeaderType)
            }
            
            // Register cells
            section.cellData.forEach { cell in
                self.tableView.register(cell.cellType)
            }
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupData() {
        
    }
    
}

extension CustomTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return safe(self.viewModel?.sectionData.count)
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        guard let headerViewType = self.viewModel?.sectionData[section].type else { return nil }
        
        switch headerViewType {
        case .none:
            return nil
        case .titleSubTitle(let data):
            if let titleSubtitleView = self.tableView.dequeueHeaderFooter(for: TitleSubTitleHeaderFooterView.self) {
                titleSubtitleView.viewModel = data
                titleSubtitleView.setupViews()
                return titleSubtitleView
            } else {
                assertionFailure()
            }
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return safe(self.viewModel?.sectionData[section].cellData.count)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellData = self.viewModel?.sectionData[indexPath.section].cellData[indexPath.row] else {
            assertionFailure()
            return UITableViewCell()
        }
        
        switch cellData {
        case .deckList(data: let data):
            if let cell = self.tableView.dequeue(DeckListTableViewCell.self, for: indexPath) {
                cell.viewModel = CustomCollectionViewTableViewCellViewModel(listHeight: data.listHeight,
                                                                      layout: data.layout)
                cell.setupViews()
                
                return cell
            } else {
                assertionFailure()
            }
        case .horizontalList(let data):
            if let cell = self.tableView.dequeue(HorizontalListTableViewCell.self, for: indexPath) {
                cell.viewModel = CustomCollectionViewTableViewCellViewModel(listHeight: data.listHeight,
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

