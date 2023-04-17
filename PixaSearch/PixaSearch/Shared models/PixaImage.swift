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
    // TODO: Add user property when adding ImageDetail scene to display images with more details
    //  let user: String
}

extension PixaImage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }

    static func == (lhs: PixaImage, rhs: PixaImage) -> Bool {
        lhs.id == rhs.id
    }
}
