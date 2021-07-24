//
//  NewsCell.swift
//  Vkontakte
//
//  Created by Lera on 20.07.21.
//

import UIKit

final class NewsCell: UICollectionViewCell {
    
    static let reuseIdentifier = "NewsCell"
    
    @IBOutlet var newsAvatar: UIImageView!
    @IBOutlet var newsName: UILabel!
    @IBOutlet var newsPostDate: UILabel!
    @IBOutlet var newsText: UITextView!
    @IBOutlet var newsImage: UIImageView!
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var replyButton: UIButton!
    @IBOutlet var replyLabel: UILabel!
    @IBOutlet var viewsButton: UIButton!
    @IBOutlet var viewsLabel: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(avatar: UIImage,name: String, date: String, text: String, image: UIImage) {
        newsAvatar.image = avatar
        newsName.text = name
        newsPostDate.text = date
        newsText.text = text
        newsImage.image = image
     }

}
