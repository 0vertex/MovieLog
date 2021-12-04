//
//  UIStackView+Init.swift
//  MovieLog
//
//  Created by Manish on 04/12/21.
//

import UIKit

extension UIStackView {
    
    static func create(with arrangedSubViews: [UIView],
                       axis: NSLayoutConstraint.Axis = .vertical,
                       alignment: Alignment = .fill,
                       destribution: Distribution = .fill,
                       spacing: CGFloat = 10) -> UIStackView {
        let sv = UIStackView()
        arrangedSubViews.forEach {
            sv.addArrangedSubview($0)
        }

        sv.axis = axis
        sv.alignment = alignment
        sv.distribution = destribution
        sv.spacing = spacing

        return sv
    }
    
}
