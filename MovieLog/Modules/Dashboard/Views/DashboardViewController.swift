//
//  DashboardViewController.swift
//  MovieLog
//
//  Created by Manish on 01/12/21.
//

import CoreUIKit
import UIKit

class DashboardViewController: UIViewController, BaseView {
    
    // MARK: - Properties
    var viewModel: DashboardViewControllerViewModel?
    let dashboardVerticalList = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupData()
        self.setupViews()
    }
    
    func setupViews() {
        self.dashboardVerticalList.setupViews()
        self.dashboardVerticalList
            .set(identifier: "dashboardVerticalList")
            .add(to: self.view)
            .allSafeEdgeAnchorsSame(on: self.view, margin: UIEdgeInsets(topBottom: 5))
    }
    
    func setupData() {
        self.viewModel = DashboardViewControllerViewModel()
        self.dashboardVerticalList.viewModel = CustomTableViewModel(sectionData: [CustomTableSectionDataModel(type: .none,
                                                                                                              cellData: [.horizontalList(data: .init(listHeight: 100,
                                                                                                                                                     layout: CollectionViewBannerLayout()))]),
                                                                                  CustomTableSectionDataModel(type: .titleSubTitle(data: TitleSubTitleHeaderFooterViewModel(title: "Upcoming")),
                                                                                                              cellData: [.horizontalList(data: .init(listHeight: 200,
                                                                                                                                                     layout: CollectionViewColumnLayout(cellSizeType: .init(width: .threeFourths, height: .full))))])])
    }
    
}

//cellData: [.horizontalList(data: HorizontalListTableViewCellViewModel(listHeight: 150,
//                                                                      layout: CollectionViewBannerLayout())),
//           .horizontalList(data: HorizontalListTableViewCellViewModel(listHeight: 200,
//                                                                      layout: CollectionViewColumnLayout(cellSizeType: .init(width: .threeFourths, height: .oneThird)))),
//           .horizontalList(data: HorizontalListTableViewCellViewModel(listHeight: 250,
//                                                                      layout: CollectionViewColumnLayout(cellSizeType: .init(width: .half, height: .full))))]
