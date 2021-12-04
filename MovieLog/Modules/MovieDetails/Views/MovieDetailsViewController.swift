//
//  MovieDetailsViewController.swift
//  MovieLog
//
//  Created by Manish on 04/12/21.
//

import CoreUIKit
import UIKit

class MovieDetailsViewController: UIViewController {
    
    var viewModel: DashboardViewControllerViewModel?
    private let movieDetailsVerticalList = BaseTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupData()
        self.setupViews()
    }
    
    func setupViews() {
        self.movieDetailsVerticalList
            .set(identifier: "movieDetailsVerticalList")
            .add(to: self.view)
            .allAnchorsSame(on: self.view)

        self.movieDetailsVerticalList.showsVerticalScrollIndicator = false
        self.movieDetailsVerticalList.backgroundColor = .clear
        self.movieDetailsVerticalList.delegate = self
        self.movieDetailsVerticalList.dataSource = self
        self.movieDetailsVerticalList.register(MovieOverviewCell.self)
        self.movieDetailsVerticalList.register(HorizontalListTableViewCell.self)
    }
    
    func setupData() {
        
    }
    
}

extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MovieDetailsHeaderView()
        headerView.setupData()
        headerView.setupViews()
        return headerView
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
