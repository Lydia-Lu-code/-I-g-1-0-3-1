//
//  PostTableViewCell.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/10/31.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let identifier = "PostTableViewCell"
    
    // 帖子圖片視圖
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 用戶名標籤
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    // 帖子內容標籤
    let captionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(postImageView)
    contentView.addSubview(usernameLabel)
    contentView.addSubview(captionLabel)
    
//        self.contentView.backgroundColor = UIColor.lightGray
        
    NSLayoutConstraint.activate([
        
        postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        postImageView.widthAnchor.constraint(equalToConstant: 100),
        postImageView.heightAnchor.constraint(equalToConstant: 100),
        
        usernameLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 10),
        usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        
        captionLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 10),
        captionLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
        captionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
    ])
        print("**PostCell V")
}

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with post: Post) {
        postImageView.image = UIImage(named: "placeholderImage")
//        postImageView.image = UIImage(data: try! Data(contentsOf: post.mediaURL))
        usernameLabel.text = post.username
        captionLabel.text = post.caption
    }
    
}

