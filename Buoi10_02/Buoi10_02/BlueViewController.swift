//
//  BlueViewController.swift
//  Buoi10_02
//
//  Created by Quân on 11/12/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit
protocol BlueVCDelegate: NSObjectProtocol {
    func doSomethingWith(data: String)
}
class BlueViewController: UIViewController {

    weak var delegate:BlueVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PREVIOUS(_ sender: Any) {
        if let delegate = delegate {
            delegate.doSomethingWith(data: "John Cena")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ROOT(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func VIEWCONTROLLER(_ sender: Any) {
        let YellowVC = self.navigationController?.viewControllers[1]
        self.navigationController?.popToViewController(YellowVC!, animated: true)
    }
   
}
