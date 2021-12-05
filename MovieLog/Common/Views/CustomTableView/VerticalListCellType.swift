//
//  VerticalListCellType.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import Foundation
import UIKit

enum VerticalListCellType {
    case horizontalList(data: HorizontalListTableViewCellViewModel)
    
    var cellType: UITableViewCell.Type {
        switch self {
        case .horizontalList:
            return HorizontalListTableViewCell.self
        }
    }
}
