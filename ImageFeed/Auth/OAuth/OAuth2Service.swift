//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 17.12.2023.
//

import Foundation
final class OAuth2Service {
    
     let storage = OAuth2TokenStorage
   //  var networkService = NetworkService()
    
    
    private(set) var authToken: String? {
            get {
                storage.token
            }
            set {
                storage.token = newValue
            }
        }
    
    func fetchOAuthToken(_ code: String,
                         completion: @escaping (Result<String, Error>) -> Void) {
        DispatchQueue.main.async {
            //completion(.success(""))
            fetchToken(code: code) { result in
                        switch result {
                        case .success(let body):
                            self.authToken = body.accessToken

                            if let authToken = self.authToken {
                                completion(.success(authToken))
                            }
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
        }
    }
    
    private func fetchToken(code: String, completion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void) {
            networkService.data(for: authTokenRequest(code: code)) { result in
                switch result {
                case .success(let data):
                    guard let data = self.networkService.decodeJson(type: OAuthTokenResponseBody.self, data: data) else { return }
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

    private func authTokenRequest(code: String) -> URLRequest {
        networkService.makeHTTPRequest(
            baseURL: URL(string: "https://unsplash.com")!,
            path: "/oauth/token",
            httpMethod: "POST",
            query: [URLQueryItem(name: "client_id", value: accessKey),
                    URLQueryItem(name: "client_secret", value: secretKey),
                    URLQueryItem(name: "redirect_uri", value: redirectURI),
                    URLQueryItem(name: "code", value: code),
                    URLQueryItem(name: "grant_type", value: "authorization_code")]
        )
    }
}
    

