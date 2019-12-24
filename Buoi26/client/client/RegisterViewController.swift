//
//  RegisterViewController.swift
//  client
//
//  Created by Quân on 12/21/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhonenNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func REGISTER(_ sender: Any) {
        
    }
    
    func register(isCheck:Bool){
        // url
        let url = URL(string: "http://localhost:3000/register")
        var req = URLRequest(url: url!)
        req.httpMethod = "POST"
            // body
        let str = "username=\(tfUsername.text!)&password=\(tfPassword.text!)&email=\(tfEmail.text!)&phonenumber=\(tfPhonenNumber.text!)"
        let data = str.data(using: .utf8)
        req.httpBody = data
        // data
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
            // json
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
        
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("END EDIT")
    }
}
