//
//  HorizontalListTableViewCell.swift
//  MovieLog
//
//  Created by Manish on 02/12/21.
//

import CoreUIKit
import UIKit

class HorizontalListTableViewCell: BaseTableViewCell<CustomCollectionViewTableViewCellViewModel> {
    private var horizontalListView: CustomCollectionView?
    
    override func setupViews() {
        super.setupViews()
        self.contentView.backgroundColor = .clear
        // Clear dark bg color on iOS 14 and above
        if #available(iOS 14.0, *) {
            self.backgroundConfiguration = .clear()
        }
        
        if self.horizontalListView == nil {
            self.horizontalListView = CustomCollectionView(layout: self.viewModel?.layout)
        }
        
        self.horizontalListView?
            .set(identifier: "HorizontalListView")
            .add(to: self.contentView)
            .allAnchorsSame(on: self.contentView)
            .with(height: self.viewModel?.listHeight ?? 100)

        self.horizontalListView?.setupViews()
        self.horizontalListView?.didTapListItem = { [weak self] item in
            print(item)
        }
    }
    
}
