//
//  DetailViewController.swift
//  Buoi14
//
//  Created by Quân on 11/21/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var index:String = ""
    @IBOutlet weak var lbDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbDetail.text = index
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
