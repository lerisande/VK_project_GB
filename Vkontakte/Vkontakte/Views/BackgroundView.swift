//
//  AvatarView.swift
//  Vkontakte
//
//  Created by Lera on 14.07.21.
//

import UIKit

final class BackgroundView: UIView {

    var shadowColor: UIColor = UIColor.black
    var shadowRadius: CGFloat = 10
    var shadowOpacity: Float = 1

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // Вызов когда макет загружен
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBackgroundView()
    }

    //Вызов когда размеры макета подсчитаны и установлены
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.size.width / 2
    }

    func setBackgroundView() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize.zero
    }

}


