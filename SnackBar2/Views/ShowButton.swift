//
//  SnackButton.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/13.
//

import UIKit

final class ShowButton: UIButton {
    
    let myColor = Colors()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        SetUpButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func SetUpButton() {

        backgroundColor = UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layer.cornerRadius = 20
        
    }
    
}
