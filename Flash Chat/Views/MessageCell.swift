//
//  MessageCell.swift
//  Flash Chat
//
//  Created by siwakorn soyruangsri on 14/2/2567 BE.
//  Copyright © 2567 BE Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubble.layer.cornerRadius = frame.size.height / 5
              
              leftImageView.layer.cornerRadius = frame.size.width / 15
              leftImageView.layer.masksToBounds = false
              leftImageView.clipsToBounds = true
              
              rightImageView.layer.cornerRadius = frame.size.width / 15
              rightImageView.layer.masksToBounds = false
              rightImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
