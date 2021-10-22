//
//  SignInViewController.swift
//  SocialX
//
//  Created by Nathan Rowe on 9/26/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
        //validate user
        let error = validateFields()
        if error != nil {
            Utilities.showError(error!, errorLabel)
        } else {
        let cleanEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //login user
            Auth.auth().signIn(withEmail: cleanEmail, password: cleanPassword) { (result, err) in
                if err != nil {
                    Utilities.showError(err!.localizedDescription, self.errorLabel)
                } else {
                    Utilities.transitionToHome(self.view, self.storyboard!)
                }
            }
        }
    }
   
    //makes sure there is a password and username
    func validateFields() -> String? {
        if password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        return nil
    }
}
