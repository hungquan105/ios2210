//
//  ViewController.swift
//  client
//
//  Created by Quân on 12/12/19.
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
        // POST
        // URL
        let url:URL = URL(string: "http://localhost:3001/login")!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
                // du lieu truyen len = String
//        let chuoi:String = String(format: "username=%@&password=%@", tfUsername.text!, tfPassword.text!)
            let chuoi:String = "username=\(tfUsername.text!)&password=\(tfPassword.text!)"
            print(chuoi)
                // data
            let body:Data = chuoi.data(using: .utf8)!
        req.httpBody = body
        // DATA
        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
            // JSON
            do {
                let json = try JSONDecoder.init().decode(BaseResponse.self, from: data!)
                if json.result {
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    let personVC = sb.instantiateViewController(withIdentifier: "PersonsViewController") as! PersonsViewController
                    personVC.arrPersons = json.data
                    DispatchQueue.main.async {
                        self.navigationController?.pushViewController(personVC, animated: true)
                    }
                } else {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Thong Bao", message: json.message, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                
            } catch {
                print("JSON error")
            }
        }
        task.resume()
        
    }
    
}

struct BaseResponse: Codable {
    let result: Bool
    let message: String
    let data: [Person]
}

struct Person: Codable {
    let id: String
    let name: String
    let age: Int
    let gender: String
}
