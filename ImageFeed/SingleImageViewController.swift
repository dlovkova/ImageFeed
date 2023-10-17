//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 17.10.2023.
//

import Foundation
import Foundation
import UIKit

class SingleImageViewController: UIViewController {
    
//    var image: UIImage! {
//          didSet {
//              guard isViewLoaded else { return } // 1
//              imageView.image = image // 2
//          }
//      }
//
    var image: UIImage!
        
        @IBOutlet var imageView: UIImageView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            imageView.image = image
        }
}
