//
//  ChatCell.swift
//  ParseChat
//
//  Created by Heekyung kim on 3/15/19.
//  Copyright © 2019 Heekyung kim. All rights reserved.
//

import UIKit
import Parse

class ChatCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}
