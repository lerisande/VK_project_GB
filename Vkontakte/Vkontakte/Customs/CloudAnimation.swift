//
//  CloudAnimation.swift
//  Vkontakte
//
//  Created by Lera on 31.07.21.
//

//import UIKit
//import Foundation
//
//func pathAnimation() {
//
//        let cloudView = UIView()
//
//        view.addSubview(cloudView)
//        cloudView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            cloudView.centerXAnchor.constraint(equalTo: titleImageView.centerXAnchor),
//            cloudView.centerYAnchor.constraint(equalTo: titlrImageView.centerYAnchor),
//            cloudView.widthAnchor.constraint(equalToConstant: 120),
//            cloudView.heightAnchor.constraint(equalToConstant: 70)
//        ])
//
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 10, y: 60))
//        path.addQuadCurve(to: CGPoint(x: 20, y: 40), controlPoint: CGPoint(x: 5, y: 50))
//        path.addQuadCurve(to: CGPoint(x: 40, y: 20), controlPoint: CGPoint(x: 20, y: 20))
//        path.addQuadCurve(to: CGPoint(x: 70, y: 20), controlPoint: CGPoint(x: 55, y: 0))
//        path.addQuadCurve(to: CGPoint(x: 80, y: 30), controlPoint: CGPoint(x: 80, y: 20))
//        path.addQuadCurve(to: CGPoint(x: 110, y: 60), controlPoint: CGPoint(x: 110, y: 30))
//        path.close()
//
//
//        let layerAnimation = CAShapeLayer()
//        layerAnimation.path = path.cgPath
//        layerAnimation.strokeColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
//        layerAnimation.fillColor = UIColor.clear.cgColor
//        layerAnimation.lineWidth = 8
//        layerAnimation.lineCap = .round
//
//        cloudView.layer.addSublayer(layerAnimation)
//
//        let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
//        pathAnimationEnd.fromValue = 0
//        pathAnimationEnd.toValue = 1
//        pathAnimationEnd.duration = 2
//        pathAnimationEnd.fillMode = .both
//        pathAnimationEnd.isRemovedOnCompletion = false
//        layerAnimation.add(pathAnimationEnd, forKey: nil)
//
//        let pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
//        pathAnimationStart.fromValue = 0
//        pathAnimationStart.toValue = 1
//        pathAnimationStart.duration = 2
//        pathAnimationStart.fillMode = .both
//        pathAnimationStart.isRemovedOnCompletion = false
//        pathAnimationStart.beginTime = 1
//
//        let animationGroup = CAAnimationGroup()
//        animationGroup.duration = 3
//        animationGroup.fillMode = CAMediaTimingFillMode.backwards
//        animationGroup.animations = [pathAnimationEnd, pathAnimationStart]
//        animationGroup.repeatCount = .infinity
//        layerAnimation.add(animationGroup, forKey: nil)
//
//    }
