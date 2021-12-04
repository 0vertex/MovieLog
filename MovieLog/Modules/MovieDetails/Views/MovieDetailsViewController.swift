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
            .allAnchorsSame(on: self.view, margin: UIEdgeInsets(top: -20))

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
        if indexPath.row == .zero {
            if let movieOverviewCell = self.movieDetailsVerticalList.dequeue(MovieOverviewCell.self, for: indexPath) {
                movieOverviewCell.viewModel = MovieOverviewCellViewModel(title: "Overview",
                                                                         description: "Earth is visited by an alien species that threatens humanity’s existence. Events unfold in real time through the eyes of five ordinary people across the globe as they struggle to make sense of the chaos unraveling around them.",
                                                                         creators: ["Simon Kinberg", "David Weil"])
                movieOverviewCell.setupViews()
                return movieOverviewCell
            }
        }
        
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}