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
    var friends = [Friend]()
    
    //when the screen loads, do this stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //do this function right away
        createFriends()
        
        //where is the table view looking for the rows and cells? (itself)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //create friend objects
    func createFriends() {
        //made a friend named alec
        let ramsey = Friend()
        
        //assigned all the properties
        ramsey.name = "Ramsey"
        ramsey.phoneNumber = "509.496.6614"
        ramsey.birthday = "Principal"
        ramsey.picture = UIImage(named: "ramsey")!
        
        //added it to the array
        self.friends.append(ramsey)
        
        //make another friend
        let jeremy = Friend()
        jeremy.name = "Jeremy"
        jeremy.phoneNumber = "208.449.3389"
        jeremy.birthday = "Media Supervisor"
        jeremy.picture = UIImage(named: "jeremy")!
        self.friends.append(jeremy)
        
        //make another friend
        let hanna = Friend()
        hanna.name = "Hanna"
        hanna.phoneNumber = "509.688.9983"
        hanna.birthday = "Project Manager"
        hanna.picture = UIImage(named: "hanna")!
        self.friends.append(hanna)
        
        //make another friend
        let melissa = Friend()
        melissa.name = "Melissa"
        melissa.phoneNumber = "509.220.5681"
        melissa.birthday = "Graphic Designer"
        melissa.picture = UIImage(named: "melissa")!
        self.friends.append(melissa)
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
        cell.textLabel!.text = friend.name
        
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
        detailVC.friend = sender as! Friend
    }

}

