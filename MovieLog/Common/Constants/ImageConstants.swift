//
//  ImageConstants.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import Foundation
import UIKit

struct ImageConstants {
    // Size : 24,32,64
    enum Icon: String {
        case dashboard = "Dashboard"
        case favourite = "Favourite"
        case settings = "Settings"
    }
    
    static func getImage(of type: Icon) -> UIImage? {
        return UIImage(named: type.rawValue)
    }
}
