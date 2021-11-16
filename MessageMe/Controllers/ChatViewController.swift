//
//  ChatViewController.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 23/05/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class ChatViewController: UIViewController {
    @IBOutlet weak var chatView: UITableView!
    @IBOutlet weak var textField: UITextField!
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "MessageMe"
        loadMessages()
        chatView.dataSource = self
        chatView.register(UINib(nibName: M.General.messageCell, bundle: nil), forCellReuseIdentifier: M.General.messageCell)
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem) {
        let fireAuth = Session()
        fireAuth.logOut()
        navigationController?.pushViewController(WelcomeViewController(), animated: true)
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if let messageBody = textField.text, let sender = Auth.auth().currentUser?.email {
            db.collection(M.Fire.collection).addDocument(data: [
                M.Fire.sender: sender,
                M.Fire.body: messageBody,
                M.Fire.date: Date().timeIntervalSince1970
            ]) { err in
                if let error = err {
                    print("Error writing the document: \(error)")
                } else {
                    print("Document successfully written!")
                    DispatchQueue.main.async { self.textField.text = "" }
                }
            }
        }
    }
    
    func loadMessages() {
        db.collection(M.Fire.collection)
            .order(by: M.Fire.date)
            .addSnapshotListener { query, err in
                self.messages = []
                if let error = err {
                    print("There was an error loading messages from Firestore: \(error)")
                } else {
                    if let docs = query?.documents {
                        for doc in docs {
                            let data = doc.data()
                            if let sender = data[M.Fire.sender] as? String, let body = data[M.Fire.body] as? String {
                                let message = Message(sender: sender, body: body)
                                self.messages.append(message)
                                
                                DispatchQueue.main.async {
                                    self.chatView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.chatView.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                            }
                        }
                    }
                }
            }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = chatView.dequeueReusableCell(withIdentifier: M.General.messageCell, for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.senderImage.isHidden = true
            cell.userImage.isHidden = false
            cell.messageBox.backgroundColor = M.General.userMessageColor
        } else {
            cell.senderImage.isHidden = false
            cell.userImage.isHidden = true
            cell.messageBox.backgroundColor = M.General.senderMessageColor
        }
        return cell
    }
}
