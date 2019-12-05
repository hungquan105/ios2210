//
//  ProductsInCartCell.swift
//  Buoi19
//
//  Created by Quân on 12/5/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ProductsInCartCell: UITableViewCell {

    @IBOutlet weak var nonProductView: UIView!
    @IBOutlet weak var ProductListView: UIView!
    @IBOutlet weak var lbProductName: UILabel!
    @IBOutlet weak var lbAmount: UILabel!
    
    var didChangeAmount:((_ amount: Int)->Void)! = nil
    var didRemoveProduct:(()->Void)! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(pro:Product) {
        lbProductName.text = pro.name
        lbAmount.text = String(pro.amount)
    }

    @IBAction func ChooseProduct(_ sender: Any) {
        
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
    
    @IBAction func Delete(_ sender: Any) {
        if didRemoveProduct != nil {
            didRemoveProduct()
        }
    }
}
