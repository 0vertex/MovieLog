//
//  CustomTableViewModel.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import CoreUIKit

struct CustomTableViewModel: BaseViewModel, CustomTableViewSectionViewModel {
    var type: VerticalListSectionType?
    var sectionData: SectionDataModel?

    var cellData: [VerticalListCellType]
}
