//
//  PhotoCollectionViewCell.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/18.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // static 可以用於定義靜態成員變數或靜態方法
    // 這裡的 static let 屬於靜態的常數
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
//    override func layoutSubViews() {
//        super.layoutSubviews()
//        photoImageView.frame = contentView.bounds
//    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
//        photoImageView.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "User post image"
        accessibilityHint = "Double-tap to opne post"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    public func configure(with model: String) {
//        let thumbnailURL = model.thumbnailImage
//            
//    }
//    
//    public func configure(with imageName: String) {
//        photoImageView.image = UIImage(named: imageName)
//    }
    
}
