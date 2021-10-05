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
            //handle something
        } else {
        let cleanEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //login user
            Auth.auth().signIn(withEmail: cleanEmail, password: cleanPassword) { (result, err) in
                if err != nil {
                    self.showError(err!.localizedDescription)
                } else {
                    self.transitionToHome()
                }
            }
        }
    }
    
    func showError(_ message: String) {
        errorLabel.text! = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? MainPageViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func validateFields() -> String? {
        
        if password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        return nil
    }
}
