//
//  ViewController.swift
//  Buoi18
//
//  Created by Quân on 12/3/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

let Main = UIStoryboard(name: "Main", bundle: nil)

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrCategory:[Category] = []
    
    var arrProduct:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arrCategory = [
            Category(id: "0", productList: [
                Product(id: "0", name: "Item 1"),
                Product(id: "1", name: "Item 2"),
                Product(id: "2", name: "Item 3"),
                Product(id: "3", name: "Item 4"),
                Product(id: "4", name: "Item 5"),
                Product(id: "5", name: "Item 6"),
                Product(id: "6", name: "Item 7"),
                Product(id: "7", name: "Item 8"),
                Product(id: "8", name: "Item 9"),
                Product(id: "9", name: "Item 10")
            ]),
            Category(id: "1", productList: [
                Product(id: "10", name: "Item 11"),
                Product(id: "11", name: "Item 12"),
                Product(id: "12", name: "Item 13"),
                Product(id: "13", name: "Item 14"),
                Product(id: "14", name: "Item 15"),
                Product(id: "15", name: "Item 16")
            ]),
            Category(id: "2", productList: [
                Product(id: "20", name: "Item 21"),
                Product(id: "21", name: "Item 22"),
                Product(id: "22", name: "Item 23"),
                Product(id: "23", name: "Item 24"),
                Product(id: "24", name: "Item 25"),
                Product(id: "25", name: "Item 26"),
                Product(id: "26", name: "Item 27"),
                Product(id: "27", name: "Item 28")
            ])
        ]
        
        fillProductList(id: arrCategory[0].id)
    }

    func fillProductList(id : String) {
        self.arrProduct = self.arrCategory.filter { $0.id.contains(id) }.first!.productList
        self.tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerCell
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.arrCategory = self.arrCategory
            cell.didSelectCategory = { (id) in
                print(id)

                self.fillProductList(id: id)
                
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell", for: indexPath) as! ProductListCell
            
            //
            cell.arrProduct = self.arrProduct
            cell.collectionView.reloadData()
            
            cell.didGoToDetail = { (pro) in
                let detailVC = Main.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                detailVC.ProductName = pro.name
                
                self.present(detailVC, animated: true, completion: nil)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 157
        case 1:
            return 58
        default:
            return 575
        }
    }
}

struct Category {
    let id:String
    let productList:[Product]
}

struct Product {
    let id:String
    let name:String
}
