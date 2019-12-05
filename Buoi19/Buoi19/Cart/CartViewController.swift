//
//  CartViewController.swift
//  Buoi19
//
//  Created by Quân on 12/5/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var lbNumberOfProductsInCart: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print(arrProductsInCart.count)
        ChangeNumberOfProductsInCart()
        // Do any additional setup after loading the view.
    }
    
    func ChangeNumberOfProductsInCart(){
        var total:Int = 0
        for i in arrProductsInCart {
            total += i.amount
        }
        lbNumberOfProductsInCart.text = "Ban Co \(total) San Pham Trong Gio Hang"
    }
   
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return arrProductsInCart.count > 0 ? arrProductsInCart.count : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsInCartCell", for: indexPath) as! ProductsInCartCell
            cell.didChangeAmount = { (amount) in
                arrProductsInCart[indexPath.row].amount = amount
                self.ChangeNumberOfProductsInCart()
                self.tableView.reloadData()
            }
            cell.didRemoveProduct = {
                arrProductsInCart.remove(at: indexPath.row)
                self.ChangeNumberOfProductsInCart()
                self.tableView.reloadData()
            }
            if arrProductsInCart.count > 0 {
                cell.nonProductView.isHidden = true
                cell.ProductListView.isHidden = false
                cell.bindData(pro: arrProductsInCart[indexPath.row])
            } else {
                cell.nonProductView.isHidden = false
                cell.ProductListView.isHidden = true
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 200 : 150
    }
}
