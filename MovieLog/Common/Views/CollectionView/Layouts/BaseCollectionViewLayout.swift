//
//  BaseUICollectionViewLayout.swift
//  MovieLog
//
//  Created by Manish on 11/12/21.
//

import UIKit

enum LayoutAxis {
    case horizontal
    case vertical
}

class BaseCollectionViewLayout: UICollectionViewLayout {
    let horizontalMargin: CGFloat = 30
    var cellWidth: CGFloat = .zero
    var cellHeight: CGFloat = .zero
    var cachedCollectionViewContentSize: CGSize = .zero
    var cachedCollectionViewLayoutAttributes = [UICollectionViewLayoutAttributes]()
    private(set) var numberOfItemsInFirstSection: Int = .zero
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else { return }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        self.cellWidth = collectionView.bounds.width - horizontalMargin
        self.cellHeight = collectionView.bounds.height
        self.numberOfItemsInFirstSection = collectionView.numberOfItems(inSection: 0)
        self.cachedCollectionViewContentSize = CGSize(width: (self.cellWidth * CGFloat(self.numberOfItemsInFirstSection)), height: self.cellHeight)
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
    
}


extension BaseCollectionViewLayout {
    
    func binarySearch(_ rect: CGRect,
                      fromIndex startIndex: Int,
                      toIndex endIndex: Int,
                      onAxis layoutAxis: LayoutAxis) -> Int? {
        if endIndex < startIndex { return nil }
        
        let midIndex = (startIndex + endIndex) / 2
        let midAttribute = self.cachedCollectionViewLayoutAttributes[midIndex]
        
        if midAttribute.frame.intersects(rect) {
            return midIndex
        } else {
            var isRightSide = false
            
            if layoutAxis == .horizontal {
                isRightSide = midAttribute.frame.maxX < rect.minX
            } else {
                isRightSide = midAttribute.frame.maxY < rect.minY
            }
            
            if isRightSide {
                return self.binarySearch(rect, fromIndex: (midIndex + 1), toIndex: endIndex, onAxis: layoutAxis)
            } else {
                return self.binarySearch(rect, fromIndex: startIndex, toIndex: (midIndex - 1), onAxis: layoutAxis)
            }
        }
    }
    
}
