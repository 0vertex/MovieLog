//
//  VerticalListSectionType.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import Foundation
import UIKit

enum VerticalListSectionType {
    case none
    case titleSubTitle(data: TitleSubTitleHeaderFooterViewModel)
    
    var viewType: UITableViewHeaderFooterView.Type? {
        switch self {
        case .none:
            return nil
        case .titleSubTitle(_):
            return TitleSubTitleHeaderFooterView.self
        }
    }
}
