//
//  SearchResultsView.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import NGUIKitHelpers

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
        let layout = UICollectionViewFlowLayout()

        layout.itemSize = .init(width: 150, height: 150)
        layout.estimatedItemSize = .zero
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.footerReferenceSize = .init(width: self.bounds.width, height: 44)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.backgroundColor = .lightGray
        collectionView.isHidden = true
        collectionView.allowsMultipleSelection = true

        collectionView.register(ImageCollectionCell.self)
        collectionView.register(ImageCollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: ImageCollectionFooterView.self))
        collectionView.delegate = self
        return collectionView
    }()

    private lazy var openButton: UIButton = {
        let button = UIButton()

        button.backgroundColor = .systemMint
        button.setTitle("Open", for: .init())
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapOpenButton), for: .touchUpInside)
        return button
    }()

    private var openButtonHeightConstraint: NSLayoutConstraint?

    // MARK: - Config

    override func setupContent() {
        self.backgroundColor = .lightGray

        self.addSubview(self.collectionView)
        self.addSubview(self.openButton)

        collectionView.dataSource = self.dataSource
    }

    override func setupLayout() {
        self.collectionView.pinToSuperview(excluding: [.bottom])
        self.collectionView.bottomAnchor ~= self.openButton.topAnchor

        self.openButton.leadingAnchor ~= self.safeAreaLayoutGuide.leadingAnchor
        self.openButton.trailingAnchor ~= self.safeAreaLayoutGuide.trailingAnchor

        self.openButtonHeightConstraint = self.openButton.heightAnchor.constraint(equalToConstant: 0)
        self.openButtonHeightConstraint?.isActive = true
        self.openButton.bottomAnchor ~= self.safeAreaLayoutGuide.bottomAnchor
    }

    // MARK: - Actions

    var openAction: Completion<[IndexPath]>? = nil

    @objc
    private func didTapOpenButton() {
        guard let selectedIndexes = self.collectionView.indexPathsForSelectedItems else { return }

        self.openAction?(selectedIndexes)
    }

    // MARK: - Animations

    private func showOpenButton() {
        self.openButtonHeightConstraint?.constant = 44
        self.setNeedsLayout()
        UIView.animate(withDuration: 0.36) {
            self.layoutIfNeeded()
        }
    }

    private func hideOpenButton() {
        self.openButtonHeightConstraint?.constant = 0
        self.setNeedsLayout()
        UIView.animate(withDuration: 0.36) {
            self.layoutIfNeeded()
        }
    }
}

// MARK: - Diffable Collection View

extension SearchResultsView {

    enum Section { case main }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, SearchResults.ImageViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, SearchResults.ImageViewModel>

    func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, image) -> ImageCollectionCell? in
            let cell: ImageCollectionCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)

            cell.imagePath = image.previewURL
            return cell
        }
        dataSource.supplementaryViewProvider = { collectionView, elementKind, IndexPath -> UICollectionReusableView? in
            collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: String(describing: ImageCollectionFooterView.self),
                for: IndexPath
            )
        }
        return dataSource
    }

    func applySnapshot(animatingDifferences: Bool = true) {

        guard let viewModel else { return }

        var snapshot = Snapshot()

        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.images)

        self.dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

    
}

// MARK: - CollectionView delegate

extension SearchResultsView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = collectionView.bounds.width / 2 - 4

        return CGSize(width: side, height: side)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: collectionView.bounds.width, height: 44)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCollectionCell else {
            return
        }

        cell.showSelection()
        if let indexes = collectionView.indexPathsForSelectedItems, indexes.count >= 2 {
            self.showOpenButton()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCollectionCell else {
            return
        }

        cell.hideSelection()
        if let indexes = collectionView.indexPathsForSelectedItems, indexes.count <= 2 {
            self.hideOpenButton()
        }
    }
}
