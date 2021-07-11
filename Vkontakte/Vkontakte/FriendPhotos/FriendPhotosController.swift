//
//  FriendPhotosController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class FriendPhotosController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var friend: FriendModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = friend?.name
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension FriendPhotosController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let friendPhotos = friend?.photoLibrary else { return 0}
        return friendPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        guard let image = friend?.photoLibrary[indexPath.item] else { return cell }
        cell.configure(image: image)
        
        return cell
    }
}

extension FriendPhotosController: UICollectionViewDelegate {
    
}


