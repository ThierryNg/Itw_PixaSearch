//
//  ImageViewerBuilder.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class ImageViewerBuilder {

    static func build(images: [PixaImage]) -> UIViewController {
        let viewController = ImageViewerViewController()
        let presenter = ImageViewerPresenter(viewController: viewController)
        let interactor = ImageViewerInteractor(presenter: presenter, worker: ImageViewerWorker(), images: images)
        let router = ImageViewerRouter(viewController: viewController, dataStore: interactor)

        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
