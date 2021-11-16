//
//  WelcomeViewController.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 23/05/2021.
//

import UIKit
import FirebaseAuth

class WelcomeViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
