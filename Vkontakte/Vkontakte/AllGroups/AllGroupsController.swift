//
//  AllGroupsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class AllGroupsController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var groups = [GroupModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = GroupStorage().allGroups
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: GroupsCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: GroupsCell.reuseIdentifier)
    }
}

extension AllGroupsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: GroupsCell.reuseIdentifier, for: indexPath) as? GroupsCell
        else {
            return UITableViewCell()
        }
        let group = groups[indexPath.row]
        cell.configure(group: group)
        return cell
    }
}

extension AllGroupsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
