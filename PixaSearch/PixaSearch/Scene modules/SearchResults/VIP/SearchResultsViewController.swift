//
//  SearchResultsViewController.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {

    var interactor: SearchResultsBusinessLogic?
    var router: SearchResultsRoutingLogic?

    private lazy var rootView = SearchResultsView()

    // MARK: - Constants

    enum Constants {
        static let searchThrottleSpeed: TimeInterval = 1
    }

    // MARK: - Additional UI Components

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        return searchBar
    }()

    // MARK: - Lifecycle

    override func loadView() {

        self.view = self.rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = self.searchBar
    }

    // MARK: - Helpers

    @objc
    func throttledSearch(searchBar: UISearchBar) {
        print("After throttling")

        guard let query = searchBar.text?.trimmingCharacters(in: .whitespaces) else {
            return
        }
        if query.count > 2 {
            self.interactor?.request(SearchResults.Search.Request(queryString: query))
        }
    }
}

extension SearchResultsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        let selector = #selector(throttledSearch(searchBar:))

        print("Text changed")
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: selector, object: searchBar)
        perform(selector, with: searchBar, afterDelay: Constants.searchThrottleSpeed)
    }
}

extension SearchResultsViewController: SearchResultsDisplayLogic {

    func display(_ viewModel: SearchResults.Search.ViewModel) {

    }
}
