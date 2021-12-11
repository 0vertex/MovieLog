//
//  BaseCollectionViewLayout.swift
//  MovieLog
//
//  Created by Manish on 04/12/21.
//

import UIKit

class BaseCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    // MARK: - Properties
    // space before first and after last cell
    let horizontalMargin: CGFloat
    
    init(horizontalMargin: CGFloat = 5) {
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
        self.minimumLineSpacing = .zero
    }
    
    func setupCollectionViewConfigs() {
        self.collectionView?.contentInset = UIEdgeInsets(leftRight: self.horizontalMargin)
        self.collectionView?.backgroundColor = .clear
        self.collectionView?.showsHorizontalScrollIndicator = false
    }
    
}
