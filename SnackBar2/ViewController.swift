//
//  ViewController.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/12.
//

import UIKit

class ViewController: UIViewController {
    
    // 構成要素
    private let HStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .center
        view.spacing = 5
        
        return view
    }()
    
    private let snackButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitleColor( UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        button.layer.cornerRadius = 15.0
        button.layer.borderColor =  UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0).cgColor
        button.layer.borderWidth = 2
        
        return button
    }()

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

        // ボタンをスタックビューに追加する処理
        addButtonsToStackView()
        
    }
    
    // ボタンを作成する関数
    private func addButtonsToStackView() {
        let numberOfButtons = 2
        
        for i in 1...numberOfButtons {
            let button = snackButton
            button.tag = i
            button.setTitle("Show SnackBar : \(i)", for: .normal)
            
            button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
            
            HStackView.addArrangedSubview(button)
        }
        
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
    
    
