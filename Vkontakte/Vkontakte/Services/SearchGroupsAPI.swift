//
//  SearchGroupsAPI.swift
//  Vkontakte
//
//  Created by Lera on 29.08.21.
//

import Foundation
import Alamofire

final class SearchGroupsAPI {
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"

    func getSearchGroups(completion: @escaping([FriendModel]?)->()) {
        let method = "/groups.search"

        let parameters: Parameters = [
            "count": 1000,
            "access_token": token,
            "v": version,
            "q": "Science"
            ]

        let url = baseUrl + method

        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.result)
        }
    }
}
