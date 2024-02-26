//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 17.09.2023.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
   
   

    override func viewDidLoad() {
        profileImage()
        name()
        nickname()
        message()
        backButton()
    }
    
    
    func profileImage() {
        let profileImage = UIImage(named: "Photo")
        
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true 
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    
    func name() {
        let label = UILabel()
        label.text = "Ekaterina Novikova"
        label.textColor = UIColor(named: "YP White")
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
     

        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
       
        
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110).isActive = true
       
        
    }
    
    
    func nickname () {
        let label = UILabel()
        label.text = "@ekaterina_nov"
        label.textColor = UIColor(named: "YP Grey")
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
       
        
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 136).isActive = true
       
    }
    
    func message() {
        let label = UILabel()
        label.text = "Hello, world!"
        label.textColor = UIColor(named: "YP White")
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
       
        
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 162).isActive = true
       
    }
    
    func backButton() {
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
//                label?.removeFromSuperview()
//                label = nil
//
//                for view in view.subviews {
//                    if view is UILabel {
//                        view.removeFromSuperview()
//                    }
//                }
            }
    
}





