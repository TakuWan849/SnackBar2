//
//  SnackViewController.swift
//  SnackBar2
//
//  Created by 野澤拓己 on 2020/11/13.
//

import UIKit

class SnackViewController: UIViewController {
    
    /// -  構成要素
    private let HStackView = UIStackView()

    /// -  layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStackView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setStackViewConstraits()
    }
    
    /// -  StackViewの設定
    private func configureStackView() {
        view.addSubview(HStackView)
        
        HStackView.axis = .horizontal
        HStackView.distribution = .fillEqually
        HStackView.alignment = .center
        HStackView.spacing = 10

        // ボタンをスタックビューに追加する処理
        addButtonsToStackView()
 
    }
    
    /// -  ボタンを作成する関数
    private func addButtonsToStackView() {
        let numberOfButtons = 2
  
        for i in 1...numberOfButtons {
            
            // 外部からクラスを呼ぶとうまくいく
            let button = ShowButton()
            
            button.tag = i
            button.setTitle("Show SnackBar : \(i)", for: .normal)
            
            button.addTarget(self, action: #selector(didTappedButton(_:)), for: .touchUpInside)
            
            HStackView.addArrangedSubview(button)
        }
        
    }
    
    /// -  ボタンタップ時のイベント
    @objc private func didTappedButton(_ sender: UIButton) {
        
        let viewModel : SnackBarViewModel
        
        if sender.tag == 1 {
//            print("firstButton")
            viewModel = SnackBarViewModel.init(
                type: .info,
                text: "Hello world",
                image: UIImage(systemName: "house")
            )
        }
        else {
//            print("SecondButton")
            viewModel = SnackBarViewModel.init(
                type: .action(handler: { [weak self] in
                    DispatchQueue.main.async {
                        self?.showAlert()
                    }
                }),
                text: "Show Alert",
                image: nil
            )
        }
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.size.width / 1.5, height: 60)
        let snackBar = SnackBarView(viewModel: viewModel, frame: frame)
        
        showSnackBar(snackBar: snackBar)
    }
    
    /// -  Event
    private func showAlert() {
        
        let alert = UIAlertController(
            title: "Work",
            message: "Tapped Action!",
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Dismiss",
                style: .cancel,
                handler: nil
        ))
        
        present(alert, animated: true)
    }
    
    private func showSnackBar(snackBar: SnackBarView) {
        // SnackBarViewが現れる処理
        let width = view.frame.size.width / 1.2
        
        // 初期位置
        // didTappedButtonで指定したframeの上書き
        snackBar.frame = CGRect(
            x: (view.frame.size.width - width) / 2,
            y: view.frame.size.height,
            width: width,
            height: 60
        )
        
        view.addSubview(snackBar)
        
        // 出現
        UIView.animate(withDuration: 0.5, animations: {
            
            snackBar.frame = CGRect(
                x: (self.view.frame.size.width - width) / 2,
                y: self.view.frame.size.height - 70,
                width: width,
                height: 60
            )
            
        }, completion: { done in
            // 出現が完了していたときの処理
            if done {
                
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        // 初期位置に戻る
                        snackBar.frame = CGRect(
                            x: (self.view.frame.size.width - width) / 2,
                            y: self.view.frame.size.height,
                            width: width,
                            height: 60
                        )
                        
                    }, completion: { finished in
                        
                        snackBar.removeFromSuperview()
                        
                    })
                    
                }
                
            }
            
        })
        
        
    }
    
    /// -  オートレイアウト
    private func setStackViewConstraits() {
        
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        HStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        HStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        HStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    

}
