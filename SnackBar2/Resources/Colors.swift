//
//  Colors.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/13.
//

import UIKit

struct Colors {
    
    public func ButtonGradient(target: UIButton, color1: UIColor, color2: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = target.bounds
        gradientLayer.cornerRadius = target.bounds.midY
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        target.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // blue系
    static let skyBlue = UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0)
    
    static let startColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    static let endColor = #colorLiteral(red: 0.2852321628, green: 0.938419044, blue: 0.9285692306, alpha: 1)

}
