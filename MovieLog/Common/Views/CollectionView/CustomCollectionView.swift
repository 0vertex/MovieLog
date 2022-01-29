//
//  HorizontalListView.swift
//  MovieLog
//
//  Created by Manish on 01/12/21.
//

import CoreUIKit
import UIKit

struct CustomCollectionViewModel: BaseViewModel {
    
}

class CustomCollectionView: UIView, BaseView {
    // MARK: - Properties
    var viewModel: CustomCollectionViewModel? {
        didSet {
            self.setupData()
        }
    }
    
    /// Invoked when any item from the `collectionView` is selected
    var didTapListItem: ((CustomCollectionViewModel) -> Void)?
    
    // MARK: - Views
    private let collectionViewLayout: UICollectionViewLayout
    private let collectionView: BaseCollectionView

    init(layout: UICollectionViewLayout?) {
        self.collectionViewLayout = layout ?? UICollectionViewFlowLayout()
        self.collectionView = BaseCollectionView(layout: self.collectionViewLayout)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    func setupViews() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView
            .set(identifier: "HorizontalListView.collectionView")
            .add(to: self)
            .allAnchorsSame(on: self)
        
        self.collectionView.register(CardCell.self)
    }
    
    func setupData() {
        
    }
    
}

extension CustomCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeue(CardCell.self, for: indexPath)!
        cell.viewModel = CardCellViewModel(currentIndex: indexPath.row)
        cell.setupViews()

        return cell
    }
    
}
