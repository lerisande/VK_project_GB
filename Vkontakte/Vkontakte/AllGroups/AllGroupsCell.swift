//
//  AllGroupsCell.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class AllGroupsCell: UITableViewCell {
    
    static let reusedIdentifier = "AllGroupsCell"
    
    @IBOutlet private var groupAvatar: UIImageView!
    @IBOutlet private var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func configure(group: GroupModel) {
        groupName.text = group.name
        groupAvatar.image = group.avatar
    }
    
    private func setupView() {
        //Делает картинку круглой
        groupAvatar.layer.cornerRadius = groupAvatar.frame.size.width / 2
        groupAvatar.contentMode = .scaleAspectFill
        groupAvatar.clipsToBounds = true
    }
    
}
