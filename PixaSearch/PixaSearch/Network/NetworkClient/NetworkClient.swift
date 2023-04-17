//
//  NetworkClient.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/17.
//

import Foundation
import Alamofire

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

    func request<T: Response>(_ request: Request<T>) async throws -> T {

        debugPrint("Initiating request 🌐 \(request.method) \(request.url)")

        do {
            return try await NetworkClient.dataRequestFrom(request: request)
                .validate(statusCode: 200 ..< 300)
                .serializingDecodable(T.self)
                .value
        } catch let afError as AFError {
            if afError.isResponseValidationError {
                debugPrint("[ERROR] Validation error : \(afError)", "onUrl: \(request.url)")
                guard case let .responseValidationFailed(reason) = afError,
                      case let .unacceptableStatusCode(statusCode) = reason else {
                    throw afError
                }
                let httpError: HTTPError = .init(rawValue: statusCode) ?? .unhandled
                throw httpError
            } else {
                debugPrint("[ERROR] on url : \(request.url)\n----> \(afError.localizedDescription)")
                throw afError
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
