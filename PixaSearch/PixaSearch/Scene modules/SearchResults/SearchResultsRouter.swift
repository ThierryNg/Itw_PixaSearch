//
//  SearchResultsRouter.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

class SearchResultsRouter {

    weak var viewController: SearchResultsViewController?
    var dataStore: SearchResultsDataStore?

    init(viewController: SearchResultsViewController, dataStore: SearchResultsDataStore? = nil) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension SearchResultsRouter: SearchResultsRoutingLogic {

}
