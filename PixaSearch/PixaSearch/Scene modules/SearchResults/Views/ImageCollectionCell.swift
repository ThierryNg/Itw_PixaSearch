// 
//  ImageCollectionCell.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/18.
//

import UIKit
import NGUIKitHelpers
import AlamofireImage

class ImageCollectionCell: UICollectionViewCell {

    // MARK: - UI components

    private lazy var imageView: UIImageView = {
        let view = UIImageView()

        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()

    private lazy var selectionView: UIView = {
        let view = UIView()

        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        view.isHidden = true
        return view
    }()

    // MARK: - View model

    var imagePath: String? {
        didSet {
            guard let imagePath, let url = URL(string: imagePath) else { return }

            print(imagePath)
            self.imageView.af.setImage(withURL: url)
        }
    }

    // MARK: - Config / Layout

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupContent()
        self.setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.setupContent()
        self.setupLayout()
    }

    private func setupContent() {
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.selectionView)
    }

    private func setupLayout() {
        self.imageView.pinToSuperview()
        self.selectionView.pinToSuperview()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.imageView.af.cancelImageRequest()
        self.imageView.image = nil
    }

    // MARK: - Selection

    func showSelection() {
        self.selectionView.isHidden = false
        self.selectionView.bounds = self.contentView.bounds
    }

    func hideSelection() {
        self.selectionView.isHidden = true
    }
}

extension ImageCollectionCell: ReusableCell {}
