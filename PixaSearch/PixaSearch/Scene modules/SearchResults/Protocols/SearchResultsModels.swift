//
//  SearchResultsModels.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

enum SearchResults {

    // MARK: - Cases

    enum Search {
        struct Request {
            let queryString: String
        }

        struct Response {
            let imageListResponse: ImageListResponse?
            let error: Error?
        }

        struct ViewModel {
            let totalCount: Int
            let images: [ImageViewModel]
            let errorMessage: String?
        }
    }

    enum Select {
        struct Request {
            let selectedIndexes: [IndexPath]
        }

        struct Response {
            let selectedIndexes: [Int]
        }

        struct ViewModel {
            let selectedIndexes: [Int]
        }
    }

    // MARK: - Models

    /// For now those models are the same (see TODO in `PixaImage`)
    typealias ImageViewModel = PixaImage
}
