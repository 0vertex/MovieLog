//
//  VerticalListCellType.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import Foundation
import UIKit

enum VerticalListCellType {
    case deckList(data: CustomCollectionViewTableViewCellViewModel)
    case horizontalList(data: CustomCollectionViewTableViewCellViewModel)
    
    var cellType: UITableViewCell.Type {
        switch self {
        case .deckList:
            return DeckListTableViewCell.self
        case .horizontalList:
            return HorizontalListTableViewCell.self
        }
    }
}
