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

    func showImageViewer(for indexes: [Int]) {

        guard let dataStore else { return }

        var images: [PixaImage] = []
        indexes.forEach { images.append(dataStore.images[$0]) }

        let destinationViewController = ImageViewerBuilder.build(images: images)

        self.viewController?.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
