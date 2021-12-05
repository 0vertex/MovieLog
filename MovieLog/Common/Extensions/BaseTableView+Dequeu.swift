//
//  BaseTableView+Dequeu.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import CoreUIKit
import UIKit

extension BaseTableView {
    
    func registerHeaderFooter<AnyViewType: UIView>(_ viewType: AnyViewType.Type) {
        self.register(AnyViewType.self, forHeaderFooterViewReuseIdentifier: String(describing: viewType))
    }
    
    func dequeueHeaderFooter<HeaderFooterType: UITableViewHeaderFooterView>(for type: HeaderFooterType.Type) -> HeaderFooterType? {
        self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: type)) as? HeaderFooterType
    }
    
}
