import UIKit
import Foundation

    // 定義 Video 類型
struct Video {
    let title: String
    let description: String
    let videoURL: URL
    }

class SearchViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let identifier = "SearchViewController"

    let searchBar = UISearchBar()

    // 設定 CollectionView 的位置
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var videoData: [Video] = []
    var filteredVideoData: [Video] = []
    
    // 做測試用的例子
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
        
        // 設置 搜索框 的 代理
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = " 搜尋"
        searchBar.sizeToFit()
        view.addSubview(searchBar)
        
        // 設置 Collection View 的 代理 和 數據
        collectionView.dataSource = self
        collectionView.delegate = self
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 1
            flowLayout.minimumLineSpacing = 1
            let itemWidth = (view.bounds.width - 2) / 3 // 3 格
            flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        }
        view.addSubview(collectionView)
        
        //  初始化 videoData，添加影片信息
        videoData = [video1, video2, video3, video4, video5, video6, video7, video8, video9]
        
        // 隨機排序 videoData
        videoData.shuffle()
        
        // 刷新 Collection View
        collectionView.reloadData()
        
        // SearchVideoCollectionViewCell.self 指定 cell 的類型，即 SearchVideoCollectionViewCell 類別。
        collectionView.register(SearchVideoCollectionViewCell.self, forCellWithReuseIdentifier: "SearchVideoCollectionViewCell")
        
        
        // Set

        // 當 translatesAutoresizingMaskIntoConstraints 設置為 false 時，表示你打算使用 Auto Layout 進行佈局，而不是依賴於 autoresizing mask 屬性。這是在使用 Auto Layout 時的一般行為。
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
        // 搜索標題中包含特定文字的影片資料，並將結果存儲在 filteredVideoData 這個新的陣列中。
        filteredVideoData = videoData.filter{ $0.title.contains(searchText) }
        
        // 從新載入 collectionView 資料
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchBar.text?.isEmpty == false {
            return filteredVideoData.count
        } else {
            return videoData.count
        }
//        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 創建和配置 Collection View Cell 來顯示影片信息
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchVideoCollectionViewCell", for: indexPath) as! SearchVideoCollectionViewCell
        
        //  根據 indexPath 設置 cell 的內容
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
