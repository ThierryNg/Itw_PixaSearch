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
}

extension SearchResultsViewController: UISearchBarDelegate {}

extension SearchResultsViewController: SearchResultsDisplayLogic {

    func display(_ viewModel: SearchResults.Search.ViewModel) {

    }
}
