//
//  PersonCell.swift
//  client
//
//  Created by Quân on 12/12/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(person: Person){
        lbName.text = person.name
        lbAge.text = String(person.age)
        lbGender.text = person.gender
    }
    
}
