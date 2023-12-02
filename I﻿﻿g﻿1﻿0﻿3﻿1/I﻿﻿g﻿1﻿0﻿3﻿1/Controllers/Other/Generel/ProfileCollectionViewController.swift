//
//  ProfileCollectionViewController.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/6.
//

import UIKit

//private let reuseIdentifier = "ProfileCollectionViewCell"
//private let reuseIdentifier = "ProfileCollectionViewController"

class ProfileCollectionViewController: UICollectionViewController {
    
    let identifier = "ProfileCollectionViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        
        print("**ProfileCollectionViewController")
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProfileCollectionViewCell
    
        //﻿ 加載圖片到imageView
        cell.imageView.image = UIImage(named: "placeholderImage.png")
        
    
        return cell
    }
}
