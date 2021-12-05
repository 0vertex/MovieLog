//
//  UIFont+Init.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import UIKit

extension UIFont {
    enum FontType: String {
        case thin = "Roboto-Thin"
        case thinItalic = "Roboto-ThinItalic"
        case light = "Roboto-Light"
        case lightItalic = "Roboto-LightItalic"
        case regular = "Roboto-Regular"
        case regularItalic = "Roboto-Italic"
        case medium = "Roboto-Medium"
        case mediumItalic = "Roboto-MediumItalic"
        case bold = "Roboto-Bold"
        case boldItalic = "Roboto-BoldItalic"
        case black = "Roboto-Black"
        case blackItalic = "Roboto-BlackItalic"
    }
    
    static func getFont(of type: FontType, with size: CGFloat) -> UIFont? {
        return UIFont(name: type.rawValue, size: size)
    }
}
