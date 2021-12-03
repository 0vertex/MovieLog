//
//  HorizontalListTableViewCell.swift
//  MovieLog
//
//  Created by Manish on 02/12/21.
//

import CoreUIKit
import UIKit

struct HorizontalListTableViewCellViewModel: BaseViewModel {
    let isPagingEnabled = true
    let listHeight: CGFloat = 150
    let spaceBetweenCells: CGFloat = 5
    let cellWidth: CGFloat = 300
}

class HorizontalListTableViewCell: BaseTableViewCell<HorizontalListTableViewCellViewModel> {
    private lazy var horizontalListView = HorizontalListView()
    
    override func setupViews() {
        super.setupViews()
        self.contentView.backgroundColor = .clear
        // Clear dark bg color on iOS 14 and above
        if #available(iOS 14.0, *) {
            self.backgroundConfiguration = .clear()
        }
        
        self.horizontalListView
            .set(identifier: "HorizontalListView")
            .add(to: self.contentView)
            .allAnchorsSame(on: self.contentView)
            .with(height: self.viewModel?.listHeight ?? 100)

        self.horizontalListView.setupViews()
        self.horizontalListView.didTapListItem = { [weak self] item in
            print(item)
        }
    }
    
}
