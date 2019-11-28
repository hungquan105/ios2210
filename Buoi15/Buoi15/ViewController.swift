//
//  ViewController.swift
//  Buoi15
//
//  Created by Quân on 11/23/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrFilm:[TheLoaiPhim] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arrFilm = [
            TheLoaiPhim(theloai: "Hanh Dong", phim: [
                PhimAnh(ten: "abc", quocgia: "My", nam: "2000", daodien: "Mr.abc"),
                PhimAnh(ten: "xyz", quocgia: "Viet Nam", nam: "2005", daodien: "Mr.xyz")
            ]),
            TheLoaiPhim(theloai: "Tinh Cam", phim: [
                PhimAnh(ten: "aaa", quocgia: "Trung Quoc", nam: "1999", daodien: "Mr.aaa"),
                PhimAnh(ten: "bbb", quocgia: "Thai Lan", nam: "2010", daodien: "Mr.bbb"),
                PhimAnh(ten: "ccc", quocgia: "Lao", nam: "2019", daodien: "Mr.ccc")
            ])
        ]
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrFilm.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
            cell.textLabel?.text = arrFilm[section].theloai
            cell.backgroundColor = .red
            cell.textLabel?.textAlignment = .center
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell") as! SecondCell
            cell.textLabel?.text = arrFilm[section].theloai
            cell.backgroundColor = .blue
            cell.textLabel?.textAlignment = .right
            cell.textLabel?.textColor = .red
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFilm[section].phim.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
            cell.textLabel?.text = arrFilm[indexPath.section].phim[indexPath.row].ten
            cell.imgv.image = #imageLiteral(resourceName: "1455749513_1225876")
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondCell
            cell.textLabel?.text = arrFilm[indexPath.section].phim[indexPath.row].ten
//            cell?.imgv.image = #imageLiteral(resourceName: "1455749513_1225876")
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

struct TheLoaiPhim {
    let theloai:String
    let phim:[PhimAnh]
}

struct PhimAnh {
    let ten:String
    let quocgia:String
    let nam:String
    let daodien:String
}
