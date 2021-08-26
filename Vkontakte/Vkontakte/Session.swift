//
//  Session.swift
//  Vkontakte
//
//  Created by Lera on 25.08.21.
//

import Foundation

class Session {
    private init() { }
        
    static let shared = Session()
    
    var token: String = ""
    var userId: Int = 0
        
}
