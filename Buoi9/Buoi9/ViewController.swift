//
//  ViewController.swift
//  Buoi9
//
//  Created by Quân on 11/9/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("RED DID LOAD")
        
        // Do any additional setup after loading the view.
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        print("RED WILL APPEAR")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("RED DID APPEAR")
        UIView.animate(withDuration: 3, animations: {
            self.view.backgroundColor = .red
        }) { (_) in
            // xac dinh storyboard
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            // xac dinh man hinh vang - storyboard ID
            let yellowVC = storyboard.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
            // go to yellow screen
            self.present(yellowVC, animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("RED WILL DISAPPEAR")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("RED DID DISAPPEAR")
    }
}

