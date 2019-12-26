//
//  ViewController.swift
//  Buoi29
//
//  Created by Quân on 12/26/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let url = URL(string: "http://localhost:3000/login")
    
    let request = RequestService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func REQUEST(_ sender: Any) {
        
        RequestService.shared.request("http://localhost:3000/login", .get, ["":""], URLEncodedFormParameterEncoder.default, nil, Token.self) { (result, json, error) in
            if result {
                guard let json = json as? Token else {
                    return
                }
                print(json.token)
            }
        }
        
    }
    
}

struct Token:Codable {
    let token:String
}
