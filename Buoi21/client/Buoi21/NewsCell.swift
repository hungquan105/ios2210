//
//  NewsCell.swift
//  Buoi21
//
//  Created by Quân on 12/7/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(new : New){
        lbTitle.text = new.tieude
        lbContent.text = new.Noidung
        // image
        do {
            let url:URL = URL(string: new.imgURL)!
            let data:Data = try Data(contentsOf: url)
            imgv.image = UIImage(data: data)
        } catch {
            print("image error")
        }
    }
}
