//
//  NetworkClient.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import Foundation
import Alamofire

typealias Completion<T> = (T) -> Void
typealias ResultCompletion<T> = (Result<T, Error>) -> Void

final class NetworkClient {

    // MARK: - Singleton Initialization

    static let shared = NetworkClient()
    private init() {}

    // MARK: - Create / Execute network requests

    static func dataRequestFrom<T: Response>(
        request: Request<T>
    ) -> DataRequest {
        AF.request(
            request.url,
            method: request.method,
            parameters: request.parameters,
            encoding: URLEncoding.default,
            headers: request.headers,
            interceptor: nil
        )
    }

    func request<T: Response>(_ request: Request<T>, completion: ResultCompletion<T>? = nil) {

        debugPrint("Initiating request 🌐 \(request.method) \(request.url)")

        let dataRequest = NetworkClient.dataRequestFrom(request: request)

        dataRequest.validate(statusCode: 200 ..< 300).responseDecodable(of: T.self) { afResponse in
            switch afResponse.result {
            case let .success(responseObject):
                debugPrint("✅ Finished serializing \(String(describing: request.self))")
                completion?(.success(responseObject))

            case let .failure(afError) where afError.isResponseValidationError:
                guard
                    case let .responseValidationFailed(reason) = afError,
                    case let .unacceptableStatusCode(statusCode) = reason
                else {
                    completion?(.failure(afError))
                    return
                }

                let httpError: HTTPError = .init(rawValue: statusCode) ?? .unhandled
                completion?(.failure(httpError))
            case let .failure(afError):
                debugPrint("[ERROR] on url : \(request.url)\n----> \(afError.localizedDescription)")
                completion?(.failure(afError))
            }
        }
    }
}

enum HTTPError: Int, LocalizedError {
    case unhandled

    case badRequest = 400
    case tooManyRequests = 429

    case server = 500
}
