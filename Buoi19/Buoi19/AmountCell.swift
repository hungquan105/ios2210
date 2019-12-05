//
//  AmountCell.swift
//  Buoi18
//
//  Created by Quân on 12/5/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class AmountCell: UITableViewCell {

    @IBOutlet weak var lbAmount: UILabel!
    
    var didChangeAmount:((_ amount: Int)->Void)! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func Plus(_ sender: Any) {
        let amount = Int(lbAmount.text!)! + 1
        if didChangeAmount != nil {
            didChangeAmount(amount)
        }
    }
    
    
    @IBAction func Minus(_ sender: Any) {
        let amount = Int(lbAmount.text!)! - 1
        if didChangeAmount != nil {
            didChangeAmount(amount)
        }
    }
}
