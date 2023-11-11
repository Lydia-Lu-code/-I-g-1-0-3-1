//
//  InstagramTableViewController.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/10/31.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var posts: [Post] = []

    var theNavigationController: UINavigationController
    
    init() {
        theNavigationController = UINavigationController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.theNavigationController = UINavigationController()
        super.init(coder: coder)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
               
            loadSampleData()

        navigationItem.title = "Instagram"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
        
        
        
    }
    
    
    
    @objc func addButtonTapped() {
        
    }

    func loadSampleData() {
        
//        let post1 = Post(postId: "1", username: "user1", mediaURL: URL(string: "https://via.placeholder.com/150")!, caption: "Sample caption 1", timesTamp: Date(), likes: 10, comments: [], location: "Sample location 1")
//        let post2 = Post(postId: "2", username: "user2", mediaURL: URL(string: "https://via.placeholder.com/150")!, caption: "Sample caption 2", timesTamp: Date(), likes: 20, comments: [], location: "Sample location 2")
//        posts = [post1, post2]
//        
//        print("**loadSampleData.posts == \(posts)")
    }

    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
//        print("**numberOfSection/return1 ")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        print("**numberOfRowsInSection/posts.count == \(posts.count)")
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        var post = posts[indexPath.row]
        
        cell.usernameLabel.text = post.username
        cell.captionLabel.text = post.caption
   
        return cell
    }
    
}
