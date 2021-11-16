//
//  User.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 23/05/2021.
//

import Foundation

class User {
    var uid: String
    var email: String
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
