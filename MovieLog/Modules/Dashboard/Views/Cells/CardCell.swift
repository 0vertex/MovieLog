//
//  CardCell.swift
//  MovieLog
//
//  Created by Manish on 01/12/21.
//

import CoreUIKit
import UIKit

class CardCellViewModel: BaseViewModel {
    
}

class CardCell: BaseCollectionViewCell<CardCellViewModel> {
    
    private let rootView = UIView()
    
    override func setupViews() {
        super.setupViews()
        self.rootView.backgroundColor = .red
        
        self.rootView.layer.cornerRadius = 8
        self.rootView.layer.masksToBounds = true
        
        self.rootView
            .set(identifier: "BannerCell.rootView")
            .add(to: self.contentView)
            .allAnchorsSame(on: self.contentView, margin: UIEdgeInsets(topBottom: 5, leftRight: 5))
    }
    
}
