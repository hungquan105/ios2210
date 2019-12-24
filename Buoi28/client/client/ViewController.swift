//
//  ViewController.swift
//  client
//
//  Created by Quân on 12/24/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        UserDefaults.standard.removeObject(forKey: "token")
        print("DID LOAD")
        // lay ra
        if UserDefaults.standard.object(forKey: "token") as? String != nil {
            let token = UserDefaults.standard.object(forKey: "token") as! String
            print(token)
            // url
            let url = URL(string: "http://localhost:3000/check")!
            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            // body
            let str = "token=\(token)"
            let data = str.data(using: .utf8)
            req.httpBody = data
            // data
            let task = URLSession.shared.dataTask(with: req) { (data, urlRes, err) in
                do {
                    // json
                    let json = try JSONDecoder.init().decode(Result.self, from: data!)
                    print(json.result)
                    // luu vao
                    if json.result == "Dang nhap thanh cong" {
                        DispatchQueue.main.async {
                            let scene = self.view.window?.windowScene?.delegate as! SceneDelegate
                            scene.login(isLoged: true)
                        }
                    }
                    
                } catch {
                    print("json err")
                }
            }
            task.resume()
        }
    }

    @IBAction func LOGIN(_ sender: Any) {
        // url
        let url = URL(string: "http://localhost:3000/login")!
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        // data
        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, err) in
            do {
                // json
                let token = try JSONDecoder.init().decode(Token.self, from: data!)
                print(token.token)
                // luu vao
                UserDefaults.standard.set(token.token, forKey: "token")
                DispatchQueue.main.async {
                    let scene = self.view.window?.windowScene?.delegate as! SceneDelegate
                    scene.login(isLoged: true)
                }
            } catch {
                print("json err")
            }
        }
        task.resume()
        
    }
    
}

struct Token:Codable {
    let token:String
}

struct Result:Codable {
    let result:String
}
