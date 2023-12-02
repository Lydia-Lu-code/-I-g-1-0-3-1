//
//  PostFeedInterfaceViewController.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/1.
//

import UIKit

class PostFeedInterfaceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let identifier = "PostFeedInterfaceViewController"
    
    private var tableView: UITableView = UITableView()
    private var postFeeds: [PostFeed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        
        view.addSubview(tableView)
        
        loadSampleData()
    }
    
    func loadSampleData() {
        let postFeed1 = PostFeed(username: "user1", mediaURL: URL(string: "https://via.placeholder.com/150")!, caption: "Sample caption 1")
        let postFeed2 = PostFeed(username: "user2", mediaURL: URL(string: "https://via.placeholder.com/150")!, caption: "Sample caption 2")

        postFeeds = [postFeed1, postFeed2]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let postFeed = postFeeds[indexPath.row]
        let post = postFeed.toPost()
        
        cell.configure(with: post)
        return cell
    }
    
}

struct PostFeed {
    var username: String
    var mediaURL: URL
    var caption: String
    
    func toPost() -> Post {
        let postId = generatePostId()
        let timesTamp = Date()
        let likes = 0
        let comments: [Comment] = []
        let location = ""
        
        return Post(postId: postId, username: username, mediaURL: mediaURL, caption: caption, timesTamp: timesTamp, likes: likes, comments: comments, location: location)
    }
    
    private func generatePostId() -> String {
        return "someUniquePostId"
    }
}
