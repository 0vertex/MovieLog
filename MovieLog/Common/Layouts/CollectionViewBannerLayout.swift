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
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let availableHeight = collectionView.bounds.inset(by: collectionView.layoutMargins).height
        let cellWidth = availableWidth - (self.horizontalMargin * 2)
        
        self.itemSize = CGSize(width: cellWidth, height: availableHeight)
    }
    
}
