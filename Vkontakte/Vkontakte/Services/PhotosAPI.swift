//
//  PhotosAPI.swift
//  Vkontakte
//
//  Created by Lera on 29.08.21.
//

import Foundation
import Alamofire

final class PhotosAPI {
    // базовый URL сервиса
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"

    // метод для загрузки данных
    func getPhotos(completion: @escaping([FriendModel]?)->()) {
        //название метода API
        let method = "/photos.getAll"
        // параметры, id клиента, токен, версия,
        let parameters: Parameters = [
            "owner_id": clientId,
            "no_service_albums": 1,
            "extended": 1,
            "count": 200,
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

