//
//  ViewController.swift
//  client
//
//  Created by Quân on 1/2/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit
import Alamofire
import DKImagePickerController

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let name = "Quan Nguyen"
//        let parameter = [
//            "name" : name
//        ]
//
//        RequestService.shared.request("http://localhost:3000/test", .post, parameter, URLEncodedFormParameterEncoder.default, nil, BaseResponse.self) { (result, data, error) in
//            guard let data = data as? BaseResponse else {return}
//            print(data.data)
//        }
        
    }

    @IBAction func Choose(_ sender: Any) {
        let pickerController = DKImagePickerController()

        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
        }

        self.present(pickerController, animated: true) {}
    }
    
    @IBAction func Upload(_ sender: Any) {
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoItemCell", for: indexPath) as! PhotoItemCell
        
        return cell
    }

}

struct BaseResponse:Codable {
    let result:Bool
    let message:String
    let data:String
}
