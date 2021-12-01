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
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = BaseCollectionView(layout: self.flowLayout)
    
    private let isPagingEnabled: Bool
    private let cellSize: CGSize
    
    init(isPagingEnabled: Bool = false, cellSize: CGSize) {
        self.isPagingEnabled = isPagingEnabled
        self.cellSize = cellSize

        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    func setupViews() {
        self.flowLayout.scrollDirection = .horizontal
        self.flowLayout.minimumInteritemSpacing = .zero
        self.flowLayout.minimumLineSpacing = .zero
        self.flowLayout.itemSize = self.cellSize
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = self.isPagingEnabled
        self.collectionView.backgroundColor = .clear
        
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
    
}
