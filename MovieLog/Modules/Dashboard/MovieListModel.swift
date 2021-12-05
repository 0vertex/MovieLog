//
//  MovieListModel.swift
//  MovieLog
//
//  Created by Manish on 05/12/21.
//

import Foundation

struct MovieListModel {
    let sectionTitle: String
    let movies: [MovieItemModel]
}

struct MovieItemModel {
    let title: String
    let image: String
    let releaseDate: String
}
