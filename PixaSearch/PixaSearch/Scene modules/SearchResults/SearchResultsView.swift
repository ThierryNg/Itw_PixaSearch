//
//  SearchResultsView.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import NGUIKitHelpers

/// Base view to help initialization
class PixaView: UIView {

    /// Override this method and add subviews in there.
    func setupContent() {}

    /// Override this method and lay out subviews in there.
    func setupLayout() {}

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupContent()
        subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        setupLayout()
    }

}

final class SearchResultsView: PixaView {

    // MARK: - View model

    var viewModel: SearchResults.Search.ViewModel? {
        didSet {
            guard let viewModel else { return }

            self.collectionView.isHidden = viewModel.totalCount == 0
            self.applySnapshot()
        }
    }

    private lazy var dataSource = self.makeDataSource()

    // MARK: - UI Component

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

        collectionView.backgroundColor = .systemRed
        collectionView.isHidden = true
        collectionView.register(ImageCell.self)
        return collectionView
    }()

    // MARK: - Config

    override func setupContent() {
        self.backgroundColor = .lightGray

        self.addSubview(self.collectionView)
        collectionView.dataSource = self.dataSource
    }

    override func setupLayout() {
        self.collectionView.pinToSuperview(bottom: 44)
    }
}

// MARK: - Diffable Collection View

extension SearchResultsView {

    enum Section { case main }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, SearchResults.ImageViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, SearchResults.ImageViewModel>

    func makeDataSource() -> DataSource {
        return .init(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, image) -> ImageCell? in
                let cell: ImageCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)

                cell.contentView.backgroundColor = .white
                return cell
            }
        )
    }

    func applySnapshot(animatingDifferences: Bool = true) {

        guard let viewModel else { return }

        var snapshot = Snapshot()

        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.images)

        self.dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

final class ImageCell: UICollectionViewCell {

}

extension ImageCell: ReusableCell {}
