//
//  MovieDetailsHeaderView.swift
//  MovieLog
//
//  Created by Manish on 04/12/21.
//

import CoreUIKit
import UIKit

struct MovieDetailsHeaderViewModel: BaseViewModel {
    
}

class MovieDetailsHeaderView: UIView, BaseView {
    
    var viewModel: MovieDetailsHeaderViewModel? {
        didSet {
            self.setupData()
        }
    }
    
    private let titleLabel = UILabel()
    
    func setupViews() {
        self.backgroundColor = .red
        self.layer.zPosition = -9999
        
        self.titleLabel
            .set(identifier: "MovieDetailsHeaderView.titleLabel")
            .add(to: self)
            .allAnchorsSame(on: self)
            .with(height: 250)
    }
    
    func setupData() {
        self.titleLabel.text = "Lorem Ipsm"
    }
    
}
