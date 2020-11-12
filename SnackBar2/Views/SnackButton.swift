//
//  SnackButton.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/13.
//

import UIKit

final class SnackButton: UIButton {
    
    let myColor = Colors()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        SetUpButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func SetUpButton() {
        
        backgroundColor = UIColor.white
        setTitleColor( myColor.skyBlue, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layer.cornerRadius = 20
        layer.borderColor =  myColor.skyBlue.cgColor
        layer.borderWidth = 2
        
    }
    
}
