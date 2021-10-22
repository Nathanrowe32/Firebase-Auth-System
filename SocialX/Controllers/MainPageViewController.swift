//
//  MainPageViewController.swift
//  SocialX
//
//  Created by Nathan Rowe on 9/27/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//
// TEST ACCOUNT INFO:
// EMAIL: nathan@nathan.com
// PASS: password123!

import Foundation
import UIKit
import Firebase

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var welcomeText: UILabel!
    let db = Firestore.firestore()
    var user = Auth.auth().currentUser

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user == nil {
            print("NO USER FOUND")
            Utilities.transitionToLogIn(view, storyboard!)
        } else {
            scrapeUserData(user!)
            setDisplay(user!)
        }
        // Do any additional setup after loading the view.
    }


    func setDisplay(_ user: User?) {
        //COULD POSSIBLY USE SCRAPEUSERDATA FUNCTION IN HERE.
        let data = db.collection("UserData").document(user!.uid)
        data.getDocument { (document, err) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                let username = dataDescription!["username"]
                print("Document data: \(dataDescription)")
                self.welcomeText.text = "Welcome \(username!)"
            } else {
                print("Document couldnt be found")
                self.welcomeText.text = "Fail to get data"
            }

        }
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            Utilities.transitionToLogIn(view, storyboard!)
        } catch {
            print("Error signing out")
        }
    }
    
    func scrapeUserData(_ user: User) {
        //will take userIUD and run thru all documents
            //once it finds a match it will take a screenshot of data
                //displays data on screen (ie. username, preferences, etc.)
            // if error finding data will display error finding data
        //send data back to main frame.
    }

  @IBAction func profileButtonPressed(_ sender: Any) {
    Utilities.transitionToProfile(self.view, self.storyboard!)
    }
    @IBAction func exploreButtonPressed(_ sender: Any) {
        Utilities.transitionToExplore(self.view, self.storyboard!)
    }
}
