//
//  SearchResultsBuilder.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class SearchResultsBuilder {

    static func build() -> UIViewController {
        let viewController = SearchResultsViewController()
        let presenter = SearchResultsPresenter(viewController: viewController)
        let interactor = SearchResultsInteractor(presenter: presenter, worker: SearchResultsWorker())
        let router = SearchResultsRouter(viewController: viewController, dataStore: interactor)

        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
