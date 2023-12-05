//
//  ImageViewerInteractor.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//  Copyright (c) 2023. All rights reserved.
//

class ImageViewerInteractor {
    var presenter: ImageViewerPresentationLogic
    var worker: ImageViewerWorkingLogic

    private(set) var images: [PixaImage] = []

    init(presenter: ImageViewerPresentationLogic, worker: ImageViewerWorkingLogic, images: [PixaImage]) {
        self.presenter = presenter
        self.worker = worker
        self.images = images
    }
}

extension ImageViewerInteractor: ImageViewerBusinessLogic {

    func request(_ request: ImageViewer.Display.Request) {
        self.presenter.present(ImageViewer.Display.Response(images: self.images))
    }
}

extension ImageViewerInteractor: ImageViewerDataStore {}
