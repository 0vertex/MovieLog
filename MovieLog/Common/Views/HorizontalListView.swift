//
//  HorizontalListView.swift
//  MovieLog
//
//  Created by Manish on 01/12/21.
//

import CoreUIKit
import UIKit

struct HorizontalListViewModel: BaseViewModel {
    
}

class HorizontalListView: UIView, BaseView {
    // MARK: - Properties
    var viewModel: HorizontalListViewModel? {
        didSet {
            self.setupData()
        }
    }
    
    /// Invoked when any item from the `collectionView` is selected
    var didTapListItem: ((HorizontalListViewModel) -> Void)?
    
    // MARK: - Views
    private let flowLayout = CollectionViewBannerLayout()
    private lazy var collectionView = BaseCollectionView(layout: self.flowLayout)
    
    // MARK: - Setups
    func setupViews() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView
            .set(identifier: "HorizontalListView.collectionView")
            .add(to: self)
            .allAnchorsSame(on: self)
        
        self.collectionView.register(BannerCell.self)
    }
    
    func setupData() {
        
    }
    
}

extension HorizontalListView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeue(BannerCell.self, for: indexPath)!
        cell.setupViews()

        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Page effect
        if scrollView == self.collectionView {
            var currentOffset = self.collectionView.contentOffset
            currentOffset.x += self.collectionView.frame.size.width / 2
            
            if let indexPath = self.collectionView.indexPathForItem(at: currentOffset) {
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }
    }
    
}
