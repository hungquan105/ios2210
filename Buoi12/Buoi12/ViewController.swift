//
//  ViewController.swift
//  Buoi12
//
//  Created by Quân on 11/16/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrShoes:[Shoe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrShoes = [
            Shoe(style: "Giay Tay", color: .black, height: 100),
            Shoe(style: "Giay Da Bong", color: .white, height: 150),
            Shoe(style: "Giay Cao Got", color: .systemPink, height: 200)
        ]
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrShoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as! ColorCell
//        cell.textLabel?.text = arrShoes[indexPath.row].style
        cell.backgroundColor = arrShoes[indexPath.row].color
//        cell.tfAvatar.text = arrShoes[indexPath.row].style
//        cell.imgv.image = arrShoes[indexPath.row].image
        cell.bindData(shoe: arrShoes[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return arrShoes[indexPath.row].height
    }
}

struct Shoe {
    var style:String
    var color:UIColor
    var height:CGFloat
}
