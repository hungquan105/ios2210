//
//  YellowViewController.swift
//  Buoi10_02
//
//  Created by Quân on 11/12/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController, BlueVCDelegate {
    
    func doSomethingWith(data: String) {
        print(data)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoToBlue(_ sender: Any) {
        //storyboard
        
        //VC
        let BlueVC = Main_storyboard.instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
        BlueVC.delegate = self
        //gotoBlue
        self.navigationController?.pushViewController(BlueVC, animated: true)
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
