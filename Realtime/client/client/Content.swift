//
//  Content.swift
//  client
//
//  Created by Quân on 1/14/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class Content: UILabel {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let insets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width = contentSize.width + 20
        return contentSize
    }

}
