//
//  SearchResultsPresenter.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

final class SearchResultsPresenter {
    weak var viewController: SearchResultsDisplayLogic?

    init(viewController: SearchResultsDisplayLogic) {
        self.viewController = viewController
    }
}

extension SearchResultsPresenter: SearchResultsPresentationLogic {

    func present(_ response: SearchResults.Search.Response) {

    }
}
