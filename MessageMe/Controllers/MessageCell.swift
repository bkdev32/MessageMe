//
//  MessageCell.swift
//  MessageMe
//
//  Created by Burhan Kaynak on 24/05/2021.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var messageBox: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBox.layer.cornerRadius = messageBox.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
