//
//  CollectionViewDeckLayout.swift
//  MovieLog
//
//  Created by Manish on 11/12/21.
//

import UIKit

class CollectionViewDeckLayout: BaseCollectionViewLayout {
    
    override func prepare() {
        super.prepare()
        
        self.cachedCollectionViewContentSize = CGSize(width: self.cellWidth, height: (self.cellHeight * CGFloat(self.numberOfItemsInFirstSection)))
        
        // Generate attributes for cells
        for currentIndex in (0..<self.numberOfItemsInFirstSection) {
            let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: currentIndex, section: 0))
            attr.frame = CGRect(x: 0, y: CGFloat(currentIndex),
                                width: self.cellWidth, height: self.cellHeight)
            self.cachedCollectionViewLayoutAttributes.append(attr)
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
    
}
