//
//  MoviesList.swift
//  MovieCatalogue
//
//  Created by Nameet Bhave on 12/01/24.
//

import Foundation

struct MovieListResponse: Codable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Codable {
    let id: Int
    let title: String?
    let posterPath: String?
    let description: String?
    let release_date: String?
    let isAdult: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case posterPath = "poster_path"
        case description = "overview"
        case release_date
        case isAdult = "adult"
    }
}
