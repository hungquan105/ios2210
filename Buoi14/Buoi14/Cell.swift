//
//  Cell.swift
//  Buoi14
//
//  Created by Quân on 11/21/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var lbProductName: UILabel!
    @IBOutlet weak var lbProductDescription: UILabel!
    @IBOutlet weak var lbProductPrice: UILabel!
    @IBOutlet weak var lbProductQuantity: UILabel!
//    var quan = 0
    
//    @IBOutlet weak var btGotoDetail: UIButton!
    // closure
    var didGotoDetail:(()->Void)! = nil
//    var didPlus:((_ quantity : Int)->Void)! = nil
//    var didMinus:((_ quantity : Int)->Void)! = nil
    var didChangeQuantity:((_ quantity: Int)->Void)! = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        lbProductQuantity.text = String(quan)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func Minus(_ sender: Any) {
        
        if didChangeQuantity != nil {
            let quan:Int = Int(lbProductQuantity.text!)! - 1
            didChangeQuantity(quan)
        }
//        if  didMinus != nil {
//            let quan:Int = Int(lbProductQuantity.text!)! - 1
//            didMinus(quan)
//        }
    }
    
    @IBAction func Plus(_ sender: Any) {
        if didChangeQuantity != nil {
            let quan:Int = Int(lbProductQuantity.text!)! + 1
            didChangeQuantity(quan)
        }
//        if  didPlus != nil {
//            didPlus(Int(lbProductQuantity.text!) ?? 0)
//        }
    }
    
    func bindData(pro: Product){
        self.imgv.image = pro.image
        self.lbProductName.text = pro.name
        self.lbProductDescription.text = pro.decription
        self.lbProductPrice.text = pro.price
        self.lbProductQuantity.text = String(pro.quantity)
    }
    
    

    //    @IBAction func GotoDetail(_ sender: Any) {
    //        // goi closure
    //        if didGotoDetail != nil {
    //            didGotoDetail()
    //        }
    //    }
}
