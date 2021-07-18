//
//  LikeControl.swift
//  Vkontakte
//
//  Created by Lera on 14.07.21.
//

import UIKit

final class LikeControl: UIControl {
    
    private var button = UIButton(type: .custom)
    private var quantity = UILabel(frame: CGRect(x: 28, y: 0, width: 10, height: 28))
    private var likeStatus = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.tintColor = .red
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(likeTapped(_:)), for: .touchUpInside)
        
        quantity.textColor = .red
        quantity.textAlignment = .left
        quantity.font = .systemFont(ofSize: 12)
        quantity.text = "0"
        
        self.addSubview(button)
        self.addSubview(quantity)
    }
    
    @objc private func likeTapped(_ sender: UIButton) {
        if likeStatus == 0 {
            button.isSelected = true
            likeStatus += 1
        } else {
            button.isSelected = false
            likeStatus -= 1
        }
        quantity.text = "\(likeStatus)"
    }

}
