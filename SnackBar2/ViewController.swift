//
//  ViewController.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/12.
//

import UIKit

class ViewController: UIViewController {
    
    // 構成要素
    private let HStackView = UIStackView()

    // layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStackView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setStackViewConstraits()
    }
    
    // StackViewの設定
    private func configureStackView() {
        view.addSubview(HStackView)
        
        HStackView.axis = .horizontal
        HStackView.distribution = .fillEqually
        HStackView.alignment = .leading
        HStackView.spacing = 5
        HStackView.backgroundColor = .red

        // ボタンをスタックビューに追加する処理
        addButtonsToStackView()
 
    }
    
    // ボタンを作成する関数
    private func addButtonsToStackView() {
        let numberOfButtons = 2
  
        for i in 1...numberOfButtons {
            
            // 外部からクラスを呼ぶとうまくいく
            let button = SnackButton()
            
            button.tag = i
            button.setTitle("Show SnackBar : \(i)", for: .normal)
            
            configureButton()
            
            button.addTarget(self, action: #selector(didTappedButton(_:)), for: .touchUpInside)
            
            HStackView.addArrangedSubview(button)
        }
        
    }
    
    // ボタンの構成
    private func configureButton() {
        
//        snackButton.backgroundColor = UIColor.white
//        snackButton.setTitleColor( UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0), for: .normal)
//        snackButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
//        snackButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
//        snackButton.layer.cornerRadius = 15.0
//        snackButton.layer.borderColor =  UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0).cgColor
//        snackButton.layer.borderWidth = 2
        
    }
    
    @objc private func didTappedButton(_ sender: UIButton) {
        
        if sender.tag == 1 {
            print("firstButton")
        }
        else {
            print("SecondButton")
        }
    }
    
    // オートレイアウト
    private func setStackViewConstraits() {
        
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        HStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        HStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        HStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        HStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.size.height * 0.85 ).isActive = true
    }
    
    }
    
    
