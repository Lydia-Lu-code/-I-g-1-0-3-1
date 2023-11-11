//
//  Post.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/10/31.
//

import Foundation

struct Post {
    
    var postId: String //帖子ID： 用於唯一識別每個帖子的標識符。
    var username: String //用戶名： 發布該帖子的用戶名稱。
    var mediaURL: URL //圖片或視頻： 帖子的媒體內容，可以是圖像或視頻文件的引用。
    var caption: String //標題或描述： 帖子的標題或描述，通常是文字。
    var timesTamp: Date? //日期和時間： 帖子的發布日期和時間。
    var likes: Int //喜歡數量： 喜歡或點贊的數量。
    var comments: [Comment] //評論： 帖子的評論，每個評論可能包括評論者的用戶名和評論內容。
    var location: String //位置： 帖子的地理位置信息，如果適用的話。
//    var image: UIImage?
        
}

struct Comment {
    var username: String
    var text: String
}


