//
//  CollectionViewBannerLayout.swift
//  MovieLog
//
//  Created by Manish on 03/12/21.
//

import CoreUIKit
import UIKit

class CollectionViewBannerLayout: BaseCollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else { return }
        self.setupCollectionViewConfigs()
        
        // Setup cell
        let availableWidth = collectionView.bounds.width
        let availableHeight = collectionView.bounds.height
        let cellWidth = availableWidth - 50
        
        self.itemSize = CGSize(width: cellWidth, height: availableHeight)
    }
    
}
