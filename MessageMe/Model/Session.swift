//
//  Session.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 23/05/2021.
//

import UIKit
import Combine
import Firebase

class Session {
    var didChange = PassthroughSubject<Session, Never>()
    var handle: AuthStateDidChangeListenerHandle?
    var session: User? {
        didSet {
            self.didChange.send(self)
        }
    }
    
    func signIn(_ email: String, _ password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signUp(_ email: String, _ password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.session = nil
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
