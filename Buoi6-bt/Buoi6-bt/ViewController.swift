//
//  ViewController.swift
//  Buoi6-bt
//
//  Created by Quân on 11/2/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count:Int = 0
    var T:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        T = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (_) in
            self.dropDown()
            self.count += 1
            print(self.count)
        }
    }
    
    func dropDown() {
        let rainDropView:UIImageView = UIImageView(frame: CGRect(x: CGFloat.random(in: 0...self.view.frame.width-50), y: -80, width: 50, height: 80))
        rainDropView.image = #imageLiteral(resourceName: "raindrop")
        self.view.addSubview(rainDropView)
        Timer.scheduledTimer(withTimeInterval: 0.0005, repeats: true) { (timer) in
            // Cau 1
//            rainDropView.frame.origin.y += 0.1
            // Cau 2
            if rainDropView.frame.origin.y >= self.view.frame.height {
                rainDropView.frame.origin.y = -80
                // Cau 3
                rainDropView.frame.origin.x = CGFloat.random(in: 0...self.view.frame.width-50)
                // Cau 4
                self.T.invalidate()
            } else {
                rainDropView.frame.origin.y += 0.1
            }
        }
    }


}

