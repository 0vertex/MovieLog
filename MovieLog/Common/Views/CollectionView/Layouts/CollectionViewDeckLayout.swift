//
//  CollectionViewDeckLayout.swift
//  MovieLog
//
//  Created by Manish on 11/12/21.
//

import UIKit

// Partially working
class CollectionViewDeckLayout: BaseCollectionViewLayout {
    
    private var previousScrollYPosition = CGFloat.zero
    
    override func prepare() {
        super.prepare()
        
        guard let safeCollectionView = self.collectionView else { return }
        
        self.cellWidth = safeCollectionView.bounds.width
        self.cachedCollectionViewContentSize =  CGSize(width: self.cellWidth,
                                                       height: self.cellHeight * CGFloat(self.numberOfItemsInFirstSection))
        
        // Generate attributes for cells
        self.cachedCollectionViewLayoutAttributes = []
        for currentIndex in (0..<self.numberOfItemsInFirstSection) {
            self.cachedCollectionViewLayoutAttributes.append(self.getAttributes(for: IndexPath(row: currentIndex, section: 0)))
        }

        self.previousScrollYPosition = safeCollectionView.contentOffset.y
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var matchedAttributes = [UICollectionViewLayoutAttributes]()
        
        guard let lastIndex = self.cachedCollectionViewLayoutAttributes.indices.last,
              let firstMatchedIndex = self.binarySearch(rect, fromIndex: 0,
                                                        toIndex: lastIndex,
                                                        onAxis: .vertical) else { return matchedAttributes }
        
        // Check for matching attributes from end
        for attribute in self.cachedCollectionViewLayoutAttributes[..<firstMatchedIndex].reversed() {
            guard attribute.frame.maxY >= rect.minY else { break }
            matchedAttributes.append(attribute)
        }
        
        // Check for matching attributes from start
        for attribute in self.cachedCollectionViewLayoutAttributes[firstMatchedIndex...] {
            guard attribute.frame.minY <= rect.maxY else { break }
            matchedAttributes.append(attribute)
        }
        
        return matchedAttributes
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}

extension CollectionViewDeckLayout {
    
    func getAttributes(for indexPath: IndexPath) -> UICollectionViewLayoutAttributes {
        let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: indexPath.row, section: indexPath.section))
        let deltaIndex = self.numberOfItemsInFirstSection - indexPath.row
        
        if let safeYScrollPosition = self.collectionView?.contentOffset.y {
            var yPosition = CGFloat.zero
            let nextVisibleIndex = self.getNextVisibleIndex(using: safeYScrollPosition)
            let currentRowIndex = indexPath.row
            
            if (safeYScrollPosition == .zero) || (nextVisibleIndex == .zero) || (currentRowIndex > nextVisibleIndex) {
                yPosition = CGFloat(currentRowIndex * 5)
            } else {
                if currentRowIndex < nextVisibleIndex {
                    yPosition = (safeYScrollPosition - (CGFloat(currentRowIndex) * self.cellHeight))
                } else {
                    yPosition = safeYScrollPosition
                }
            }
            
            attr.zIndex = Int(yPosition) / deltaIndex
            attr.frame = CGRect(x: 0, y: yPosition,
                                width: self.cellWidth,
                                height: self.cellHeight)
        }
        
        return attr
    }
    
    func getNextVisibleIndex(using yPosition: CGFloat) -> Int {
        if yPosition <= .zero { return .zero }
        
        let index = Int(ceil(yPosition / self.cellHeight))
        // Scrolling up
        if self.previousScrollYPosition < yPosition {
            return index
        } else { // Scrolling down
            return (index > 0) ? (index - 1) : 0
        }
    }
    
}
