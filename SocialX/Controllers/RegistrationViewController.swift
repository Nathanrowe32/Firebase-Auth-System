//
//  RegistrationViewController.swift
//  SocialX
//
//  Created by Nathan Rowe on 9/26/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class RegistrationViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //check fields and validate data. returns nil for correct or error message as string.
    func validateFields() -> String? {
        if username.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        let cleanedEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isEmailValid(cleanedEmail) == false {
            return "Invalid email"
        }
        
        return nil
    }
    
     @IBAction func registerTapped(_ sender: Any) {
        //validate fields
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
    
            //create cleaned credientials
            let cleanUsername = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create user
            Auth.auth().createUser(withEmail: cleanEmail, password: cleanPassword) { (result, err) in
                //check for errors
                if err != nil {
                    //there was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    //user created successfully.
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: [
                        "email": cleanEmail,
                        "username": cleanUsername,
                        "uid": result!.user.uid
                    ]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    
                    //transition to home.
                    self.transitionToHome()
                }
            }
            //go to homescreen
        }
     }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? MainPageViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
