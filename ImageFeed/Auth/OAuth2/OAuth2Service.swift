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
    
    private(set) var authToken: String? {
        get {
            storage.token
        }
        set {
            storage.token = newValue
        }
    }
    
    func fetchToken(code: String, completion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void) {
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
    
    func fetchOAuthToken(_ code: String, completion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void) {
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
        var components = URLComponents(
            string: "https://unsplash.com/oauth/token"
        )
        components?.queryItems = [
            URLQueryItem(name: "client_id", value: accessKey),
            URLQueryItem(name: "client_secret", value: secretKey),
            URLQueryItem(name: "redirect_uri", value: redirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
        ]
        
        var request = URLRequest(url:(components?.url)!)
        request.httpMethod = "POST"
        
        return request
    }
    
    
    
}
