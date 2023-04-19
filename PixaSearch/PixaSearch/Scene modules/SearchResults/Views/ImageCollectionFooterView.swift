//
//  ImageCollectionFooterView.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//

import UIKit

final class ImageCollectionFooterView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }

    private func commonInit() {
        let label = UILabel()

        label.text = "Powered by Pixabay"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)

        self.addSubview(label)
        label.pinToSuperview()
    }
}
