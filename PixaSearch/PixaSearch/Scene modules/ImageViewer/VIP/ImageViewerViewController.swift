//
//  ImageViewerViewController.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {
    var interactor: ImageViewerBusinessLogic?
    var router: ImageViewerRoutingLogic?

    private lazy var rootView = ImageViewerView()

    // MARK: - Lifecycle

    override func loadView() {

        self.view = self.rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.interactor?.request(ImageViewer.Display.Request())
    }
}

extension ImageViewerViewController: ImageViewerDisplayLogic {

    func display(_ viewModel: ImageViewer.Display.ViewModel) {
        self.rootView.viewModel = viewModel.models
    }
}
