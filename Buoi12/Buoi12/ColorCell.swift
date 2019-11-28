//
//  ColorCell.swift
//  Buoi12
//
//  Created by Quân on 11/16/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ColorCell: UITableViewCell {

    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var tfAvatar: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(shoe: Shoe){
        //code
        tfAvatar.text = shoe.style
    }

}
