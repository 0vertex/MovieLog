//
//  CollectionViewColumnLayout.swift
//  MovieLog
//
//  Created by Manish on 04/12/21.
//

import UIKit

enum SizeType {
    case full
    case threeFourths
    case half
    case custom(size: CGFloat)
}

struct ViewSize {
    let width: SizeType
    let height: SizeType
}

class CollectionViewColumnLayout: BaseCollectionViewFlowLayout {
    
    private let cellSizeType: ViewSize
    
    init(spaceBetweenCells: CGFloat = 8,
         horizontalMargin: CGFloat = 16,
         cellSizeType: ViewSize = ViewSize(width: .threeFourths, height: .custom(size: 60))) {

        self.cellSizeType = cellSizeType
        super.init(spaceBetweenCells: spaceBetweenCells, horizontalMargin: horizontalMargin)
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
                                                               cellSizeParamValue: collectionView.bounds.inset(by: collectionView.layoutMargins).width)
        let cellWidth = calculatedCellWidth - (self.horizontalMargin * 2)

        let calculatedCellHeight = self.calculateSizeParamValue(using: self.cellSizeType.height,
                                                                cellSizeParamValue: collectionView.bounds.inset(by: collectionView.layoutMargins).height)

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
            return cellSizeParamValue / 2
        case .custom(let size):
            return size
        }
    }
    
}
