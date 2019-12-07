//
//  ViewController.swift
//  Buoi21
//
//  Created by Quân on 12/7/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrNews:[Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            // URL
            let url:URL = Bundle.main.url(forResource: "Data", withExtension: "json")!
            // DATA
            let data:Data = try Data(contentsOf: url)
            // JSON
//            let json = String(data: data, encoding: .utf8)
//            print(json)
            do {
                let json = try JSONDecoder.init().decode([Category].self, from: data)
//                print(json)
//                print(json[0].new[0].Noidung)
                arrNews = json
            } catch {
                print("JSON error")
            }
        } catch {
            print("Data error")
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrNews.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNews[section].new.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrNews[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.bindData(new: arrNews[indexPath.section].new[indexPath.row])
        return cell
    }
}
