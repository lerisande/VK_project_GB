//
//  GroupsAPI.swift
//  Vkontakte
//
//  Created by Lera on 29.08.21.
//

import Foundation
import Alamofire

final class GroupsAPI {
    // базовый URL сервиса
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"

    // метод для загрузки данных
    func getGroups(completion: @escaping([GroupModel]?)->()) {
        //название метода API
        let method = "/groups.get"
        // параметры, id клиента, токен, версия,
        let parameters: Parameters = [
            "user_id": clientId,
            "extended": 1,
            "count": 1000,
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
