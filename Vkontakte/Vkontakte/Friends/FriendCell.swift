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

        setupView()
    }

    func configure(name: String, image: UIImage) {
        friendAvatar.image = image
        friendName.text = name
    }
    
    private func setupView() {
        friendAvatar.layer.cornerRadius = friendAvatar.frame.size.width / 2
        friendAvatar.contentMode = .scaleAspectFill
        friendAvatar.clipsToBounds = true
        friendAvatar.layer.borderWidth = 1
        friendAvatar.layer.borderColor = UIColor.black.cgColor
    }
}
