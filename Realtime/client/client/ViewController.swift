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

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfContent: UITextField!
    
    var arrContents:[Contents] = []
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
        
        socket.on("server-send") { (data, ack) in
            guard let data = data[0] as? String else {return}
            print(data)
            self.arrContents.append(Contents(id: "server", data: data))
            self.tableView.reloadData()
        }
        
//        socket.on("send-myself") { (data, ack) in
//            guard let data = data[0] as? String else {return}
//            print(data)
//            self.arrContents.append(Contents(id: "myself", data: data))
//            self.tableView.reloadData()
//        }
        
        socket.connect()
    }

    @IBAction func Send(_ sender: Any) {
        socket.emit("client-send", tfContent.text!)
        self.arrContents.append(Contents(id: "myself", data: tfContent.text!))
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
        cell.lbContent.text = arrContents[indexPath.row].data
        if arrContents[indexPath.row].id == "server" {
            cell.lbContent.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16).isActive = true
        } else {
            cell.lbContent.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16).isActive = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct Contents {
    let id:String
    let data:String
}
