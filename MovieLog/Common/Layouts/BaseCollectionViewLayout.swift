//
//  BaseCollectionViewLayout.swift
//  MovieLog
//
//  Created by Manish on 04/12/21.
//

import UIKit

class BaseCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    // MARK: - Properties
    let horizontalMargin: CGFloat
    let spaceBetweenCells: CGFloat
    
    init(spaceBetweenCells: CGFloat = 8, horizontalMargin: CGFloat = 15) {
        self.spaceBetweenCells = spaceBetweenCells
        self.horizontalMargin = horizontalMargin
        super.init()
        
        self.setupLayoutConfigs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension BaseCollectionViewFlowLayout {
    
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
