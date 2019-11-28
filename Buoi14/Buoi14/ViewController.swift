//
//  ViewController.swift
//  Buoi14
//
//  Created by Quân on 11/21/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrProduct:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrProduct = [
            Product(name: "Apple iPhone", decription: "SmartPhone", price: "1000", quantity: 1, image: #imageLiteral(resourceName: "apple-iphone-11-1564393153")),
            Product(name: "Samsung Galaxy Note 10+", decription: "SmartPhone", price: "999", quantity: 1, image: #imageLiteral(resourceName: "637008702547566121_SS-note-10-pl-glow-1-1.png")),
            Product(name: "Apple Watch Series 5", decription: "SmartWatch", price: "888", quantity: 1, image: #imageLiteral(resourceName: "apple_watch_series_5_gps_space_gray_aluminum_44mm_sport_band_black_vertical_34r_us-en_screen_3")),
            Product(name: "Apple MacBook Air 2019", decription: "MacBook", price: "2000", quantity: 1, image: #imageLiteral(resourceName: "vpavic_190711_3549_0022")),
            Product(name: "Sony Bravia", decription: "SmartTV", price: "1999", quantity: 1, image: #imageLiteral(resourceName: "71mBfgzTfRL._SX355_")),
            Product(name: "Nokia 9.1 Plus", decription: "SmartPhone", price: "899", quantity: 1, image: #imageLiteral(resourceName: "hqdefault")),
            Product(name: "Canon EOS 5D", decription: "Camera", price: "1299", quantity: 1, image: #imageLiteral(resourceName: "1455749513_1225876")),
            Product(name: "Fujifilm X-A5", decription: "Camera", price: "1099", quantity: 1, image: #imageLiteral(resourceName: "ifjxa5p"))
        ]
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action1:UIContextualAction = UIContextualAction(style: .normal, title: "doSomeThing") { (_, self, nil) in
            print("doSomeThing")
        }
        action1.backgroundColor = .blue
        let action2:UIContextualAction = UIContextualAction(style: .normal, title: "Delete") { (_, self, nil) in
            print("Deleted")
        }
        action2.backgroundColor = .red
        let actions:UISwipeActionsConfiguration = UISwipeActionsConfiguration(actions: [action1,action2])
        return actions
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.bindData(pro: arrProduct[indexPath.row])
        
        cell.didChangeQuantity = { quan in
            self.arrProduct[indexPath.row].quantity = quan
            tableView.reloadData()
        }
        
//        cell.didPlus = { quan in
//
//            var a = quan + 1
//            self.arrProduct[indexPath.row].quantity = a
//            print(a)
//            tableView.reloadData()
////            cell.lbProductQuantity.text = String(a)
////            cell.quan += 1
////            cell.lbProductQuantity.text = String(cell.quan)
//        }
//
//        cell.didMinus = { quan in
//            if quan > 1 {
//            var a = quan - 1
//                self.arrProduct[indexPath.row].quantity = a
//                tableView.reloadData()
//            }
//
//        }
        
//        cell.textLabel?.text = String(indexPath.row)
//        cell.didGotoDetail = {
//            let Main_Storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let detailVC = Main_Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//            detailVC.index = String(indexPath.row)
//            self.present(detailVC, animated: true, completion: nil)
//        }
//        cell.btGotoDetail.tag = indexPath.row
//        cell.btGotoDetail.addTarget(self, action: #selector(gotoDetail), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    
//    @objc func gotoDetail(sender: UIButton){
//        let Main_Storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = Main_Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        detailVC.index = String(sender.tag)
//        self.present(detailVC, animated: true, completion: nil)
//    }
}

struct Product {
    let name:String
    let decription:String
    let price:String
    var quantity:Int
    let image:UIImage
}
