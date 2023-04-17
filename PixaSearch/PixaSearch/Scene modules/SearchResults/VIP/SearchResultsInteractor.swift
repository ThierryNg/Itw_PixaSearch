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

    init(presenter: SearchResultsPresentationLogic, worker: SearchResultsWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension SearchResultsInteractor: SearchResultsBusinessLogic {

    func request(_ request: SearchResults.Search.Request) {
        
    }
}

extension SearchResultsInteractor: SearchResultsDataStore {}
