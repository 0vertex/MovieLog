//
//  CustomTableViewSectionViewModel.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import Foundation

protocol SectionDataModel {
    var type: VerticalListSectionType { get set }
    var cellData: [VerticalListCellType] { get set }
}

protocol CustomTableViewSectionViewModel {
    associatedtype SectionViewModel: SectionDataModel
    var sectionData: [SectionViewModel] { get set }
}
