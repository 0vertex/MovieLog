//
//  UILabel+Init.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import UIKit

extension UILabel {
    
    static func thin(with size: CGFloat,
                     isItalic: Bool = false) -> UILabel {
        return self.createLabel(with: UIFont.getFont(of: isItalic ? .thinItalic : .thin,
                                                     with: size))
    }
    
    static func light(with size: CGFloat,
                      isItalic: Bool = false) -> UILabel {
        return self.createLabel(with: UIFont.getFont(of: isItalic ? .lightItalic : .light,
                                                     with: size))
    }
    
    static func regular(with size: CGFloat,
                        isItalic: Bool = false) -> UILabel {
        return self.createLabel(with: UIFont.getFont(of: isItalic ? .regularItalic : .regular,
                                                     with: size))
    }
    
    static func medium(with size: CGFloat,
                       isItalic: Bool = false) -> UILabel {
        return self.createLabel(with: UIFont.getFont(of: isItalic ? .mediumItalic : .medium,
                                                     with: size))
    }
    
    static func bold(with size: CGFloat,
                     isItalic: Bool = false) -> UILabel {
        return self.createLabel(with: UIFont.getFont(of: isItalic ? .boldItalic : .bold,
                                                     with: size))
    }
    
    static func black(with size: CGFloat,
                     isItalic: Bool = false) -> UILabel {
        return self.createLabel(with: UIFont.getFont(of: isItalic ? .blackItalic : .black,
                                                     with: size))
    }
    
}

extension UILabel {
    
    static func createLabel(with font: UIFont?) -> UILabel {
        let lbl = UILabel()
        lbl.font = font
        lbl.numberOfLines = .zero
        return lbl
    }
    
}
