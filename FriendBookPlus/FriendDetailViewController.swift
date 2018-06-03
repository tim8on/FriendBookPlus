//
//  FriendDetailViewController.swift
//  FriendBookPlus
//
//  Created by Tim Aton on 6/3/18.
//  Copyright © 2018 Tim Aton. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    //add all the UI elements from the storyboard
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var friendName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //make the name label whatever is in that variable
        self.nameLabel.text = self.friendName
    }

}
