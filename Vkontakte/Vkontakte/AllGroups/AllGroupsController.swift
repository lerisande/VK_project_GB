//
//  AllGroupsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class AllGroupsController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var groups: [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = GroupStorage().allGroups
        
        tableView.delegate = self
        tableView.dataSource = self
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
            let cell = tableView.dequeueReusableCell(withIdentifier: AllGroupsCell.reusedIdentifier, for: indexPath) as? AllGroupsCell
        else {
            return AllGroupsCell()
        }
        let group = groups[indexPath.row]
        cell.configure(group: group)
        return cell
    }
}

extension AllGroupsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата строка № \(indexPath.row) в секции \(indexPath.section)")
    }
    
}
