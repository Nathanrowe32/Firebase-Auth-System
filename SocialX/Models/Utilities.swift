//
//  User.swift
//  SocialX
//
//  Created by Nathan Rowe on 9/26/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//

import UIKit
import Foundation

class Utilities: UIViewController  {

    var email: String?
    var username: String?
    var password: String?
    
    //checks to see if password valid
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    //checks to see if email is valid
    static func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    //takes in a error message and displays it in the UILabel
    //assume the UILabel.alpha = 0
    static func showError(_ message: String,_ textbox: UILabel) {
        textbox.text! = message
        textbox.alpha = 1
        
    }
    
    static func buildNavbar() {
        
    }
    
    
    //transitions sets the view to Profile.
    static func transitionToProfile(_ view: UIView, _ storyboard: UIStoryboard) {
        let profileViewController = storyboard.instantiateViewController(identifier: Constants.Storyboard.profileViewController) as? ProfilePageViewController

        view.window?.rootViewController = profileViewController
        view.window?.makeKeyAndVisible()
    }
    
    //transitions view to Login.
    static func transitionToLogIn(_ view: UIView, _ storyboard: UIStoryboard) {
        //displays a message on login about account creation.
        let loginViewController = storyboard.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? SignInViewController
        view.window?.rootViewController = loginViewController
        view.window?.makeKeyAndVisible()
    }
    
    //transitions view to Home.
    static func transitionToHome(_ view: UIView, _ storyboard: UIStoryboard) {
        let homeViewController = storyboard.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? MainPageViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    //transitions sets the view to Explore.
    static func transitionToExplore(_ view: UIView, _ storyboard: UIStoryboard) {
        let exploreViewController = storyboard.instantiateViewController(identifier: Constants.Storyboard.exploreViewController) as? ExplorePageViewController

        view.window?.rootViewController = exploreViewController
        view.window?.makeKeyAndVisible()
    }
}
