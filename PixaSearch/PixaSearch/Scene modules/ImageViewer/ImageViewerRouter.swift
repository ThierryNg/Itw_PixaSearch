//
//  ImageViewerRouter.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

class ImageViewerRouter {

    weak var viewController: ImageViewerViewController?
    var dataStore: ImageViewerDataStore?

    init(viewController: ImageViewerViewController, dataStore: ImageViewerDataStore? = nil) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension ImageViewerRouter: ImageViewerRoutingLogic {

}
