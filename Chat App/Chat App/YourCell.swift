//
//  YourCell.swift
//  Chat App
//
//  Created by User on 2022/01/01.
//

import UIKit

class YourCell: UITableViewCell {

    @IBOutlet weak var yourTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
