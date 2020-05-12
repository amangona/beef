//
//  Authentication.swift
//  beef

import Foundation
import Firebase

class BFAuthentication {
    
    static var shared = BFAuthentication()
    var db = Firestore.firestore()
    
    func createUser(user: User, completion: @escaping ((Bool)-> ())) {
        db.collection("users").document(user.id!).setData(user.toJSON()) { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
//    func createUser(with userData: UserData, completion: @escaping ((Bool)-> ())) {
//        guard let id = Auth.auth().currentUser?.uid else {
//            completion(false)
//            return
//        }
//        let user = User(userData: userData, id: id)
//        db.collection("users").document(user.id!).setData(user.toJSON()) { (error) in
//            if error != nil {
//                completion(false)
//            } else {
//                completion(true)
//            }
//        }
//    }
    
//    func createUser(completion: @escaping ((Bool)-> ())) {
//        guard
//            let id = Auth.auth().currentUser?.uid,
//            let number = Auth.auth().currentUser?.phoneNumber
//            else {
//            completion(false)
//            return
//        }
//        let user = User(id: id, phoneNumber: number)
//        db.collection("users").document(user.id!).setData(user.toJSON()) { (error) in
//            if error != nil {
//                completion(false)
//            } else {
//                completion(true)
//            }
//        }
//    }
        
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

