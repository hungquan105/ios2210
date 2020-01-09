//
//  ViewController.swift
//  client
//
//  Created by Quân on 1/9/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {

    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    var socket:SocketIOClient! = nil
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socket = manager.defaultSocket
        
        socket.on("welcome", callback: { (data, ack) in
            guard let data = data[0] as? String else {return}
            print(data)
        })
        
        socket.connect()
    }

    @IBAction func Click(_ sender: Any) {
        index += 1
        socket.emit("Plus", index)
    }
    
}

