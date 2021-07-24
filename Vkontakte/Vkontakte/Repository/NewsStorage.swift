//
//  NewsStorage.swift
//  Vkontakte
//
//  Created by Lera on 23.07.21.
//

import Foundation
import UIKit

class NewsStorage {
    let news: [NewsModel]
    
    init() {
        news = [
            NewsModel(avatar: (UIImage(named: "animalplanet")!),
                      name: "Some Name",
                      date: "\(Date())",
                      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      image: [UIImage(named: "animalplanet2")!],
                      likes: UInt.random(in: 0..<255),
                      comments: UInt.random(in: 0..<255),
                      reposts: UInt.random(in: 0..<255),
                      views: UInt.random(in: 0..<255)),]
    }
}
