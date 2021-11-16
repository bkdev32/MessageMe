//
//  SignUpViewController.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 23/05/2021.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        let fireAuth = Session()
        if passwordField.text == confirmPasswordField.text {
            if let email = emailField.text, let password = passwordField.text {
                fireAuth.signUp(email, password) { result, error in
                    if let error = error {
                        self.makeAlert(title: "Error", message: error.localizedDescription)
                        print(error.localizedDescription)
                    } else {
                        self.performSegue(withIdentifier: M.Segue.signUpToChats, sender: self)
                    }
                }
            }
        } else {
            makeAlert(title: "Error", message: "Passwords are not matching")
            print("Passwords are not matching")
        }
    }
}
