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
        
        // размещение контрола на экране
        setLikeControl()
    }

    func setLikeControl() {
        let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        collectionView.collectionViewLayout = layout
    }
}

extension FriendPhotosController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let friendPhotos = friend?.photoLibrary else { return 0 }
        return friendPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as! PhotoCell
        guard let imageModel = friend?.photoLibrary[indexPath.item] else { return cell }
		cell.configure(photoModel: imageModel)
        // когда лайк нажат, срабатывает замыкание
		cell.likeTapped = { [weak self] in
            // у модели данных, откуда берем фотографию, меняем состояние isLiked на противоположное
			self?.friend?.photoLibrary[indexPath.item].isLiked.toggle()
			collectionView.reloadItems(at: [indexPath]) // обновление ячейки по тому же индексу
		}
        return cell
    }
}

extension FriendPhotosController: UICollectionViewDelegate {
    
}


