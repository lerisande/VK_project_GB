//
//  NewsController.swift
//  Vkontakte
//
//  Created by Lera on 20.07.21.
//

import UIKit

class NewsController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var news = [NewsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(UINib(nibName: NewsCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: NewsCell.reuseIdentifier)

    }
}

extension NewsController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseIdentifier, for: indexPath) as! NewsCell
        
        return cell
    }
}
