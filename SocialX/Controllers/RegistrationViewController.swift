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
            Utilities.showError(error!, errorLabel)
        }
        else {
    
            //create cleaned credientials
            let cleanEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let usernameString = username.text!
            //create user
            Auth.auth().createUser(withEmail: cleanEmail, password: cleanPassword) { (authResult, err) in
                //check for errors
                guard let user = authResult?.user, error == nil else {
                    Utilities.showError("Error creating user", self.errorLabel)
                    return
                }
                //adds user data to firestore.
                let db = Firestore.firestore()
                db.collection("UserData").document(user.uid).setData([
                    "email": cleanEmail,
                    "username": usernameString,
                    "uid": user.uid,
                    "timestamp": FieldValue.serverTimestamp()
                ])
                Utilities.transitionToLogIn(self.view, self.storyboard!)
            }
        }
     }
}
