//
//  Constants.swift
//  MovieCatalogue
//
//  Created by Nameet Bhave on 12/01/24.
//

import Foundation

struct Constants {

    struct API {
        static let searchMovies = "\(URL.baseURL)search/movie"
    }

    struct URL {

        static let baseURL = "https://api.themoviedb.org/3/"
        static let tmdbMovie = "https://www.themoviedb.org/movie/"
    }

    struct APIKey {

        static let tmdbKey = "0d699223dc630e1d65cc7c6941884b31"
    }

    struct TableCellIds {
        static let searchResultTableCellId = "SearchResultTableCell"
    }

}
