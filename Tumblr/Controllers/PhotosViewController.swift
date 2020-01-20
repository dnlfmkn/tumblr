//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by Memo on 10/4/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Create Outlet of tableview and the posts variable
    @IBOutlet weak var photoTableView: UITableView!
    var posts: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoTableView.delegate = self
        photoTableView.dataSource = self
        photoTableView.rowHeight = 400
        getPosts()
    }
    
    
    // –––––– TODO: Get posts from APIs.swift
    func getPosts() {
        API.getPosts() {(posts) in
            if let posts = posts {
                self.posts = posts
                self.photoTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    // what content to display on the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell") as! PhotosTableViewCell
        let post = posts[indexPath.row]
        // Get image url from API
        let url = API.getImageURL(post: post)
        // Place image in cell
        cell.photoImage?.af_setImage(withURL: url)
        return cell
    }
    
}

