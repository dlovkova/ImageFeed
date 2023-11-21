//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 17.09.2023.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        createProfileView()
    }
    
    
    func createProfileView() {
        let profileImage = UIImage(named: "Photo")
        
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        let name = UILabel()
        name.text = "Ekaterina Novikova"
        name.textColor = UIColor(named: "YP White")
        name.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        
        
        let nickname = UILabel()
        nickname.text = "@ekaterina_nov"
        nickname.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        nickname.textColor = UIColor(named: "YP Grey")
        nickname.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nickname)
        nickname.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        nickname.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8).isActive = true
        
        
        let text = UILabel()
        text.text = "Hello, world!"
        text.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        text.textColor = UIColor(named: "YP White")
        text.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text)
        text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        text.topAnchor.constraint(equalTo: nickname.bottomAnchor, constant: 8).isActive = true
        
        
        let button = UIButton.systemButton(
            with: UIImage(named: "Exit")!,
            target: self,
            action: #selector(Self.didTapButton)
        )
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 56).isActive = true
    }
    
    @objc
    private func didTapButton() {
        
    }
}





