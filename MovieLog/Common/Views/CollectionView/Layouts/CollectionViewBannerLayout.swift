//
//  CollectionViewBannerLayout.swift
//  MovieLog
//
//  Created by Manish on 03/12/21.
//

import CoreUIKit
import UIKit

class CollectionViewBannerLayout: BaseCollectionViewLayout {
    
    override func prepare() {
        super.prepare()
        
        // Generate attributes for cells
        for currentIndex in (0..<self.numberOfItemsInFirstSection) {
            let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: currentIndex, section: 0))
            attr.frame = CGRect(x: CGFloat(currentIndex) * self.cellWidth, y: 0.0,
                                width: self.cellWidth, height: self.cellHeight)
            self.cachedCollectionViewLayoutAttributes.append(attr)
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var matchedAttributes = [UICollectionViewLayoutAttributes]()
        
        guard let lastIndex = self.cachedCollectionViewLayoutAttributes.indices.last,
              let firstMatchedIndex = self.binarySearch(rect, fromIndex: 0,
                                                        toIndex: lastIndex,
                                                        onAxis: .horizontal) else { return matchedAttributes }
        
        // Check for matching attributes from end
        for attribute in self.cachedCollectionViewLayoutAttributes[..<firstMatchedIndex].reversed() {
            guard attribute.frame.maxX >= rect.minX else { break }
            matchedAttributes.append(attribute)
        }
        
        // Check for matching attributes from start
        for attribute in self.cachedCollectionViewLayoutAttributes[firstMatchedIndex...] {
            guard attribute.frame.minX <= rect.maxX else { break }
            matchedAttributes.append(attribute)
        }
        
        return matchedAttributes
    }
    
    // Pagination
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let safeCollectionView = self.collectionView else { return proposedContentOffset }
        
        // For horizontal scroll
        let nextCellIndex = round(safeCollectionView.contentOffset.x / self.cellWidth)
        var nextCellXAxisLocation = (self.cellWidth * nextCellIndex)
        // Error: Cell's have margin, to have the cell at the center, reude half of the margin
        nextCellXAxisLocation -= (self.horizontalMargin / 2)
        return CGPoint(x: nextCellXAxisLocation, y: 0)
    }
}
