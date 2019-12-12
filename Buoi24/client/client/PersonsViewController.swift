//
//  PersonsViewController.swift
//  client
//
//  Created by Quân on 12/12/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class PersonsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrPersons:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension PersonsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        cell.bindData(person: arrPersons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 127
    }
}
