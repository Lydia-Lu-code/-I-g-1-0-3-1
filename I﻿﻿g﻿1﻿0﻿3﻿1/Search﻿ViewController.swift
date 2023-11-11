//
//  SearchviewController.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/2.
//

import UIKit
import Foundation

// ﻿定義 ﻿Video ﻿類型
struct Video {
    let title: String
    let description: String
    let videoURL: URL
    }

class Search﻿ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let identifier = "Search﻿ViewController"

    let searchBar = UISearchBar()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var videoData: [Video] = []
    var filteredVideoData: [Video] = []
    
    let video1 = Video(title: "Video 1", description: "This is the first video.", videoURL: URL(string: "https://example.com/video1.mp4")!)
    let video2 = Video(title: "Video 2", description: "Another video to watch.", videoURL: URL(string: "https://example.com/video2.mp4")!)
    let video3 = Video(title: "Video 3", description: "A third video for you.", videoURL: URL(string: "https://example.com/video3.mp4")!)
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ﻿設置﻿搜索框﻿的﻿代理
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "﻿搜尋"
        searchBar.sizeToFit()
        
        // 將搜索框添加到navigationBar上
        navigationItem.titleView = searchBar
        if let titleView = navigationItem.titleView {
            titleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
        //﻿ 設置 Collection View ﻿﻿的﻿代理﻿﻿和﻿數據
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let collectionViewFrame = CGRect(x: 0, y: searchBar.frame.maxY + 10, width: view.bounds.width, height: view.bounds.height - searchBar.frame.maxY - 10)
            collectionView.frame = collectionViewFrame

        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 1
            flowLayout.minimumLineSpacing = 1
            let itemWidth = (view.bounds.width - 2) / 3 // 3﻿格
            flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        }

        view.addSubview(collectionView)
        
        // ﻿初始化 videoData，﻿添加影片信息
        videoData = [video1, video2, video3]
        
        // 隨機排序 videoData
        videoData.shuffle()
        
        // 刷新 Collection View
        collectionView.reloadData()
        
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        collectionView.register(SearchVideoCollectionViewCell.self, forCellWithReuseIdentifier: "SearchVideoCollectionViewCell")
        
        let searchViewController = Search﻿ViewController()
        self.present(searchViewController, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredVideoData = videoData.filter{ $0.title.contains(searchText) }
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchBar.text?.isEmpty == false ? filteredVideoData.count : videoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 創建和配置 Collection View Cell 來顯示影片信息
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchVideoCollectionViewCell", for: indexPath) as! SearchVideoCollectionViewCell
        
        return cell
    }

}
