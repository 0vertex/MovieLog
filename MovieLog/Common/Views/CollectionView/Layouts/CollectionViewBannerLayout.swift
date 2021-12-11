//
//  CollectionViewBannerLayout.swift
//  MovieLog
//
//  Created by Manish on 03/12/21.
//

import CoreUIKit
import UIKit

class CollectionViewBannerLayout: UICollectionViewLayout {
    
    private var cellWidth: CGFloat = .zero
    private var cellHeight: CGFloat = .zero
    private let horizontalMargin: CGFloat = 30
    private var previousScrollXAxisLocation: CGFloat = .zero
    private var numberOfItemsInFirstSection: Int = .zero
    private var cachedCollectionViewContentSize: CGSize = .zero
    private var cachedCollectionViewLayoutAttributes = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else { return }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        self.cellWidth = collectionView.bounds.width - horizontalMargin
        self.cellHeight = collectionView.bounds.height
        self.numberOfItemsInFirstSection = collectionView.numberOfItems(inSection: 0)
        self.cachedCollectionViewContentSize = CGSize(width: (self.cellWidth * CGFloat(self.numberOfItemsInFirstSection)), height: self.cellHeight)
        
        // Generate attributes for cells
        for currentIndex in (0..<self.numberOfItemsInFirstSection) {
            let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: currentIndex, section: 0))
            attr.frame = CGRect(x: CGFloat(currentIndex) * self.cellWidth, y: 0.0,
                                width: self.cellWidth, height: self.cellHeight)
            self.cachedCollectionViewLayoutAttributes.append(attr)
        }
        
    }
    
    override var collectionViewContentSize: CGSize {
        return cachedCollectionViewContentSize
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return (newBounds.size.equalTo(collectionView.bounds.size) == false)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.cachedCollectionViewLayoutAttributes[indexPath.row]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var matchedAttributes = [UICollectionViewLayoutAttributes]()
        
        guard let lastIndex = self.cachedCollectionViewLayoutAttributes.indices.last,
              let firstMatchedIndex = self.binarySearch(rect, fromIndex: 0, toIndex: lastIndex) else { return matchedAttributes }
        
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

extension CollectionViewBannerLayout {
    
    func binarySearch(_ rect: CGRect, fromIndex startIndex: Int, toIndex endIndex: Int) -> Int? {
        if endIndex < startIndex { return nil }

        let midIndex = (startIndex + endIndex) / 2
        let midAttribute = self.cachedCollectionViewLayoutAttributes[midIndex]
        
        if midAttribute.frame.intersects(rect) {
            return midIndex
        } else {
            if midAttribute.frame.maxX < rect.minX {
                return self.binarySearch(rect, fromIndex: (midIndex + 1), toIndex: endIndex)
            } else {
                return self.binarySearch(rect, fromIndex: startIndex, toIndex: (midIndex - 1))
            }
        }
    }
    
}
