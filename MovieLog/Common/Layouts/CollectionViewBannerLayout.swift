//
//  CollectionViewBannerLayout.swift
//  MovieLog
//
//  Created by Manish on 03/12/21.
//

import CoreUIKit
import UIKit

class CollectionViewBannerLayout: UICollectionViewFlowLayout {
    
    // MARK: - Properties
    private let horizontalMargin: CGFloat = 15
    private let spaceBetweenCells: CGFloat
    
    init(spaceBetweenCells: CGFloat = 8) {
        self.spaceBetweenCells = spaceBetweenCells
        super.init()
        
        self.setupLayoutConfigs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else { return }
        self.setupCollectionViewConfigs()
        
        // Setup cell
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let availableHeight = collectionView.bounds.inset(by: collectionView.layoutMargins).height
        let cellWidth = availableWidth - (self.horizontalMargin * 2)
        
        self.itemSize = CGSize(width: cellWidth, height: availableHeight)
    }
    
}

extension CollectionViewBannerLayout {
    
    func setupLayoutConfigs() {
        self.scrollDirection = .horizontal
        self.minimumInteritemSpacing = .zero
        self.minimumLineSpacing = self.spaceBetweenCells
    }
    
    func setupCollectionViewConfigs() {
        self.collectionView?.contentInset = UIEdgeInsets(leftRight: 8)
        self.collectionView?.backgroundColor = .clear
        self.collectionView?.showsHorizontalScrollIndicator = false
    }
    
}
