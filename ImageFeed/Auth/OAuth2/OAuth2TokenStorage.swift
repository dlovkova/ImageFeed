//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 24.12.2023.
//

import Foundation

final class OAuth2TokenStorage {
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
       case token
     }
    
    var token: String? {
        get {
            userDefaults.string(forKey: Keys.token.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.token.rawValue)
        }
    }
}
