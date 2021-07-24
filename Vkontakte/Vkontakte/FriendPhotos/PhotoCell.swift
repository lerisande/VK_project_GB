//
//  PhotoCell.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotoCell"
    
    // замыкание в ячейке
    var likeTapped: (() -> Void)?
    
    @IBOutlet var friendPhoto: UIImageView!
    
	var likeControl = LikeControl()

	override func layoutSubviews() {
		super.layoutSubviews()
		likeControl.frame = CGRect(x: self.frame.size.width - 40,
								   y: self.frame.size.height - 30,
								   width: 38,
								   height: 28)
		self.addSubview(likeControl)
        showPhoto()
        scalePhoto()
	}
    
    // конфигурируем контрол и замыкание
    func configure(photoModel: PhotoModel) {
		likeControl.configure(
			isLike: photoModel.isLiked,
			likeCount: photoModel.likeCount)
		friendPhoto.image = photoModel.image
        // у likeControl есть состояние controlTapped, в этом замыкании вызываем замыкание в ячейке
		likeControl.controlTapped = { [weak self] in
			self?.likeTapped?()
		}
    }
    
    private func showPhoto() {
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
            fadeInAnimation.fromValue = 0
            fadeInAnimation.toValue = 1
            fadeInAnimation.duration = 1
            fadeInAnimation.beginTime = CACurrentMediaTime() + 1
            fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards

        self.friendPhoto.layer.add(fadeInAnimation, forKey: nil)
    }
    
    private func scalePhoto() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.friendPhoto.layer.add(animation, forKey: nil)
    }

}
