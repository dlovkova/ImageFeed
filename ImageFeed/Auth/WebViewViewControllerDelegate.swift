//
//  WebViewViewControllerDelegate.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 30.11.2023.
//

import Foundation

protocol WebViewViewControllerDelegate: AnyObject {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String)
    func webViewViewControllerDidCancel(_ vc: WebViewViewController)
}
