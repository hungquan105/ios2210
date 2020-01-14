//
//  ContentCell.swift
//  client
//
//  Created by Quân on 1/14/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {

    @IBOutlet weak var lbContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        lbContent.backgroundColor = .blue
        lbContent.textColor = .white
        // layout
        lbContent.translatesAutoresizingMaskIntoConstraints = false
        lbContent.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
