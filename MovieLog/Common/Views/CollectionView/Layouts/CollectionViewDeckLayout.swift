//
//  CollectionViewDeckLayout.swift
//  MovieLog
//
//  Created by Manish on 11/12/21.
//

import UIKit

// Partially working
class CollectionViewDeckLayout: BaseCollectionViewLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let safeCollectionView = self.collectionView else { return }
        
        self.cellWidth = safeCollectionView.bounds.width
        self.cachedCollectionViewContentSize =  CGSize(width: self.cellWidth,
                                                       height: self.cellHeight * CGFloat(self.numberOfItemsInFirstSection))
        
        // Generate attributes for cells
        for currentIndex in (0..<self.numberOfItemsInFirstSection) {
            self.cachedCollectionViewLayoutAttributes.append(self.getAttributes(for: IndexPath(row: currentIndex, section: 0)))
        }
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
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.getAttributes(for: indexPath)
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.getAttributes(for: itemIndexPath)
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = self.getAttributes(for: itemIndexPath)
        attr.zIndex += 1
        return attr
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

extension CollectionViewDeckLayout {
    
    func getAttributes(for indexPath: IndexPath) -> UICollectionViewLayoutAttributes {
        let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: indexPath.row, section: indexPath.section))
        let deltaIndex = self.numberOfItemsInFirstSection - indexPath.row
        
        attr.zIndex = deltaIndex
        attr.frame = CGRect(x: 0, y: CGFloat(indexPath.row * 5),
                            width: self.cellWidth,
                            height: self.cellHeight)
        
        if indexPath.row < 4 {
            attr.transform = CGAffineTransform.identity
                .scaledBy(x: CGFloat(indexPath.row) * 0.25, y: CGFloat(indexPath.row) * 0.25)
        }
        
        return attr
    }
    
}

class DeckLayoutAttributes: UICollectionViewLayoutAttributes {
    
}
