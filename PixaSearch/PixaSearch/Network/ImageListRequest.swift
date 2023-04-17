//
//  ImageListRequest.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import Alamofire

final class ImageListRequest: Request<ImageListResponse> {

    override var parameters: Parameters? { [
        "key": "18021445-326cf5bcd3658777a9d22df6f",
        "q": self.queryString
    ] }

    let queryString: String

    init(queryString: String) {
        self.queryString = queryString
    }
}
