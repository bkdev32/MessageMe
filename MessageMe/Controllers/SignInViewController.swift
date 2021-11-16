//
//  SignInViewController.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 23/05/2021.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let fireAuth = Session()
        if let email = emailField.text, let password = passwordField.text {
            fireAuth.signIn(email, password) { result, error in
                if let error = error {
                    self.makeAlert(title: "Error", message: error.localizedDescription)
                    print(error.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: M.Segue.signInToChats, sender: self)
                }
            }
        }
    }
}
