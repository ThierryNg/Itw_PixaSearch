//
//  SearchResultsView.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

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

    override func setupContent() {
        self.backgroundColor = .lightGray
    }
}
