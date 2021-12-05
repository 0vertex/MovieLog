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
    
    private let titleLabel = UILabel.bold(with: 25)
    private let descritionLabel = UILabel.regular(with: 16)
    private let creatorsTitleLabel = UILabel.bold(with: 18)
    private let creatorsLabel = UILabel.medium(with: 16)
    private lazy var rootStackView = UIStackView.create(with: [self.titleLabel, self.descritionLabel, self.creatorsTitleLabel, self.creatorsLabel])
    
    override func setupViews() {
        super.setupViews()
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
