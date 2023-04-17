//
//  Request.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import Alamofire

class Request<T: Response> {

    /// Domain component of the Request's URL
    var domain: String { "https://pixabay.com/api" }

    /// Path component of the Request's URL (To support videos in the future)
    var path: String { "" }

    /// URL of the Request
    var url: String {
        self.domain + "/" + self.path
    }

    /// HTTPMethod of the Request
    var method: HTTPMethod { .get }

    /// HTTP headers to include in the original request
    var headers: HTTPHeaders { .init() }

    /// Query/Body parameters for the HTTP request
    var parameters: Parameters? { nil }
}
