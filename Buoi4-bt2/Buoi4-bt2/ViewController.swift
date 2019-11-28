//
//  ViewController.swift
//  Buoi4-bt2
//
//  Created by Quân on 10/31/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var width:CGFloat = 0
    var height:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        width = 100
        height = 150
        for i in 0..<Int(self.view.frame.width / width) {
            
            for j in 0..<Int(self.view.frame.height / height) {
                let imgv:UIImageView = UIImageView(frame: CGRect(x: CGFloat(i)*width, y: CGFloat(j)*height, width: width, height: height))
                imgv.image = #imageLiteral(resourceName: "bau")
                view.addSubview(imgv)
            }
            
//            let imgv:UIImageView = UIImageView(frame: CGRect(x: CGFloat(i)*width, y: 0, width: width, height: height))
//            imgv.image = #imageLiteral(resourceName: "bau")
//            view.addSubview(imgv)
        }
        
    }


}

