//
//  Constants.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 24/05/2021.
//

import UIKit

enum M {
    enum Segue {
        public static let toSignIn = "toSignInVC"
        public static let toSignUp = "toSignUpVC"
        public static let signUpToChats = "signUpToChatVC"
        public static let signInToChats = "signInToChatVC"
    }
    enum General {
        public static let messageCell = "MessageCell"
        public static let userMessageColor = UIColor(named: "electronBlue")
        public static let senderMessageColor = UIColor(named: "soothingBreeze")
        public static let green = UIColor(named: "greenSea")
    }
    enum Fire {
        public static let collection = "messages"
        public static let sender = "sender"
        public static let body = "body"
        public static let date = "date"
    }
}
