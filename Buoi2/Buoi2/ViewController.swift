//
//  ViewController.swift
//  Buoi2
//
//  Created by Quân on 10/26/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgAvatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ConvertImage(_ sender: Any) {
//        imgAvatar.image = UIImage(imageLiteralResourceName: "2")
//        imgAvatar.image = #imageLiteral(resourceName: "3")
//        imgAvatar.isHighlighted = true
//        imgAvatar.contentMode÷rRadius = 150
        
        // lay du lieu tu internet
        
        do {
            // URL
            let url:URL = URL(string: "https://previews.123rf.com/images/nadya76/nadya761710/nadya76171000157/88138840-floral-light-blue-beautiful-background-wallpapers-of-flowers-blue-white-peony-flower-composition-clo.jpg")!
            // DATA
            let data:Data = try Data(contentsOf: url)
            // IMAGE
            imgAvatar.image = UIImage(data: data)
        } catch {
            print("Data error")
        }
 
    }
    
    @IBAction func sldChangeCorner(_ sender: UISlider) {
        print(sender.value)
    }
    
}

