//
//  FriendStorage.swift
//  Vkontakte
//
//  Created by Lera on 11.07.21.
//

import Foundation
import UIKit

class FriendStorage {
    let friends: [FriendModel]
    
    init() {
        friends = [
            FriendModel(name: "Anna Dvorak", avatar: (UIImage(named: "woman1")!),
                        photoLibrary: friend1),
            FriendModel(name: "Nicolas Teder", avatar: (UIImage(named: "man1")!),
                        photoLibrary: friend2),
            FriendModel(name: "Lisa Coen", avatar: (UIImage(named: "woman2")!),
                        photoLibrary: friend3),
            FriendModel(name: "Rick Nowak", avatar: (UIImage(named: "man2")!),
                        photoLibrary: friend4),
            FriendModel(name: "Anton Kowalski", avatar: (UIImage(named: "man3")!),
                        photoLibrary: friend5),
            FriendModel(name: "Jeni Amparo", avatar: (UIImage(named: "woman3")!),
                        photoLibrary: friend6),
            FriendModel(name: "Stephen Walczak", avatar: (UIImage(named: "man4")!),
                        photoLibrary: friend7),
            FriendModel(name: "Ted Lewandowski", avatar: (UIImage(named: "man5")!),
                        photoLibrary: friend8),
        ]
    }
var friend1:[UIImage] =
    [UIImage(named:"woman1.1")!,
     UIImage(named:"woman1.2")!,
     UIImage(named:"woman1.3")!,
     UIImage(named:"woman1.4")!]

var friend2:[UIImage] =
    [UIImage(named:"man1.1")!,
     UIImage(named:"man1.2")!,
     UIImage(named:"man1.3")!,
     UIImage(named:"man1.4")!]

var friend3:[UIImage] =
    [UIImage(named:"woman2.1")!]

var friend4:[UIImage] =
    [UIImage(named:"man2.1")!,
     UIImage(named:"man2.2")!]

var friend5:[UIImage] =
    [UIImage(named:"man3.1")!,
     UIImage(named:"man3.2")!,
     UIImage(named:"man3.3")!,
     UIImage(named:"man3.4")!]

var friend6:[UIImage] =
    [UIImage(named:"woman3.1")!,
     UIImage(named:"woman3.2")!,
     UIImage(named:"woman3.3")!,
     UIImage(named:"woman3.4")!,
     UIImage(named:"woman3.5")!,
     UIImage(named:"woman3.6")!,
     UIImage(named:"woman3.7")!]

var friend7:[UIImage] =
    [UIImage(named:"man4.1")!,
     UIImage(named:"man4.2")!,
     UIImage(named:"man4.3")!,
     UIImage(named:"man4.4")!]

var friend8:[UIImage] =
    [UIImage(named:"man5")!,
     UIImage(named:"man5")!]
}
