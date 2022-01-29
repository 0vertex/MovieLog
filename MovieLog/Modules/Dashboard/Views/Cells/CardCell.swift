//
//  CardCell.swift
//  MovieLog
//
//  Created by Manish on 01/12/21.
//
import CoreUIKit
import UIKit

struct CardCellViewModel: BaseViewModel {
    let currentIndex: Int
}

class CardCell: BaseCollectionViewCell<CardCellViewModel> {
    
    private let rootView = UIView()
    private let titleLabel = UILabel.bold(with: 25)
    
    override func setupViews() {
        super.setupViews()
        
        self.titleLabel.textAlignment = .center
        self.titleLabel
            .set(identifier: "BannerCell.titleLabel")
            .add(to: self.rootView)
            .allAnchorsSame(on: self.rootView)
        
        self.rootView.backgroundColor = .red
        
        self.rootView.layer.cornerRadius = 8
        self.rootView.layer.masksToBounds = true
        self.rootView.layer.borderWidth = 1
        
        self.rootView
            .set(identifier: "BannerCell.rootView")
            .add(to: self.contentView)
            .allAnchorsSame(on: self.contentView, margin: UIEdgeInsets(topBottom: 5, leftRight: 5))
    }
    
    override func setupData() {
        super.setupData()
        
        self.titleLabel.text = self.viewModel?.currentIndex.description
    }
    
}
