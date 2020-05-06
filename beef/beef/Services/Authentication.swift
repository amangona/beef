//
//  Authentication.swift
//  beef
//
//  Created by abe on 5/4/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import Foundation
import FirebaseAuth

class Authentication {
    
    static var shared = Authentication()
    
    func signup(with email: String, password: String, completion: @escaping ((Bool) ->())) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
               completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func login(with email: String, password: String, completion: @escaping ((Bool) ->())) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
               completion(false)
            } else {
               completion(true)
            }
        }
    }
}
