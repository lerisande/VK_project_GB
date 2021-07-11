//
//  FriendPhotosController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class FriendPhotosController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var photoLibrary: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension FriendPhotosController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoLibrary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        let image = photoLibrary[indexPath.item]
        cell.configure(image: image)
        
        return cell
    }
}

extension FriendPhotosController: UICollectionViewDelegate {
    
}


