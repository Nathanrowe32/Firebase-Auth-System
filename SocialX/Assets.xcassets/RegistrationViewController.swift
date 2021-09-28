//
//  RegistrationViewController.swift
//  SocialX
//
//  Created by Nathan Rowe on 9/26/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var regButton: UIButton!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user = User()
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue:
        UIStoryboardSegue, sender: Any?) {
        user?.username = username.text
        user?.password = password.text
        let mpVC = segue.destination as! MainPageViewController
        mpVC.user = self.user
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
