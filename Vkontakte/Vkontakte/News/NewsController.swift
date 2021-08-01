//
//  NewsController.swift
//  Vkontakte
//
//  Created by Lera on 20.07.21.
//

import UIKit

class NewsController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var news = [NewsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        news = NewsStorage().news

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: NewsCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: NewsCell.reuseIdentifier)

    }
}

extension NewsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let index = indexPath.row
//
//        if news[index].image.count > 1 {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath) as? NewsCell
        else {
            return UITableViewCell()
        }
        let news = news[indexPath.row]
        cell.configure(news: news)
        return cell
    }
    
    
}
