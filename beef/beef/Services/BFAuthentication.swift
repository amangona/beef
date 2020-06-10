//
//  Authentication.swift
//  beef

import Foundation
import Firebase

class BFAuthentication {
    
    static var shared = BFAuthentication()
    var db = Firestore.firestore()
    
//    func addAnonymousUser(completion: @escaping ((User) -> ()) {
//        Auth.auth().signInAnonymously { (authResult, error) in
//            if error == nil {
//                let user = User(id: authResult!.user.uid)
//            } else {
//                print("😩Error creating user..")
//            }
//        }
//    }
    
    func createUser(user: User, completion: @escaping ((Bool)-> ())) {
        db.collection("users").document(user.id!).setData(user.toJSON()) { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func auth(with type: AuthType, completion: @escaping () -> ()) {
        switch type {
        case .apple:
            appleAuth {
                completion()
            }
        case .phone:
            phoneAuth {
                completion()
            }
        case .snapchat:
            snapchatAuth {
                completion()
            }
        case .twitter:
            twitterAuth {
                completion()
            }
      }
    }
    func appleAuth(completion: @escaping () -> ()) {
        completion()
    }
    func phoneAuth(completion: @escaping () -> ()) {
        completion()
    }
    func snapchatAuth(completion: @escaping () -> ()) {
        completion()
    }
    func twitterAuth(completion: @escaping () -> ()) {
       completion()
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

