//
//  YellowViewController.swift
//  Buoi9
//
//  Created by Quân on 11/9/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("YELLOW DID LOAD")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("YELLOW WILL APPEAR")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("YELLOW DID APPEAR")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("YELLOW WILL DISAPPEAR")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("YELLOW DID DISAPPEAR")
    }
    
    @IBAction func BACK(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
