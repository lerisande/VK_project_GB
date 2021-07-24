//
//  FriendModel.swift
//  Vkontakte
//
//  Created by Lera on 11.07.21.
//

import Foundation
import UIKit

struct FriendModel  {

    let name: String
    let avatar: UIImage
    var photoLibrary: [PhotoModel]

	static func == (lhs: FriendModel, rhs: FriendModel) -> Bool {
		lhs.name == rhs.name
	}
}
