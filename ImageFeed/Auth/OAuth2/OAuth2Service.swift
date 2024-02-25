//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 24.12.2023.
//

import Foundation
final class OAuth2Service {
    
    
    private var networkService = NetworkService()
    private var storage = OAuth2TokenStorage()
    static let shared = OAuth2Service()
    private let urlSession = URLSession.shared
    let constants = Constants()
    
    private(set) var authToken: String? {
        get {
            return storage.token
        }
        set {
            storage.token = newValue
        }
    }
    
//    func fetchOAuthToken(_ code: String, completion: @escaping (Result<String, Error>) -> Void) {
//            guard let request = authTokenRequest(code: code) else {
//                fatalError("Unable to create fetch authorization token request")
//            }
//            let task = object(for: request) { [weak self] result in
//                guard let self = self else { return }
//                switch result {
//                case .success(let body):
//                    let authToken = body.accessToken
//                    self.authToken = authToken
//                    completion(.success(authToken))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//            task.resume()
//        }
    
    func fetchOAuthToken(_ code: String, completion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void) {
        networkService.data(for: authTokenRequest(code: code)) { result in
            switch result {
            case .success(let body):
                guard let data = self.networkService.decodeJson(type: OAuthTokenResponseBody.self, data: body) else { return }
               // let authToken = body.accessToken
               // self.authToken = authToken
              //  print (authToken)
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


extension OAuth2Service {
    
//    private func object(
//            for request: URLRequest,
//            completion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void
//        ) -> URLSessionTask {
//            let decoder = JSONDecoder()
//            return urlSession.data(for: request) { (result: Result<Data, Error>) in
//                let response = result.flatMap { data -> Result<OAuthTokenResponseBody, Error> in
//                    Result { try decoder.decode(OAuthTokenResponseBody.self, from: data) }
//                }
//                completion(response)
//            }
//        }
    
    private func authTokenRequest(code: String) -> URLRequest {
        var components = URLComponents(
            string: "https://unsplash.com/oauth/token"
        )
        components?.queryItems = [
            URLQueryItem(name: "client_id", value: constants.accessKey),
            URLQueryItem(name: "client_secret", value: constants.secretKey),
            URLQueryItem(name: "redirect_uri", value: constants.redirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
        ]
        
        var request = URLRequest(url:(components?.url)!)
        request.httpMethod = "POST"
        
        return request
    }
}
