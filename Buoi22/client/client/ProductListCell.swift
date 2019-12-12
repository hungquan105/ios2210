//
//  ProductListCell.swift
//  client
//
//  Created by Quân on 12/12/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ProductListCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(pro: Product){
        lbName.text = pro.name
        lbDescription.text = pro.description
        lbPrice.text = pro.price
    }
    
}
