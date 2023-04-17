//
//  SearchResultsWorker.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

class SearchResultsWorker: SearchResultsWorkingLogic {

    func fetch(queryString: String, completion: ResultCompletion<ImageListResponse>?) {
        let request = ImageListRequest(queryString: queryString)

        NetworkClient.shared.request(request) { result in
            switch result {
            case .success(let value):
                completion?(.success(value))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
