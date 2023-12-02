//
//  HomeViewController.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/12.
//

import UIKit

class HomeViewController: UIViewController {

    let identifier = "HomeViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 設置 Navigation Controller 的標題和標題視圖
        navigationItem.title = "Instagram"
        setupCircularStoryButton(imageName: "image1")
        setupCircularStoryButton(imageName: "image2")
//        setupCircularStoryButton()
        
    }
    
    // 設置圓形橫移按鈕
    func setupCircularStoryButton(imageName: String) {
        let storyButton = UIButton(type: .custom)
        storyButton.setImage(UIImage(named: imageName), for: .normal)
        storyButton.addTarget(self, action: #selector(storyButtonTapped), for: .touchUpInside)
        
        // 設置按鈕外觀
        storyButton.layer.cornerRadius = 25
        storyButton.layer.masksToBounds = true
        storyButton.backgroundColor = .black // 設定背景色
        storyButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 將按鈕添加到 Navogation Bar
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.addSubview(storyButton)
            
        // 設置 AutoLayout 約束
            storyButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor).isActive = true
            storyButton.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 16).isActive = true
            storyButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
            storyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            let titleBottomConstraint = storyButton.topAnchor.constraint(lessThanOrEqualTo: navigationItem.titleView?.bottomAnchor ?? navigationBar.bottomAnchor, constant: -8)
            titleBottomConstraint.priority = UILayoutPriority(99)
            titleBottomConstraint.isActive = true
            
//            storyButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor).isActive = true
//            
//            //
//            if let lastButton = navigationBar.subviews.filter({ $0 is UIButton }).last {
//                storyButton.trailingAnchor.constraint(equalTo: lastButton.trailingAnchor, constant: 16).isActive = true
//            } else {
//                storyButton.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -16).isActive = true
//            }
//            
//            storyButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
//            storyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }

        // 圓形按鈕點擊事件
    @objc func storyButtonTapped() {
        // 跳轉到限時動態畫面
        let storyViewController = StoryViewController()
        navigationController?.pushViewController(storyViewController, animated: true)
    }


}
