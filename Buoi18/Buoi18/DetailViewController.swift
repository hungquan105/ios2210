//
//  DetailViewController.swift
//  Buoi18
//
//  Created by Quân on 12/3/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbProductName: UILabel!
    var index:Int = 0
    let view1:UIView = UIView()
    let view2:UIView = UIView()
    
//    var product : Product
    var ProductName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbProductName.text = ProductName
    }
    
    @IBAction func Product(_ sender: Any) {
//        self.index = 0
//        self.tableView.reloadData()
        view1.isHidden = false
        view2.isHidden = true
    }
    
    @IBAction func Customer(_ sender: Any) {
        self.index = 1
        self.tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch index {
        case 0:
            return 3
        default:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch index {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath) as! CustomerCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
