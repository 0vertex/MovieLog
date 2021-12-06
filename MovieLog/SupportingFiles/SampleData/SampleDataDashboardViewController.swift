//
//  SampleDataDashboardViewController.swift
//  MovieLog
//
//  Created by Manish on 06/12/21.
//

import Foundation

struct SampleDataDashboardViewController {
    
    static let customTV = CustomTableViewModel(sectionData: [CustomTableSectionDataModel(type: .none,
                                                                                         cellData: [.horizontalList(data: .init(listHeight: 120,
                                                                                                                                layout: CollectionViewBannerLayout()))]),
                                                             CustomTableSectionDataModel(type: .titleSubTitle(data: TitleSubTitleHeaderFooterViewModel(title: "Upcoming")),
                                                                                         cellData: [.horizontalList(data: .init(listHeight: 200,
                                                                                                                                layout: CollectionViewColumnLayout(cellSizeType: .init(width: .threeFourths, height: .full))))]),
                                                             CustomTableSectionDataModel(type: .titleSubTitle(data: TitleSubTitleHeaderFooterViewModel(title: "2021 Hits")),
                                                                                         cellData: [.horizontalList(data: .init(listHeight: 250,
                                                                                                                                layout: CollectionViewColumnLayout(cellSizeType: .init(width: .half, height: .half))))]),
                                                             CustomTableSectionDataModel(type: .titleSubTitle(data: TitleSubTitleHeaderFooterViewModel(title: "Top Rated")),
                                                                                         cellData: [.horizontalList(data: .init(listHeight: 250,
                                                                                                                                layout: CollectionViewColumnLayout(cellSizeType: .init(width: .threeFourths, height: .half))))]),
                                                             CustomTableSectionDataModel(type: .titleSubTitle(data: TitleSubTitleHeaderFooterViewModel(title: "Top Actors")),
                                                                                         cellData: [.horizontalList(data: .init(listHeight: 250,
                                                                                                                                layout: CollectionViewColumnLayout(cellSizeType: .init(width: .threeFourths, height: .oneThird))))])])
    
}
