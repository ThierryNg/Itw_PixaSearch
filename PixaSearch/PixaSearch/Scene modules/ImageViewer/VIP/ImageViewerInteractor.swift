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

    init(presenter: ImageViewerPresentationLogic, worker: ImageViewerWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension ImageViewerInteractor: ImageViewerBusinessLogic {

    func request(_ request: ImageViewer.Display.Request) {
        
    }
}

extension ImageViewerInteractor: ImageViewerDataStore {}
