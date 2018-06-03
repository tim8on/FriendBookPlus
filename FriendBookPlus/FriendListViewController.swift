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
    
    //array of friends to pull from
    var friends = ["Alec", "Hanna", "Lindsay", "Melissa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //where is the table view looking for the rows and cells? (itself)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //1. how many rows?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //however many names there are in the friends array
        return self.friends.count
    }
    
    //2. what's in each row/cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //make a variable to put stuff into
        let cell = UITableViewCell()
        
        //make a variable to pass the friend into
        let friend = self.friends[indexPath.row]
        
        //make the cell name the friend name
        cell.textLabel!.text = friend
        
        return cell
    }
    
    //when cell is tapped, move to next screen
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //deselect the row after clicking it (so it doesn't stay grey)
        tableView.deselectRow(at: indexPath, animated: true)
        
        //pass the friend name into this variable
        let friend = self.friends[indexPath.row]
        
        //perform the segue I made in the storyboard & pass the friend name
        self.performSegue(withIdentifier: "detailSegue", sender: friend)
    }
    
    //pass info to the detail screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //gives access to change the detail screen's UI elements
        let detailVC = segue.destination as! FriendDetailViewController
        
        //make the label in the next screen whatever was passed
        detailVC.friendName = sender as! String
    }

}

