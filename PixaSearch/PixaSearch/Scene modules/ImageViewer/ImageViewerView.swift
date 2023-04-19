//
//  ImageViewerView.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import AlamofireImage
import NGUIKitHelpers

final class ImageViewerView: PixaView {

    // MARK: - View Model

    var viewControllers: [ImageViewController] = []

    var viewModel: [ImageViewer.ViewModel] = [] {
        didSet {
            self.viewControllers = self.setupPageControllers()

            guard let firstViewController = self.viewControllers.first else { return }

            self.pageViewController.setViewControllers(
                [firstViewController],
                direction: .forward,
                animated: true
            )
        }
    }

    // MARK: - UI Component

    private var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)

        return pageViewController
    }()

    // MARK: - Config

    override func setupContent() {
        self.backgroundColor = .lightGray
        self.pageViewController.dataSource = self

        self.addSubview(self.pageViewController.view)
    }

    override func setupLayout() {
        self.pageViewController.view.pinToSuperview(excluding: [.bottom])
        self.pageViewController.view.bottomAnchor ~= self.safeAreaLayoutGuide.bottomAnchor - 44
    }

    // MARK: - Helpers

    private func setupPageControllers() -> [ImageViewController] {

        var controllers: [ImageViewController] = []

        for (index, singleViewModel) in self.viewModel.enumerated() {
            let imageViewController = ImageViewController(index: index)
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))

            controllers.append(imageViewController)

            guard let url = URL(string: singleViewModel.imagePath) else {
                continue
            }

            imageView.af.setImage(withURL: url)
            imageView.contentMode = .scaleAspectFit
            imageViewController.view = imageView
        }
        return controllers
    }
}

extension ImageViewerView: UIPageViewControllerDataSource {

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {

        guard let viewController = viewController as? ImageViewController else { return nil }

        let previousIndex = viewController.pageIndex - 1
        guard previousIndex >= .zero else { return nil }

        return self.viewControllers[previousIndex]
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {

        guard let viewController = viewController as? ImageViewController else { return nil }

        let nextIndex = viewController.pageIndex + 1
        guard nextIndex < self.viewModel.count else { return nil }

        return self.viewControllers[nextIndex]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        self.viewModel.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let imageViewControler = pageViewController.viewControllers?.first as? ImageViewController else {
            return 0
        }
        return imageViewControler.pageIndex
    }
}

final class ImageViewController: UIViewController {
    var pageIndex: Int = 0

    init(index: Int) {
        super.init(nibName: nil, bundle: nil)
        self.pageIndex = index
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
