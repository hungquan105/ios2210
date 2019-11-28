//
//  ViewController.swift
//  Buoi10
//
//  Created by Quân on 11/12/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, YellowVCDelegate {
    
    func doSomeThingWith(data: String) {
        lbAge.text = data
    }

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lbAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GoToYellow(_ sender: Any) {
        performSegue(withIdentifier: "MainVCtoYellowVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainVCtoYellowVC" {
            let YellowVC = segue.destination as! YellowViewController
            YellowVC.name = tfName.text!
            YellowVC.delegate = self
        }
    }
    
    @IBAction func Next(_ sender: Any) {
//        performSegue(withIdentifier: "MainVCtoYellowVC", sender: self)
        let Main_Storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let YellowVC = Main_Storyboard.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
        YellowVC.name = tfName.text!
        self.present(YellowVC, animated: true, completion: nil)
        
    }
}

