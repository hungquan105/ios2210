//
//  LoginViewController.swift
//  Buoi11
//
//  Created by Quân on 11/14/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class LoginViewController: TransparentNavigationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func Login(_ sender: Any) {
        // sceneDelegate
        let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        // goi func
        sceneDelegate.Login()
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
