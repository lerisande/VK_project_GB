//
//  FriendsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class FriendsController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var lettersControl: LettersControl!
    
    var friends: [FriendModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friends = FriendStorage().friends.sorted(by: { $0.name < $1.name })
        let firstLetters = getFirstLetters(friends)
        lettersControl.setLetters(firstLetters)
        lettersControl.addTarget(self, action: #selector(scrollToLetter), for: .valueChanged)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func scrollToLetter() {
        let letter = lettersControl.selectLetter
        guard
            let firstIndexForLetter = friends.firstIndex(where: { String($0.name.prefix(1)) == letter })
        else {
            return
        }
        
        tableView.scrollToRow(
            at: IndexPath(row: firstIndexForLetter, section: 0),
            at: .top,
            animated: true)
    }
    
    private func getFirstLetters(_ friends: [FriendModel]) -> [String] {
        let friendName = friends.map { $0.name }
        let firstLetters = Array(Set(friendName.map { String($0.prefix(1)) })).sorted()
        return firstLetters
    }

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showFriendPhotos" {
        guard let destVC = segue.destination as? FriendPhotosController else { return }
        destVC.friend = sender as? FriendModel
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
        let friend = friends[indexPath.row]
        performSegue(withIdentifier: "showFriendPhotos", sender: friend)
    }
}
