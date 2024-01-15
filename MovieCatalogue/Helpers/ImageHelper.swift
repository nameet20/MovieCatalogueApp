//
//  ImageHelper.swift
//  MovieCatalogue
//
//  Created by Nameet Bhave on 12/01/24.
//

import Foundation
import Kingfisher
import UIKit

func setKFImage(fromUrl url: URL, imageView: UIImageView) {
    imageView.kf.setImage(with: .some(url), placeholder: UIImage(named: "no_image"), 
                          options: [.cacheOriginalImage],
                          completionHandler: nil)
}
