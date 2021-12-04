//
//  MovieOverviewCell.swift
//  MovieLog
//
//  Created by Manish on 04/12/21.
//

import CoreUIKit
import UIKit

struct MovieOverviewCellViewModel: BaseViewModel {
    let title: String
    let description: String
    let creators: [String]
}

class MovieOverviewCell: BaseTableViewCell<MovieOverviewCellViewModel> {
    
    private let titleLabel = UILabel()
    private let descritionLabel = UILabel()
    private let creatorsTitleLabel = UILabel()
    private let creatorsLabel = UILabel()
    private lazy var rootStackView = UIStackView.create(with: [self.titleLabel, self.descritionLabel, self.creatorsTitleLabel, self.creatorsLabel])
    
    override func setupViews() {
        super.setupViews()
        
        self.descritionLabel.numberOfLines = .zero
        self.creatorsLabel.numberOfLines = .zero
        
        self.rootStackView
            .set(identifier: "MovieOverviewCell.rootStackView")
            .add(to: self.contentView)
            .allAnchorsSame(on: self.contentView)
    }
    
    override func setupData() {
        super.setupData()
        
        self.titleLabel.text = self.viewModel?.title
        self.descritionLabel.text = self.viewModel?.description
        self.creatorsTitleLabel.text = "Creators"
        self.creatorsLabel.text = self.viewModel?.creators.joined(separator: "\n")
    }
    
}
