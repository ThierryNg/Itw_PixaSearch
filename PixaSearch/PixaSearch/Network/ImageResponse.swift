//
//  ImageResponse.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import Foundation

struct ImageResponse: Response {
    let total: Int
    let totalHits: Int
    let hits: [PixaImage]
}
