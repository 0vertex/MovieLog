//
//  CustomTableViewSectionViewModel.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import Foundation

protocol SectionDataModel { }

protocol CustomTableViewSectionViewModel {
    var type: VerticalListSectionType? { get set }

    var sectionData: SectionDataModel? { get set }
    
    var cellData: [VerticalListCellType] { get set }
}
