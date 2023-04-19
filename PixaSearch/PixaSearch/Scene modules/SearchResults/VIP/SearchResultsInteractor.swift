//
//  SearchResultsInteractor.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

class SearchResultsInteractor {
    var presenter: SearchResultsPresentationLogic
    var worker: SearchResultsWorkingLogic

    private(set) var images: [PixaImage] = []

    init(presenter: SearchResultsPresentationLogic, worker: SearchResultsWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension SearchResultsInteractor: SearchResultsBusinessLogic {

    func request(_ request: SearchResults.Search.Request) {

        self.worker.fetch(queryString: request.queryString) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let imageListResponse):
                print("Found \(imageListResponse.total) hits in total")
                self.images = imageListResponse.hits
                self.presenter.present(SearchResults.Search.Response(imageListResponse: imageListResponse, error: nil))
            case .failure(let error):
                debugPrint("[ERROR] when fetching results : \(error.localizedDescription)")
                self.presenter.present(SearchResults.Search.Response(imageListResponse: nil, error: error))
            }
        }
    }

    func request(_ request: SearchResults.Select.Request) {
        let indexes = request.selectedIndexes.map { $0.item }
        self.presenter.present(SearchResults.Select.Response(selectedIndexes: indexes))
    }
}

extension SearchResultsInteractor: SearchResultsDataStore {}
