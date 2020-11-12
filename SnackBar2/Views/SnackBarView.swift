//
//  SnackBar.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/13.
//

import UIKit

class SnackBarView: UIView {
    
    private var viewModel : SnackBarViewModel
    public var handler : Handler?
    
    /// -  構成要素
    private let barLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "label", size: 40)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var barImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
//        print("lazyが呼ばれました")
        
        return imageView
    }()
    
    init(viewModel: SnackBarViewModel, frame: CGRect) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
//        print("初期化！")
        
        SetUpBarView()
        addSubview(barLabel)
        addSubview(barImageView)
        
        configureEvent()
    }
    
    /// -  Set up
    private func SetUpBarView() {
        backgroundColor = .label
        
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    /// -  configure
    private func configureEvent() {
        barLabel.text = viewModel.text
        barImageView.image = viewModel.image
        
        switch viewModel.type {
        case .info:
            break
        case .action(let handler):
            self.handler = handler
            // タップイベントの有効化
            isUserInteractionEnabled = true
            // タップ時の処理を書く
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTappedSnackBar))
                /// -  タップ回数の指定
            gesture.numberOfTouchesRequired = 1
            gesture.numberOfTapsRequired = 1
            
            addGestureRecognizer(gesture)

        }
    }
    
    @objc private func didTappedSnackBar() {
        handler?()
    }
    
    /// -  layout
    override func layoutSubviews() {
        super.layoutSubviews()
//        print("layout処理")
        // lazy barImageViewはここで呼ばれる
        
        if viewModel.image != nil {
            barImageView.frame = CGRect(x: 5, y: 5, width: frame.height - 10, height: frame.height - 10)
            
            barLabel.frame = CGRect(
                x: barImageView.frame.size.width,
                y: 5,
                width: frame.size.width - barImageView.frame.size.width,
                height: frame.size.height - 10
            )
        }
        else {
            
            barLabel.frame = bounds
            
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
