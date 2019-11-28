//
//  ViewController.swift
//  Buoi4-bt1
//
//  Created by Quân on 10/31/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    var timer2:Timer = Timer()
    var count:Int = 0
    
    let HanhDong:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        HanhDong.frame = CGRect(x: 200, y: 400, width: 70, height: 50)
        HanhDong.setTitle("Click", for: .normal)
        HanhDong.setTitleColor(.red, for: .normal)
        HanhDong.addTarget(self, action: #selector(Action), for: .touchUpInside)
        view.addSubview(HanhDong)
    }
    
    @objc func Action(){
        self.imgView.frame.origin.y = 600
    }

    @IBAction func Rotate(_ sender: UIButton) {
//        UIView.animate(withDuration: 2.0) {
//            self.imgView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//        }
//        UIView.animate(withDuration: 2.0) {
//            self.imgView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
//        }
        
//        let rotate:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
//        rotate.fromValue = 0
//        rotate.toValue = 6.28
//        rotate.duration = 3
//        rotate.repeatCount = 5
//        rotate.isCumulative = true
//        imgView.layer.add(rotate, forKey: nil)
        
//        Timer.scheduledTimer(withTimeInterval: 0.1,
//                             repeats: true) { (timer1) in
////                                self.imgView.frame.origin.y += 1
//                                self.imgView.transform = self.imgView.transform.rotated(by: .pi/180)
//
//                                let imgv:UIImageView = UIImageView(frame: CGRect(x: x, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
//                                self.x += width
//                                if self.count == 360 {
//                                    timer1.invalidate()
//                                    self.x = 0
//                                    self.y += height
//                                    self.TimerFire()
//                                }
//        }
        
        
        self.TimerFire()
        
        
        self.timer2 = Timer.scheduledTimer(timeInterval: 0.1,
                             target: self,
                             selector: #selector(Xoay),
                             userInfo: nil,
                             repeats: true)
        
    }
    
//    func TimerFire(){
//        Timer.scheduledTimer(withTimeInterval: 0.1,
//                                     repeats: true) { (timer1) in
//        //                                self.imgView.frame.origin.y += 1
//                                        self.imgView.transform = self.imgView.transform.rotated(by: .pi/180)
//
//                                        let imgv:UIImageView = UIImageView(frame: CGRect(x: x, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
//                                        self.x += width
//                                        if self.count == 360 {
//                                            timer1.invalidate()
//                                            self.x = 0
//                                            self.y += height
//                                            self.TimerFire()
//                                        }
//                }
//    }
    
    @objc func Xoay(){
        self.imgView.transform = self.imgView.transform.rotated(by: .pi/180)
        self.count += 1
        if self.count == 360 {
            self.timer2.invalidate()
        }
    }
    
    @IBAction func Lat(_ sender: UIButton) {
        UIView.animate(withDuration: 3) {
            self.imgView.transform = CGAffineTransform(scaleX: -1, y: -1)
        }
    }
    
}

