//
//  ViewController.swift
//  Buoi3
//
//  Created by Quân on 10/29/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    var arrImages:[UIImage] = [#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0..<arrImages.count {
            // Buoc 2
            let imgv:UIImageView = UIImageView(frame: CGRect(x: i*120, y: 50, width: 120, height: 120))
            // Buoc 3
            imgv.image = arrImages[i]
            // Buoc 1
            view.addSubview(imgv)
        }
        
        
        
    }


}

