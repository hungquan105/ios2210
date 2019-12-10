//
//  ViewController.swift
//  client
//
//  Created by Quân on 12/10/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbApp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // URL
        let url:URL = URL(string: "http://localhost:3000/ios")!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        // DATA
        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
            let str:String = String(data: data!, encoding: .utf8)!
            print(str)
            // JSON
            do {
                let json = try JSONDecoder.init().decode(app.self, from: data!)
                print(json.name)
                
                DispatchQueue.main.async {
                    self.lbApp.text = json.name
                }
                
            } catch {
                print("JSON error")
            }
        }
        task.resume()
        
    }

}

struct app: Codable {
    let name: String
    let duration: Int
}
