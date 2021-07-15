//
//  FriendCell.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class FriendCell: UITableViewCell {
    
    static let reusedIdentifier = "FriendCell"
    
    @IBOutlet var friendAvatar: UIImageView!
    @IBOutlet var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        friendAvatar.layer.cornerRadius = friendAvatar.frame.size.width / 2
        friendAvatar.contentMode = .scaleAspectFill
        friendAvatar.clipsToBounds = true
    }

    func configure(name: String, image: UIImage) {
        friendAvatar.image = image
        friendName.text = name
    }
}
