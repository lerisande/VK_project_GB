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
    
    func configure(group: GroupModel) {
        groupName.text = group.name
        groupAvatar.image = group.avatar
    }
    
}
