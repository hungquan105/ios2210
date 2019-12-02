//
//  ViewController.swift
//  Buoi1
//
//  Created by Quân on 10/24/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func trigged(_ sender: Any) {
        print("trigged")
    }
    @IBAction func exit(_ sender: UITextField) {
        print("exit")
    }
    @IBAction func change(_ sender: UITextField) {
        print("change")
    }
    @IBAction func begin(_ sender: Any) {
        print("begin")
    }
    @IBAction func end(_ sender: Any) {
        print("end")
    }
    
    @IBOutlet weak var tfNumber01: UITextField!
    
    @IBOutlet weak var tfNumber02: UITextField!
    
    @IBOutlet weak var lbResult: UILabel!
    
    @IBOutlet weak var btSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Cong(_ sender: UIButton) {
        KiemTra(toantu: "+")
    }
    
    @IBAction func Tru(_ sender: UIButton) {
        KiemTra(toantu: "-")
    }
    @IBAction func Nhan(_ sender: UIButton) {
        KiemTra(toantu: "*")
    }
    @IBAction func Chia(_ sender: UIButton) {
        KiemTra(toantu: "/")
    }
    @IBAction func PhanTram(_ sender: UIButton) {
        KiemTra(toantu: "%")
    }
    func KiemTra(toantu:String) {
        if Double(tfNumber01.text!) != nil && Double(tfNumber02.text!) != nil {
            let so1:Double = Double(tfNumber01.text!)!
            let so2:Double = Double(tfNumber02.text!)!
            let equation:String = "\(so1) \(toantu) \(so2)"
            let expr = NSExpression(format: equation)
            if let result = expr.expressionValue(with: nil, context: nil) as? Double {
                print(result) // -0.25
            } else {
                print("failed")
            }
//            let so1:Int = Int(tfNumber01.text!)!
//            let so2:Int = Int(tfNumber02.text!)!
//            switch toantu {
//            case "+":
//                lbResult.text = String(so1+so2)
//            case "-":
//                lbResult.text = String(so1-so2)
//            case "*":
//                lbResult.text = String(so1*so2)
//            case "/":
//                lbResult.text = String(Float(so1)/Float(so2))
//            case "%":
//                lbResult.text = String(so1 % so2)
//            default:
//                print("Phep toan sai")
//            }
            
        }
        else
        {
            let alert:UIAlertController = UIAlertController(title: "Warning", message: "Nhap sai", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) in
                self.tfNumber01.text = ""
                self.tfNumber02.text = ""
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
}

