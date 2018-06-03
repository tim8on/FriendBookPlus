//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by Tim Aton on 6/2/18.
//  Copyright © 2018 Tim Aton. All rights reserved.
//

import UIKit

//add "UITableViewDataSource" & "UITableViewDelegate" for the table view
class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //add the table view from UI
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //where is the table view looking for the rows and cells? (itself)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //1. how many rows?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //2. what's in each row/cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = "aye"
        return cell
    }

}

