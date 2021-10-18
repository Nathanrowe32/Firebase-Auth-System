//
//  firebaseUser.swift
//  SocialX
//
//  Created by Nathan Rowe on 10/5/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//


//  NOT IN USE.
import Foundation
import FirebaseAuth
import Firebase

class FirebaseUser: NSObject {
    
    var user: User?

    func setUser(setUser: User) {
        self.user = setUser
    }
    
    func getUser() -> User {
        return user!
    }
}
