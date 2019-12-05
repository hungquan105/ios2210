//
//  ViewController.swift
//  Buoi20
//
//  Created by Quân on 12/5/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            // URL
            let url:URL = Bundle.main.url(forResource: "Demo", withExtension: "json")!
            // Data
            let data:Data = try Data(contentsOf: url)
            // Code
            print(String(data: data, encoding: .utf8))
        } catch {
            print("JSON error")
        }
    }


}

