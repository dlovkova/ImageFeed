//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 14.09.2023.
//

import Foundation
import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
}
