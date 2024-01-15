//
//  SearchListViewModel.swift
//  MovieCatalogue
//
//  Created by Nameet Bhave on 12/01/24.
//

import Foundation

final class SearchListViewModel {
    var didFinishFetch: (() -> ())?
    private var service: WebService?
    var movieResult: [Movie]?
    var error: Error?

    init(service: WebService? = nil) {
        self.service = service
    }

    func searchMovie(title: String) {
        self.service?.fetchMovies(withTitle: title, completion: { searchResult, error in
            if let error = error {
                self.error = error
                self.movieResult = []
                self.didFinishFetch?()
                return
            }
            self.movieResult = searchResult
            self.didFinishFetch?()
        })
    }
}
