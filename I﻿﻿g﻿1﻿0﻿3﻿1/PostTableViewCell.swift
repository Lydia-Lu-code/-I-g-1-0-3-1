//
//  PostTableViewCell.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/10/31.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(postImageView)
    contentView.addSubview(usernameLabel)
    contentView.addSubview(captionLabel)
    
    NSLayoutConstraint.activate([
        
        postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        postImageView.widthAnchor.constraint(equalToConstant: 100),
        postImageView.heightAnchor.constraint(equalToConstant: 100),
        
        usernameLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 10),
        usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        
        captionLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 10),
        captionLabel.topAnchor
            .constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
    ])
        print("**PostCell V")
}

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
}
