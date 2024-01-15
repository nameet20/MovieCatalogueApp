//
//  SearchResultTableCell.swift
//  MovieCatalogue
//
//  Created by Nameet Bhave on 11/01/24.
//

import Foundation
import UIKit

class SearchResultTableCell: UITableViewCell {

    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieThumbImageView: UIImageView!
    
    func setUp(result: Movie) {
        // setup cell data
        self.movieTitleLabel.text = result.title
        self.movieDescriptionLabel.text = result.description

        // handle image download and cache
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(result.posterPath ?? "")") else {return}
        setKFImage(fromUrl: url, imageView: self.movieThumbImageView)

    }
}
