//
//  ViewController.swift
//  client
//
//  Created by Quân on 12/10/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbApp: UILabel!
    
    var arrProducts:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // URL
        let url:URL = URL(string: "http://localhost:3000/android")!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        // DATA
        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
            let str:String = String(data: data!, encoding: .utf8)!
            print(str)
            // JSON
            do {
                let json = try JSONDecoder.init().decode([Product].self, from: data!)
//                print(json.name)
                
                DispatchQueue.main.async {
                    self.arrProducts = json
                    self.tableView.reloadData()
                }
                
            } catch {
                print("JSON error")
            }
        }
        task.resume()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell", for: indexPath) as! ProductListCell
        cell.bindData(pro: arrProducts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

struct Product: Codable {
    let name: String
    let description: String
    let price: String
}

struct app: Codable {
    let name: String
    let duration: Int
}
