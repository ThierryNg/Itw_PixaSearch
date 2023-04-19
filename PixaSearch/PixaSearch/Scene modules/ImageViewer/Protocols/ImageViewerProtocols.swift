//
//  ImageViewerProtocols.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//  Copyright (c) 2023. All rights reserved.
//

protocol ImageViewerBusinessLogic: AnyObject {
    func request(_ request: ImageViewer.Display.Request)
}

protocol ImageViewerPresentationLogic: AnyObject {
    func present(_ response: ImageViewer.Display.Response)
}

protocol ImageViewerDisplayLogic: AnyObject {
    func display(_ viewModel: ImageViewer.Display.ViewModel)
}

protocol ImageViewerRoutingLogic: AnyObject {

}

protocol ImageViewerDataStore: AnyObject {}

protocol ImageViewerWorkingLogic {}

