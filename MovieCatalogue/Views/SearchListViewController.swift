//
//  SearchListViewController.swift
//  MovieCatalogue
//
//  Created by Nameet Bhave on 11/01/24.
//

import Foundation
import UIKit

class SearchListViewController: UIViewController {

    @IBOutlet weak var resultsTableView: UITableView!

    let searchController = UISearchController()

    var movieViewModel = SearchListViewModel(service: WebService.shared)
    var searchResult : [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure view
        title = "Movie Search"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController

        resultsTableView.register(UINib(nibName: "SearchResultTableCell", bundle: nil), forCellReuseIdentifier: Constants.TableCellIds.searchResultTableCellId)

    }

    func fetch(searchName: String) {
        // webservice call
        movieViewModel.searchMovie(title: searchName)
        movieViewModel.didFinishFetch = {
            DispatchQueue.main.async {
                self.searchResult = self.movieViewModel.movieResult ?? []
                if (self.searchResult.count == 0) {
                    showAlert(title: .sorry, message: .noData, view: self)
                }
                self.resultsTableView.reloadData()
                // Can add pagination using incremental calls to service and adding page information.
            }
        }
    }

}

// MARK: - UITableView Delegate DataSource
extension SearchListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellIds.searchResultTableCellId, for: indexPath) as? SearchResultTableCell
        else { return UITableViewCell() }
        cell.setUp(result: searchResult[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Can add a new view controller to show all movie details.
        let movie: Movie = searchResult[indexPath.row]
        if let title = movie.title, let desc = movie.description {
            showAlert(title: title, message: desc, view: self)
        }
    }
}

// MARK: - UISearchBarDelegate
extension SearchListViewController:  UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty else {
            return
        }

        DispatchQueue.main.async {
            self.fetch(searchName: searchText)
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchResult.removeAll()
            resultsTableView.reloadData()
        }
    }
}
