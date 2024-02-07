//
//  OAuth2TokenStorage2.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 24.12.2023.
//

import Foundation


final class OAuth2TokenStorage {
   private let userDefaults = UserDefaults.standard

   var token: String? {
       get {
           userDefaults.string(forKey: "token")
       }
       set {
           userDefaults.set(newValue, forKey: "token")
       }
   }
}
