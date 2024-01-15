//
//  WebService.swift
//  MovieCatalogue
//
//  Created by Nameet Bhave on 12/01/24.
//

import Foundation
import Alamofire

struct WebService {

    // MARK: - Singleton
    static let shared = WebService()

    // MARK: -Service
    func genericFetch<T: Decodable>(from urlString: String, completion: @escaping (T?, Error?) -> Void) {

        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        AF
            .request(url)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let result):
                    completion(result, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }

    //MARK: - Movie Request
    func fetchMovies(withTitle title: String, completion: @escaping ([Movie]?, Error?) -> Void) {
        print("Searching: \(title)")
        guard let query = title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        let urlString = "\(Constants.API.searchMovies)?api_key=\(Constants.APIKey.tmdbKey)&query=\(query)"
//        print("URL: \(urlString)")
        genericFetch(from: urlString) { (response: MovieListResponse?, error) in
            guard let response = response, error == nil else {
                completion(nil, error)
                return
            }
            completion(response.movies, nil)
            // TODO: Can add pagination using "page" from response.
        }
    }
}
