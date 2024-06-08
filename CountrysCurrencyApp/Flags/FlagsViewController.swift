//
//  FlagsViewController.swift
//  CountrysCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import UIKit

class FlagsViewController: UITableViewController {
    
    private var postsModel = FlagsModel()

//    override init(style: UITableView.Style) {
//        super.init(style: style)
//        tabBarItem.image = UIImage(systemName: "text.viewfinder")
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(postsModel)
//        navigationItem.title = "Post"
//        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.name)
//        try? postsModel.getPost()
//        tableView.reloadData()
    }

}

