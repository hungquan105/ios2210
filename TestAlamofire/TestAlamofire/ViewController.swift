//
//  ViewController.swift
//  TestAlamofire
//
//  Created by Quân on 12/26/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Alamofire.request("http://localhost:3000/login")
    }


}

