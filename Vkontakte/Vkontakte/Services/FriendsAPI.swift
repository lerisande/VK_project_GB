//
//  FriendsAPI.swift
//  Vkontakte
//
//  Created by Lera on 29.08.21.
//

import Foundation
import Alamofire

final class FriendsAPI {
    // базовый URL сервиса
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"

    // метод для загрузки данных
    func getFriends(completion: @escaping([FriendModel]?)->()) {
        //название метода API
        let method = "/friends.get"
        // параметры, id клиента, токен, версия,
        let parameters: Parameters = [
            "user_id": clientId,
            "order": "name",
            "count": 1000,
            "fields": "photo_100, photo_50",
            "access_token": token,
            "v": version
        ]
        // составляем URL из базового адреса сервиса и метода API
        let url = baseUrl + method

        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.result)
        }
    }
}

