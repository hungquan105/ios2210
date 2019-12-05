//
//  MoreDetailViewController.swift
//  Buoi18
//
//  Created by Quân on 12/5/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class MoreDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var product:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        product = Product(id: "1", name: "iPhone 11 Pro Max", amount: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddToCart(_ sender: Any) {
        arrProductsInCart.append(self.product!)
        let alert = UIAlertController(title: "Thong Bao", message: "Them San Pham Thanh Cong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (finish) in
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let CartVC = sb.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
            self.present(CartVC, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension MoreDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AmountCell", for: indexPath) as! AmountCell
        cell.lbAmount.text = String(product!.amount)
        cell.didChangeAmount = { (amount) in
            self.product?.amount = amount
            self.tableView.reloadData()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

struct Product {
    let id:String
    let name:String
    var amount:Int
}
