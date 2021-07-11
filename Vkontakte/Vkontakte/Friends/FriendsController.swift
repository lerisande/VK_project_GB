//
//  FriendsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class FriendsController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var friends: [FriendModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = FriendStorage()
        friends = storage.friends
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendPhotos",
           let destinationController = segue.destination as? FriendPhotosController,
           let indexPath = sender as? IndexPath
        {
            let friend = friends[indexPath.row]
            destinationController.photoLibrary = friend.photoLibrary
            destinationController.title = friend.name
        }
    }
    
}

extension FriendsController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        
        cell.friendName?.text = friends[indexPath.row].name
        cell.friendAvatar?.image = friends[indexPath.row].avatar
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата строка № \(indexPath.row) в секции \(indexPath.section)")
    }
}
