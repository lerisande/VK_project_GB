//
//  MyGroupsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class MyGroupsController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet private var tableView: UITableView!
    
    var groups = [GroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = GroupStorage()
        groups = storage.groups
        
        tableView.register(UINib(nibName: GroupsCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: GroupsCell.reuseIdentifier)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addGroup" {
            segue.destination.title = "Мои группы"
        }
    }
    
    @IBAction func addGroup(_ segue: UIStoryboardSegue){
        guard
            segue.identifier == "addGroup",
            let sourceController = segue.source as? AllGroupsController,
            let indexPath = sourceController.tableView.indexPathForSelectedRow
        else {
            return
        }
        let group = sourceController.groups[indexPath.row]
        
        if !groups.contains(where: {$0.name == group.name}) {
            groups.append(group)
            tableView.reloadData()
        }
    }
}

extension MyGroupsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: GroupsCell.reuseIdentifier, for: indexPath) as? GroupsCell
        else {
            return GroupsCell()
        }
        let group = groups[indexPath.row]
        cell.configure(group: group)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension MyGroupsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
