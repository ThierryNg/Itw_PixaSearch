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

        guard response.error == nil,
              let imageListResponse = response.imageListResponse
        else {
            self.viewController?.display(SearchResults.Search.ViewModel(totalCount: 0, images: [], errorMessage: "Request failed"))
            return
        }

        let imageList: [SearchResults.ImageViewModel] = imageListResponse.hits

        self.viewController?.display(SearchResults.Search.ViewModel(totalCount: imageListResponse.totalHits, images: imageList, errorMessage: nil))
    }
}
