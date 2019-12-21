//
//  ViewController.swift
//  client
//
//  Created by Quân on 12/21/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LOGIN(_ sender: Any) {
        // url
        let url = URL(string: "http://localhost:3000/login")
        var req = URLRequest(url: url!)
        req.httpMethod = "POST"
            // body
        let str = "username=\(tfUsername.text!)&password=\(tfPassword.text!)"
        let data = str.data(using: .utf8)
        req.httpBody = data
        // data
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
            do {
                let json = try JSONDecoder.init().decode(BaseResponse.self, from: data!)
                if json.result {
                    print(json.message)
                } else {
                    print(json.message)
                }
            } catch {
                print("JSON error")
            }
        }
        task.resume()
        // json
    }
    
}

public struct BaseResponse:Codable {

        public var data : [Data]
        public var message : String
        public var result : Bool
        
}

public struct Data:Codable {

        public var EMAIL : String
        public var ID : String
        public var PASSWORD : String
        public var PHONENUMBER : String
        public var USERNAME : String
        
}
