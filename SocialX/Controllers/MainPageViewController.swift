//
//  MainPageViewController.swift
//  SocialX
//
//  Created by Nathan Rowe on 9/27/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var welcomeText: UILabel!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if
           //signed in
       // } else {
            //signed out
       // }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
