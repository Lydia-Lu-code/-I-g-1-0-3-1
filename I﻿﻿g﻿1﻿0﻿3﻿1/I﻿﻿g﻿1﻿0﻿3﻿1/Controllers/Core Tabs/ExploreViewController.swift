//
//  ExploreViewController.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/2.
//

import UIKit
import Foundation

//// ﻿定義 ﻿Video ﻿類型
//struct Video {
//    let title: String
//    let description: String
//    let videoURL: URL
//    }

class ExploreViewController: UIViewController {
    
    let identifier = "ExploreViewController"

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .secondarySystemBackground
        return searchBar
    }()
    
    private var collectionView: UICollectionView?
    
    var videoData: [Video] = []
    var filteredVideoData: [Video] = []
    
    let video1 = Video(title: "Video 1", description: "This is the first video.", videoURL: URL(string: "https://example.com/video1.mp4")!)
    let video2 = Video(title: "Video 2", description: "Another video to watch.", videoURL: URL(string: "https://example.com/video2.mp4")!)
    let video3 = Video(title: "Video 3", description: "A third video for you.", videoURL: URL(string: "https://example.com/video3.mp4")!)
    let video4 = Video(title: "Video 4", description: "This is the first video.", videoURL: URL(string: "https://example.com/video4.mp4")!)
    let video5 = Video(title: "Video 5", description: "Another video to watch.", videoURL: URL(string: "https://example.com/video5.mp4")!)
    let video6 = Video(title: "Video 6", description: "A third video for you.", videoURL: URL(string: "https://example.com/video6.mp4")!)
    let video7 = Video(title: "Video 7", description: "This is the first video.", videoURL: URL(string: "https://example.com/video1.mp4")!)
    let video8 = Video(title: "Video 8", description: "Another video to watch.", videoURL: URL(string: "https://example.com/video8.mp4")!)
    let video9 = Video(title: "Video 9", description: "A third video for you.", videoURL: URL(string: "https://example.com/video9.mp4")!)
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // ﻿設置﻿搜索框﻿的﻿代理
//        searchBar.delegate = self
//        searchBar.searchBarStyle = .minimal
//        searchBar.placeholder = "﻿搜尋"
//        searchBar.sizeToFit()
//        view.addSubview(searchBar)
//        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
        //﻿ 設置 Collection View ﻿﻿的﻿代理﻿﻿和﻿數據
//        collectionView.dataSource = self
//        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView?.delegate = self
//        collectionView?.dataSource = self
        
        guard let collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
        
//            layout.minimumInteritemSpacing = 1
//            layout.minimumLineSpacing = 1
//            let itemWidth = (view.bounds.width - 2) / 3 // 3﻿格
//            layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        
        

        view.addSubview(collectionView)
        
        // ﻿初始化 videoData，﻿添加影片信息
        videoData = [video1, video2, video3, video4, video5, video6, video7, video8, video9]
        
        // 隨機排序 videoData
        videoData.shuffle()
        
        // 刷新 Collection View
        collectionView.reloadData()
        
        collectionView.register(ExploreVideoCollectionViewCell.self, forCellWithReuseIdentifier: "ExploreVideoCollectionViewCell")
        
        searchBar(searchBar, textDidChange: "Video")
        
        // Set
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredVideoData = videoData.filter{ $0.title.contains(searchText) }
        collectionView!.reloadData()
    }

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return searchBar.text?.isEmpty == false ? filteredVideoData.count : videoData.count
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        // 創建和配置 Collection View Cell 來顯示影片信息
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreVideoCollectionViewCell", for: indexPath) as! ExploreVideoCollectionViewCell
//        
//        // ﻿根據﻿ indexPath﻿ ﻿設置﻿ cell﻿﻿﻿ 的內容
//        let video: Video
//        if searchBar.text?.isEmpty == false {
//            video = filteredVideoData[indexPath.item]
//        } else {
//            video = videoData[indexPath.item]
//            
//        }
//        
//        cell.titleLabel.text = video.title
//        return cell
//    }

}

extension ExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchBar.text?.isEmpty == false ? filteredVideoData.count : videoData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreVideoCollectionViewCell", for: indexPath) as! ExploreVideoCollectionViewCell
        
        let video: Video
        if searchBar.text?.isEmpty == false {
            video = filteredVideoData[indexPath.item]
        } else {
            video = videoData[indexPath.item]
        }
        
        cell.titleLabel.text = video.title
        return cell
    }
}
