//
//  PhotoCell.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    
    @IBOutlet var friendPhoto: UIImageView!
    
    func configure(image: UIImage) {
        friendPhoto.image = image
    }
}
