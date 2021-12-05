//
//  CustomTableViewModel.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import CoreUIKit

struct CustomTableSectionDataModel: SectionDataModel {
    var type: VerticalListSectionType
    var cellData: [VerticalListCellType]
}

struct CustomTableViewModel: BaseViewModel, CustomTableViewSectionViewModel {
    var sectionData: [CustomTableSectionDataModel]
}
