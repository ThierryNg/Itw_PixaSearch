//
//  SearchResultsProtocols.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol SearchResultsBusinessLogic: AnyObject {
    func request(_ request: SearchResults.Search.Request)
    func request(_ request: SearchResults.Select.Request)
}

protocol SearchResultsPresentationLogic: AnyObject {
    func present(_ response: SearchResults.Search.Response)
    func present(_ response: SearchResults.Select.Response)
}

protocol SearchResultsDisplayLogic: AnyObject {
    func display(_ viewModel: SearchResults.Search.ViewModel)
    func display(_ viewModel: SearchResults.Select.ViewModel)
}

protocol SearchResultsRoutingLogic: AnyObject {
    func showImageViewer(for indexes: [Int])
}

protocol SearchResultsDataStore: AnyObject {
    var images: [PixaImage] { get }
}

protocol SearchResultsWorkingLogic {
    func fetch(queryString: String, completion: ResultCompletion<ImageListResponse>?)
}

