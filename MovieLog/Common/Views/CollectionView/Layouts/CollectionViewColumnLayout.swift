//
//  CollectionViewColumnLayout.swift
//  MovieLog
//
//  Created by Manish on 04/12/21.
//

import UIKit

enum SizeType {
    case full
    case threeFourths // (3/4)
    case half
    case oneThird // (1/3)
    case custom(size: CGFloat)
}

struct ViewSize {
    let width: SizeType
    let height: SizeType
}

class CollectionViewColumnLayout: BaseCollectionViewFlowLayout {
    
    private let cellSizeType: ViewSize
    
    init(horizontalMargin: CGFloat = 5,
         cellSizeType: ViewSize = ViewSize(width: .threeFourths, height: .oneThird)) {

        self.cellSizeType = cellSizeType
        super.init(horizontalMargin: horizontalMargin)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else { return }
        self.setupCollectionViewConfigs()
        
        // Setup cell
        let calculatedCellWidth = self.calculateSizeParamValue(using: self.cellSizeType.width,
                                                               cellSizeParamValue: collectionView.bounds.width)
        let cellWidth = calculatedCellWidth - (self.horizontalMargin * 2)

        let calculatedCellHeight = self.calculateSizeParamValue(using: self.cellSizeType.height,
                                                                cellSizeParamValue: collectionView.bounds.height)

        self.itemSize = CGSize(width: cellWidth, height: calculatedCellHeight)
    }
    
}

extension CollectionViewColumnLayout {
    
    func calculateSizeParamValue(using sizeType: SizeType, cellSizeParamValue: CGFloat) -> CGFloat {
        switch sizeType {
        case .full:
            return cellSizeParamValue
        case .threeFourths:
            let quarterOfCellSizeParamValue = cellSizeParamValue / 4
            return quarterOfCellSizeParamValue * 3
        case .half:
            return (cellSizeParamValue / 2)
        case .oneThird:
            return (cellSizeParamValue / 3)
        case .custom(let size):
            return size
        }
    }
    
}
