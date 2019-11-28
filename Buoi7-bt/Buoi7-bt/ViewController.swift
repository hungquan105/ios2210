//
//  ViewController.swift
//  Buoi7-bt
//
//  Created by Quân on 11/5/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var xingau1 : UIImageView = UIImageView(frame: CGRect(x: 200, y: 155, width: 100, height: 100))
    var xingau2 : UIImageView = UIImageView(frame: CGRect(x: 400, y: 155, width: 100, height: 100))
    var xingau3 : UIImageView = UIImageView(frame: CGRect(x: 600, y: 155, width: 100, height: 100))
    var arrImages : [UIImage] = [#imageLiteral(resourceName: "ca"), #imageLiteral(resourceName: "nai"), #imageLiteral(resourceName: "tom"), #imageLiteral(resourceName: "bau"),#imageLiteral(resourceName: "ga"),#imageLiteral(resourceName: "cua")]
    var player : AVAudioPlayer?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        welcome()
        Trochoi()
        
//        for i in 0...7 {
//            for j in 0...7 {
//                let Width:CGFloat = view.frame.height/8
//                let square:UIButton = UIButton(frame: CGRect(x: CGFloat(i)*Width+100, y: CGFloat(j)*Width, width: Width, height: Width))
//                if i % 2 == 0 && j % 2 != 0 || i % 2 != 0 && j % 2 == 0  {
//                    square.backgroundColor = .black
//                }
//                square.tag = i*8+j+1
////                print(square.tag)
//                square.addTarget(self, action: #selector(Action), for: .touchUpInside)
//                view.addSubview(square)
//            }
//        }
        
    }
    
//    @objc func Action(sender: UIButton){
//        print(sender.tag)
//    }
    
    func welcome(){
        let nenWelcome : UIImageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        nenWelcome.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        nenWelcome.image = #imageLiteral(resourceName: "com.boyaa.hallgame3h_vtn")
        self.view.addSubview(nenWelcome)
        self.view.backgroundColor = .black
        UIView.animate(withDuration: 3, delay: 2, options: .curveEaseOut, animations: {
            self.view.backgroundColor = .white
            nenWelcome.alpha = 0.0
        }, completion: nil)
    }
    
    func Trochoi(){
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (timer) in
            let nenTrochoi : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 896, height: 414))
            nenTrochoi.image = #imageLiteral(resourceName: "Mẹo-chơi-Bầu-Cua-Tôm-Cá-dễ-thắng-nhất")
            self.view.addSubview(nenTrochoi)
            self.xingau1.image = #imageLiteral(resourceName: "com.boyaa.hallgame3h_vtn")
            self.view.addSubview(self.xingau1)
            self.xingau2.image = #imageLiteral(resourceName: "com.boyaa.hallgame3h_vtn")
            self.view.addSubview(self.xingau2)
            self.xingau3.image = #imageLiteral(resourceName: "com.boyaa.hallgame3h_vtn")
            self.view.addSubview(self.xingau3)
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        playmusic()
        let rotate : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotate.fromValue = 0
        rotate.toValue = 6.28
        rotate.duration = 0.5
        rotate.repeatCount = 4
        rotate.isCumulative = true
        self.xingau1.layer.add(rotate, forKey: nil)
        self.xingau2.layer.add(rotate, forKey: nil)
        self.xingau3.layer.add(rotate, forKey: nil)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
//            let random1 : Int = Int.random(in: 0...5)
//            let random2 : Int = Int.random(in: 0...5)
//            let random3 : Int = Int.random(in: 0...5)
            self.xingau1.image = self.arrImages.randomElement()
            self.xingau2.image = self.arrImages.randomElement()
            self.xingau3.image = self.arrImages.randomElement()
            
        }
    }
    
    func playmusic(){
        let musicurl =  Bundle.main.url(forResource: "1", withExtension: "wav")
        do {
            try player = AVAudioPlayer(contentsOf: musicurl!)
        } catch {
            print("error")
        }
        player?.play()
    }


}

