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
    @IBOutlet var likeController: UIView!
    
    func configure(image: UIImage) {
        friendPhoto.image = image
    }
    
    func addLikeControl() {
        let like = LikeControl(frame: CGRect(x: self.frame.size.width - 40, y: self.frame.size.height - 30, width: 38, height: 28))
        self.addSubview(like)
    }
}
