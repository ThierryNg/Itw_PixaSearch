//
//  ImageListRequest.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import Alamofire

final class ImageListRequest: Request<ImageResponse> {

    override var parameters: Parameters? { [
        "q": self.queryString
    ] }

    let queryString: String

    init(queryString: String) {
        self.queryString = queryString
    }
}
