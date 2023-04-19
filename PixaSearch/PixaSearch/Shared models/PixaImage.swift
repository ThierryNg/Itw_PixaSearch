//
//  PixaImage.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import Foundation

struct PixaImage: Codable {

    let id: Int
    let previewURL: String

    let largeImageURL: String
    let user: String
}

extension PixaImage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }

    static func == (lhs: PixaImage, rhs: PixaImage) -> Bool {
        lhs.id == rhs.id
    }
}
