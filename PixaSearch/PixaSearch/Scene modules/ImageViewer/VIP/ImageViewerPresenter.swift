//
//  ImageViewerPresenter.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//  Copyright (c) 2023. All rights reserved.
//

final class ImageViewerPresenter {
    weak var viewController: ImageViewerDisplayLogic?

    init(viewController: ImageViewerDisplayLogic) {
        self.viewController = viewController
    }
}

extension ImageViewerPresenter: ImageViewerPresentationLogic {

    func present(_ response: ImageViewer.Display.Response) {

        let models: [ImageViewer.ViewModel] = response.images.map { image in
                .init(imagePath: image.largeImageURL, userName: image.user)
        }

        self.viewController?.display(ImageViewer.Display.ViewModel(models: models))
    }
}
