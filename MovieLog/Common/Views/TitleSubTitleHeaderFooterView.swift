//
//  TitleSubTitleView.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import CoreUIKit
import UIKit

struct TitleSubTitleHeaderFooterViewModel: BaseViewModel {
    let title: String
    var subTitle: String = ""
}

class TitleSubTitleHeaderFooterView: UITableViewHeaderFooterView, BaseView {
    // MARK: - Properties
    var viewModel: TitleSubTitleHeaderFooterViewModel?
    
    private let titleLabel = UILabel.bold(with: 25)
    private let subTitleLabel = UILabel.bold(with: 16)
    private lazy var rootStackView = UIStackView.create(with: [self.titleLabel, self.subTitleLabel])
    
    // MARK: - Setups
    func setupViews() {
        self.subTitleLabel.isHidden = self.viewModel?.subTitle.isEmpty ?? true
        
        self.rootStackView
            .set(identifier: "TitleSubTitleView.rootStackView")
            .add(to: self)
            .allAnchorsSame(on: self)
    }
    
    func setupData() {
        self.titleLabel.text = self.viewModel?.title
        self.subTitleLabel.text = self.viewModel?.subTitle
    }
}
