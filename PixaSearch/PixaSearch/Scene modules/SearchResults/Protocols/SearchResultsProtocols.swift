//
//  SearchResultsProtocols.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

protocol SearchResultsBusinessLogic: AnyObject {
    func request(_ request: SearchResults.Search.Request)
}

protocol SearchResultsPresentationLogic: AnyObject {
    func present(_ response: SearchResults.Search.Response)
}

protocol SearchResultsDisplayLogic: AnyObject {
    func display(_ viewModel: SearchResults.Search.ViewModel)
}

protocol SearchResultsRoutingLogic: AnyObject {

}

protocol SearchResultsDataStore: AnyObject {}

protocol SearchResultsWorkingLogic {
    func fetch(queryString: String, completion: ResultCompletion<ImageListResponse>?)
}

