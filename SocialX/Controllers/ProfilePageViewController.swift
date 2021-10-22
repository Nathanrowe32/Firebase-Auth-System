//
//  ProfilePageViewController.swift
//  SocialX
//
//  Created by Nathan Rowe on 10/21/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class ProfilePageViewController: UIViewController {
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioTextview: UITextView!
    let db = Firestore.firestore()
    var user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDisplay(user!)
        // Do any additional setup after loading the view.
    }
    
    func setDisplay(_ user: User?) {
        //COULD POSSIBLY USE SCRAPEUSERDATA FUNCTION IN HERE.
        let data = db.collection("UserData").document(user!.uid)
        data.getDocument { (document, err) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                let username = dataDescription!["username"]
                self.usernameLabel.text = "\(username!)"
            } else {
                print("Document couldnt be found")
            }

        }
    }
    @IBAction func homeButtonPressed(_ sender: Any) {
        Utilities.transitionToHome(self.view, self.storyboard!)
    }
    @IBAction func exploreButtonPressed(_ sender: Any) {
        Utilities.transitionToExplore(self.view, self.storyboard!)
    }
    
}
