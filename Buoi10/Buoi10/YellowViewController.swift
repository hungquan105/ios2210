//
//  YellowViewController.swift
//  Buoi10
//
//  Created by Quân on 11/12/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

protocol YellowVCDelegate: NSObjectProtocol {
    func doSomeThingWith(data: String)
}

class YellowViewController: UIViewController {

    var name:String = ""
    weak var delegate:YellowVCDelegate?
    
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var lbName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbName.text = name
        print(name)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Bacj(_ sender: Any) {
        if let delegate = delegate {
            delegate.doSomeThingWith(data: tfAge.text!)
        }
        self.dismiss(animated: true, completion: nil)
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
