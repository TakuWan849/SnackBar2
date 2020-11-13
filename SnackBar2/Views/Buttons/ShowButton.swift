//
//  SnackButton.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/13.
//

import UIKit

class ShowButton: UIButton {
    
    // タッチしたときの処理: RippleButton化
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        drawRipple(touch: touches.first!)
    }
    
    private func drawRipple(touch: UITouch) {
        
        let effectView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        effectView.layer.cornerRadius = 100
        effectView.center = touch.location(in: self)
        effectView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        effectView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        
        addSubview(effectView)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseIn,
            animations: {
                
                effectView.transform = CGAffineTransform(scaleX: 1, y: 1)
                effectView.backgroundColor = .clear
                
            },
            completion: { finished in
                
                effectView.removeFromSuperview()
                
            })
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        SetUpShowButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func SetUpShowButton() {
        
//        backgroundColor = Colors.startColor
        backgroundColor = UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0)
        setTitleColor(.white, for: .normal)
        clipsToBounds = true
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layer.cornerRadius = 20
        
    }

}
