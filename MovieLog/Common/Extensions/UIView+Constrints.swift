//
//  UIView+Constrints.swift
//  MovieLog
//
//  Created by Manish on 02/12/21.
//

import CoreUIKit
import UIKit

extension UIView {
    
    /// Sets leading, trailing, top and bottom anchors equal to parent view's safe edge anchors
    /// - Parameters:
    ///   - parentView: a view on which current view (child view) needs to be constrained
    ///   - margin: margin around the constraints
    /// - Returns: current view
    @discardableResult
    func allSafeEdgeAnchorsSame(on parentView: UIView,
                                margin: UIEdgeInsets = .zero) -> Self {
        self.leading(with: parentView.safeAreaLayoutGuide.leadingAnchor, margin: margin.left)
            .trailing(with: parentView.safeAreaLayoutGuide.trailingAnchor, margin: margin.right)
            .top(with: parentView.safeAreaLayoutGuide.topAnchor, margin: margin.top)
            .bottom(with: parentView.safeAreaLayoutGuide.bottomAnchor, margin: margin.bottom)
        
        return self
    }
    
}
