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
    private let defaultSize: CGFloat = 50
    private lazy var horizontalListView = HorizontalListView(isPagingEnabled: self.viewModel?.isPagingEnabled ?? false,
                                                             spaceBetweenCells: self.viewModel?.spaceBetweenCells ?? self.defaultSize,
                                                             cellSize: CGSize(width: self.viewModel?.cellWidth ?? self.defaultSize,
                                                                              height: self.viewModel?.listHeight ?? self.defaultSize))
    
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
            .with(height: self.viewModel?.listHeight ?? self.defaultSize)

        self.horizontalListView.setupViews()
        self.horizontalListView.didTapListItem = { [weak self] item in
            print(item)
        }
    }
    
}
