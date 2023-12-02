//
//  ProfileCollectionViewCell.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/6.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    let identifier = "ProfileCollectionViewCell"
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill // 设置图片内容模式
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        addSubview(imageView)
        
        // ﻿﻿﻿添加﻿﻿imageView﻿到cell﻿的contentView
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        print("**ProfileCollectionViewCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
}
