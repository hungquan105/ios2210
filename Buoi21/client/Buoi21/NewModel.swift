//
//  NewModel.swift
//  Buoi21
//
//  Created by Quân on 12/7/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import Foundation

struct Category:Codable {
    let id:String
    let title:String
    let new:[New]
}

struct New:Codable {
    let tieude:String
    let Noidung:String
    let imgURL:String
}
