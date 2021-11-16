//
//  SceneDelegate.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 23/05/2021.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var handle: AuthStateDidChangeListenerHandle?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        self.loadRootController()
    }
    
    func loadRootController() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let window = self.window else { return }
        window.makeKeyAndVisible()
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                print("User Logged in")
                let homeVC: ChatViewController = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
                let navigationHomeVC = UINavigationController(rootViewController: homeVC)
                self.window?.rootViewController = navigationHomeVC
            } else {
                print("User NOT Logged in")
                let loginVC: WelcomeViewController = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
                self.window?.rootViewController = loginVC
            }
        }
        self.window?.makeKeyAndVisible()
    }
}
